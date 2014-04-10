include apt

# Update Apt before installing packages
Class['apt::update'] -> Package <| |>

# Important utilities
package {
  ['pbuilder',
   'ubuntu-dev-tools']:
  ensure => latest
}

class { 'Pkgsign':
  user => 'vagrant',
  fullname => 'Alastair Rankine',
  email => 'alastair@girtby.net'
}

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

exec { 'pbuilder-create':
  creates => '/var/cache/pbuilder/base.tgz',
  command => 'pbuilder create --components "main universe"',
  timeout => 500,
  require => Package['pbuilder'],
  #refresh => 'sudo pbuilder update',
}

# TODO: get the latest security updates before calling pbuilder create?

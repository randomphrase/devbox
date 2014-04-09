include apt

# Update Apt before installing packages
Class['apt::update'] -> Package <| |>

# Important utilities
package {
  ['curl',
   'make',
   'ubuntu-dev-tools']:
  ensure => latest
}

class { 'Pkgsign':
  user => 'vagrant',
  fullname => 'Alastair Rankine',
  email => 'alastair@girtby.net'
}

# TODO:
# apt-get upgrade -y
# sudo pbuilder create --components "main universe"

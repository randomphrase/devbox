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

include pkgsign

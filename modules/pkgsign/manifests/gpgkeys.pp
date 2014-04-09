class gpgkeys ($user)
{
  $home = "/home/$user"
  $gnupg = "$home/.gnupg"

  file { "$gnupg":
    ensure => directory,
    owner  => "$user"
  }

  # TODO: combine these two somehow
  #
  file { "$gnupg/pubring.gpg":
    ensure => file,
    owner  => "$user",
    source => "puppet:///modules/pkgsign/pubring.gpg"
  }
  #
  file { "$gnupg/secring.gpg":
    ensure => file,
    owner  => "$user",
    source => "puppet:///modules/pkgsign/secring.gpg"
  }
}

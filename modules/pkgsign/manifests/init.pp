class pkgsign {

  $user = 'vagrant'
  $home = "/home/$user"
  $gnupg = "$home/.gnupg"

  file { "$gnupg":
    ensure => directory,
    owner  => "$user"
  }

  file { "$gnupg/pubring.gpg":
    ensure => file,
    owner  => "$user",
    source => "puppet:///modules/pkgsign/pubring.gpg"
  }
  
  file { "$gnupg/secring.gpg":
    ensure => file,
    owner  => "$user",
    source => "puppet:///modules/pkgsign/secring.gpg"
  }
  
  file { "/etc/environment":
    content => inline_template("DEBFULLNAME=Alastair\nUBUMAIL=alastair@girtby.net\nDEBEMAIL=alastair@girtby.net")
  }

}

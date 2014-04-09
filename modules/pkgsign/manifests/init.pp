class pkgsign ($user, $fullname, $email)
{
  class { 'gpgkeys':
    user => $user
  }

  class { 'devenv':
    fullname => $fullname,
    email => $email
  }
}


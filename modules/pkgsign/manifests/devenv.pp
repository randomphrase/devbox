class devenv ($fullname, $email) {
  
  file { "/etc/environment":
    # FIXME: clean this up
    content => inline_template("DEBFULLNAME=\"$fullname\"\nUBUMAIL=$email\nDEBEMAIL=$email\n")
  }

}

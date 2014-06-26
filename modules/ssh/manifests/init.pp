class ssh {
  include ssh::install, ssh::config, ssh::service
}

class ssh::install {
  package { "ssh":
    ensure => present,
  }
}

class ssh::config {

}

class ssh::service {

}

Class["ssh::install"] -> Class["ssh::config"] -> Class["ssh::service"]

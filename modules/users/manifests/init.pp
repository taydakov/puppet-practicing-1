class users {
  user { 'levka':
    ensure => 'present',
    groups => ['sudo', 'ubuntu'],
    home => '/home/levkahome',
    managehome => true,
    password => '$1$vb1tLY1q$y9/uOADRI2EL1bXIAD49k0', # levka
    shell => '/bin/bash',
  } ->
  user { 'ubuntu':
    ensure => 'present',
  }

  file { '/home/levkahome':
    ensure => directory,
    owner => 'levka',
    group => 'levka',
    mode => 755,
    source => 'puppet:///modules/users/levka',
    recurse => remote,
    require => User['levka'],
  }

  ssh_authorized_key { 'levka':
    ensure => 'present',
    user => 'levka',
    type => 'rsa',
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCvwkodN7dAkKqJ0JnJKJQMZN0MZGAuQjnIm6ieZaQOkq+mRWTMgHiZALB8cm3HzkUOhdkKdFalNY3Axhp3vQGUSnj11NgGDu5npUjluffdLgAFwi+bbYHjyifOp2RdDZHPEbBinStQbv37qCMpZzB1Fo0T1yBO3zG4l8bpBj3V7koqZ4Y8dhxMI/WrFCs8JfdGH7igRIANLTbTYSxOqva9r5wEpAhh0/wgWeJEUYzkSAlqEH16Hdvzsu7CyoYk2NfrrhZMfnFhLNtPyyoCUSRoKKUMQJGwxpzng8psOHZ1lQBDsMrgz9o1caYcmB0I6H9v6ByUJPVWfaHv1ruFNTyH',
  }
}

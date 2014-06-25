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
}

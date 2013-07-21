class { 'oracle_jdk': 
  name => 'oracle-java6-installer'
}

exec { 'apt_get_update':
  command => '/usr/bin/apt-get update'
}

Exec['apt_get_update'] -> Class['oracle_jdk']

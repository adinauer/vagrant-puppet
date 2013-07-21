# global definition of executable paths
Exec {
  path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ]
}

class { 'oracle_jdk': 
  name => 'oracle-java6-installer'
}

exec { 'apt-get update':
  command => 'apt-get update'
}

Exec['apt-get update'] -> Class['oracle_jdk']

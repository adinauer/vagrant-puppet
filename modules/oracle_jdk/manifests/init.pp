class oracle_jdk($name) {
  include apt

  $oracle_jdk_repo = 'ppa:webupd8team/java'

  Apt::Ppa[$oracle_jdk_repo] -> Exec['accept_oracle_license'] -> Package['oracle-installer']

  apt::ppa { $oracle_jdk_repo: }

  exec { 'accept_oracle_license':
    command => 'echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections',
    path    => '/usr/bin/:/bin/',
    logoutput => true
  }

  package { 'oracle-installer':
    name   => $name,
    ensure => present
  }
}

# global definition of executable paths
Exec {
	path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ]
}

file { 'link gradle':
	path   => '/usr/bin/gradle',
	ensure => 'link',
	target => '/opt/tools/gradle/gradlew'
}

exec { 'gradle hello world':
	command => 'gradle -b /opt/tools/gradle/build.gradle helloWorld',
	require => File['link gradle']
}
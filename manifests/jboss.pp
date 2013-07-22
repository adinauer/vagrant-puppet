# global definition of executable paths
Exec {
	path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ]
}

define gradle($task) {
	file { 'link gradle':
		path   => '/usr/bin/gradle',
		ensure => 'link',
		target => '/opt/tools/gradle/gradlew'
	}

	exec { 'gradle task':
		command => "gradle $task",
		require => File['link gradle']
	}
}

gradle { 'hello world':
	task => '-b /opt/tools/gradle/build.gradle helloWorld'
}

#gradle { 'tasks':
#	task => '-b /opt/tools/gradle/build.gradle tasks'
#}
# global definition of executable paths
Exec {
	path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ]
}

class gradle {
	file { 'link gradle':
		path   => '/usr/bin/gradle',
		ensure => 'link',
		target => '/opt/tools/gradle/gradlew'
	}
}

define gradle::task($task, $build_file_path = '') {
	include gradle

	if $build_file_path == '' {
		$task_to_execute = $task
	} else {
		$task_to_execute = "-b $build_file_path $task"
	}

	exec { "gradle $task_to_execute":
		command => "gradle $task_to_execute",
		require => File['link gradle']
	}
}


Gradle::Task {
	build_file_path => '/opt/tools/gradle/build.gradle'
}

gradle::task { 'hello world':
	task => 'helloWorld'
}

gradle::task { 'testet':
	task => 'tasks'
}
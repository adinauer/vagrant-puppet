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
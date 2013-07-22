# global definition of executable paths
Exec {
	path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ]
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
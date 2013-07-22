# global definition of executable paths
Exec {
	path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ]
}

# set path to build.gradle globally
Gradle::Task {
	build_file_path => '/opt/tools/gradle/build.gradle'
}

gradle::task { 'hello world':
	task => 'helloWorld'
}

file { 'etgradle':
	path    => '/usr/bin/etgradle',
	content => 'gradle -b /opt/tools/gradle/build.gradle $*;',
	mode    => 755
}

notify{ "Deploying version ${deploy_version} ...": }
class gradle {
	file { 'link gradle':
		path   => '/usr/bin/gradle',
		ensure => 'link',
		target => '/opt/tools/gradle/gradlew'
	}
}
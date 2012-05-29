class package_mongodb_utils
{

	file {'/data':
		ensure => directory,
		mode    => '0777',
		owner   => 'vagrant',
		group   => 'vagrant'
	}

	file {'/data/db':
		ensure => directory,
		mode    => '0777',
		owner   => 'vagrant',
		group   => 'vagrant'
	}	

}

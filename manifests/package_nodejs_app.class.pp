class package_nodejs_app
{

	#package
	#{
	#	'python-software-properties':
	#		ensure  => present,
	#		require => Exec['init']
	#} 

	exec
	{
		'add-nodejs-package':
			command => 'apt-add-repository ppa:chris-lea/node.js',
			path    => '/usr/bin/',
			require => Package['python-software-properties']
	}

	exec
	{
		'update-with-new-repos':
			command => 'apt-get update',
			path    => '/usr/bin/',
			require => Exec['add-nodejs-package']
	}  

	package
	{
		'nodejs':
			ensure  => present,
			require => Exec['update-with-new-repos']
	}

	package
	{
		'npm':
			ensure => present,
			require => Exec['update-with-new-repos']  
	}
  
	exec
	{
		'mongodb-nodejs-native-driver':
			command => 'sudo npm -g install /vagrant/resources/node-mongodb-native',
			path    => '/usr/bin/',
			require => Package['npm']  
	}

	exec
	{
		'restify-install':
			command => 'sudo npm -g install restify',
			path    => '/usr/bin/',
			require => Package['npm']  
	}	
  
}

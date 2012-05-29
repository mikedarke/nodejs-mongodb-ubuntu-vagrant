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
		'mongojs-install':
			command => 'sudo npm -g install mongojs',
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
	
	exec
	{
		'express-install':
			command => 'sudo npm -g install express',
			path    => '/usr/bin/',
			require => Package['npm']  
	}

	# Nice module for ensuring that the server restarts after an error
	# needs to be global as we use it on the cli
	exec
	{
		'forever-install':
			command => 'sudo npm -g install forever',
			path    => '/usr/bin/',
			require => Package['npm']  
	}	

	file {'/var':
		ensure => directory,
		mode    => '0774',
		owner   => 'vagrant',
		group   => 'vagrant'
	}	
	
	# I'm putting the node server project in here 
	# currently having to remotely upload to it over sftp in netbeans because 
	# of problems trying to create symbolic links within shared folders, which occurs during some npm package installs
	file {'/var/www':
		ensure => directory,
		mode    => '0774',
		owner   => 'vagrant',
		group   => 'vagrant'
	}		
  
}


class package_base
{

  exec
  {
    'init':
      command => 'apt-get update',
      path    => '/usr/bin/'
  }

  package
  {
    'htop':
      ensure  => present,
      require => Exec['init']
  }
  
  package
  {
    'git-core':
      ensure  => present,
      require => Exec['init']
  }

}

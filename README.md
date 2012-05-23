# Mongodb and nodejs vagrant setup

Creates a basic setup for a dev box based on lucid32 using puppet provisioning.

Includes...

* nodejs
* mongodb
* nodejs mongodb native driver


## Requirements

The lucid32 base box.

 vagrant box add lucid32 http://files.vagrantup.com/lucid32.box

Uses the following puppet modules.

* puppet-apt (https://github.com/evolvingweb/puppet-apt.git)
* puppet-mongo (https://github.com/aussielunix/puppet-mongo.git)  



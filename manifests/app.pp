import 'package_base.class.pp'
import 'package_nodejs_app.class.pp'
import 'package_mongodb_utils.class.pp'

Class['package_base']->Class['package_nodejs_app']->Class['package_mongodb_utils']

include package_base
include mongo
include package_nodejs_app
include package_mongodb_utils

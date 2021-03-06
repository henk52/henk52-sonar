# == Class: sonar
#
# Full description of class sonar here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { sonar:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class sonar {

$szSourceBaseDirectory = '/vagrant/files'
$szSonarName = 'sonarqube-4.5.1'
$SONARQUBE_HOME = "/opt/$szSonarName"
$SONARQUBE_CONF = "$SONARQUBE_HOME/conf/sonar.properties"

$szSonarRunnerName = 'sonar-runner-dist-2.4'
$SONARRUNNER_HOME  = "/opt/$szSonarRunnerName"
$SONARRUNNER_CONF = "$SONARRUNNER_HOME/conf/sonar.properties"

# PostGresql
class { 'postgresql::server':
  ip_mask_allow_all_users    => '0.0.0.0/0',
  listen_addresses           => '*',
  postgres_password          => 'SuperSecret',
}

postgresql::server::db { 'sonar':
  user     => 'sonar',
  password => postgresql_password('sonar', 'sonarpasswd'),
  encoding => 'UTF8',
} -> 

service { 'sonar':
  ensure => running,
  enable => true,
  require => [
               File [ '/etc/systemd/system/sonar.service', '/opt/sonar' ],
               File_line [ 'set_sonar_db_passwd', 'set_sonar_db_postgresql', 'set_sonar_db_username' ],
               Class[ 'postgresql::server' ],
             ],
}
#               Class[ 'postgresql::server', 'postgresql::server::role', 'postgresql::server::db' ],

postgresql::server::role { 'sonar':
  password_hash => postgresql_password('sonar', 'sonarpasswd'),
}




exec { 'install_sonarrunner':
  creates  => "$SONARRUNNER_HOME",
  command => "cd /opt; unzip $szSourceBaseDirectory/$szSonarRunnerName.zip",
  path    => [ '/bin/' ],
}


# TODO V Fix this sonnar rnner thing.
#file { '/opt/sonar':
#  ensure  => link,
#  target  => "/opt/$szSonarRunnerName",
#  require => Exec [ 'install_sonarrunner' ],
#}


# sonarqube-4.5.1.zip


exec { 'install_sonar':
  creates  => "$SONARQUBE_HOME",
  command => "cd /opt; unzip $szSourceBaseDirectory/$szSonarName.zip",
  path    => [ '/bin/' ],
}

file { '/opt/sonar':
  ensure  => link,
  target  => "/opt/$szSonarName",
  require => Exec [ 'install_sonar' ],
}

file { "$SONARQUBE_HOME/extensions/plugins/sonar-cxx-plugin-0.9.1.jar":
  source  => "$szSourceBaseDirectory/sonar-cxx-plugin-0.9.1.jar",
  ensure  => present,
  require => Exec [ 'install_sonar' ],
}

file { "$SONARQUBE_HOME/extensions/plugins/sonar-erlang-plugin-1.0.jar":
  source  => "$szSourceBaseDirectory/sonar-erlang-plugin-1.0.jar",
  ensure  => present,
  require => Exec [ 'install_sonar' ],
}

file { "$SONARQUBE_HOME/extensions/plugins/sonar-tab-metrics-plugin-1.4.1.jar":
  source  => "$szSourceBaseDirectory/sonar-tab-metrics-plugin-1.4.1.jar",
  ensure  => present,
  require => Exec [ 'install_sonar' ],
}

file { "$SONARQUBE_HOME/extensions/plugins/sonar-abacus-plugin-0.1.jar":
  source  => "$szSourceBaseDirectory/sonar-abacus-plugin-0.1.jar",
  ensure  => present,
  require => Exec [ 'install_sonar' ],
}


#sonar.jdbc.username=sonar
file_line { 'set_sonar_db_username':
  path   => "$SONARQUBE_CONF",
  line  => 'sonar.jdbc.username=sonar',
  match => '^.*sonar.jdbc.username=*',
  require => Exec [ 'install_sonar' ],
}

#sonar.jdbc.password=sonar
file_line { 'set_sonar_db_passwd':
  path   => "$SONARQUBE_CONF",
  line  => 'sonar.jdbc.password=sonarpasswd',
  match => '^.*sonar.jdbc.password=*',
  require => Exec [ 'install_sonar' ],
}

#sonar.jdbc.url=jdbc:postgresql:
file_line { 'set_sonar_db_postgresql':
  path   => "$SONARQUBE_CONF",
  line  => 'sonar.jdbc.url=jdbc:postgresql://localhost/sonar',
  match => '^.*sonar.jdbc.url=jdbc:postgresql:*',
  require => Exec [ 'install_sonar' ],
}

#sonar.jdbc.username=sonar
# TODO N This seems to be a double.
#file_line { 'set_sonar_db_username':
#  path   => "$SONARRUNNER_CONF",
#  line  => 'sonar.jdbc.username=sonar',
#  match => '^.*sonar.jdbc.username=*',
#  require => Exec [ 'install_sonar' ],
#}

#sonar.jdbc.password=sonar
#file_line { 'set_sonar_db_passwd':
#  path   => "$SONARRUNNER_CONF",
#  line  => 'sonar.jdbc.password=sonarpasswd',
#  match => '^.*sonar.jdbc.password=*',
#  require => Exec [ 'install_sonar' ],
#}

#sonar.jdbc.url=jdbc:postgresql:
#file_line { 'set_sonar_db_postgresql':
#  path   => "$SONARRUNNER_CONF",
#  line  => 'sonar.jdbc.url=jdbc:postgresql://localhost/sonar',
#  match => '^.*sonar.jdbc.url=jdbc:postgresql:*',
#  require => Exec [ 'install_sonar' ],
#}


group { 'sonar':
  ensure => present,
}

user { 'sonar':
  ensure => present,
  gid    => 'sonar',
  shell   => '/sbin/nologin',
  comment => 'SonarQube Service Account',
  require => Group [ 'sonar' ],
}

file { "/opt/$szSonarName":
  ensure => directory,
  recurse => true,
  owner   => 'sonar',
  group   => 'sonar',
  require => Exec [ 'install_sonar' ],
}


file { '/etc/systemd/system/sonar.service':
  ensure  => file,
  backup  => false,
  content => template('sonar/sonar.service.erb'),
  require => Exec [ 'install_sonar' ],    
}
 

}

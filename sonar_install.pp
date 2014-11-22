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
}

postgresql::server::role { 'sonar':
  password_hash => postgresql_password('sonar', 'sonarpasswd'),
}





# sonarqube-4.5.1.zip

$szSourceBaseDirectory = '/vagrant/Sonar'
$szSonarName = 'sonarqube-4.5.1'
$SONARQUBE_HOME = "/opt/$szSonarName"
$SONARQUBE_CONF = "$SONARQUBE_HOME/conf/sonar.properties"

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
#sonar.jdbc.password=sonar
#sonar.jdbc.url=jdbc:postgresql://localhost/sonar
file_line { 'set_sonar_db_username':
  ensure => present,
  line   => 'sonar.jdbc.username=sonar',
  path   => "$SONARQUBE_CONF",
  require => Exec [ 'install_sonar' ],
}


file_line { 'set_sonar_db_passwd':
  ensure => present,
  line   => 'sonar.jdbc.password=sonarpasswd',
  path   => "$SONARQUBE_CONF",
  require => Exec [ 'install_sonar' ],
}

file_line { 'set_sonar_db_postgresql':
  ensure => present,
  line   => 'sonar.jdbc.url=jdbc:postgresql://localhost/sonar',
  path   => "$SONARQUBE_CONF",
  require => Exec [ 'install_sonar' ],
}

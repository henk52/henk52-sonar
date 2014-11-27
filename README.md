henk52-sonar
============

Puppet module for the Sonar server.


sonar

This is the sonar module.

License
-------


Contact
-------


Support
-------

Please log tickets and issues at the [Projects site](http://projects.example.com)


-----


Start it: sudo /opt/sonar/bin/linux-x86-64/sonar.sh start



Manual PostgreSql stuff:
sudo -i
sudo - postgres
psql
  * \list
  * drop database sonar;
  * drop role sonar;
  * create role sonar password 'sonarpasswd';
  * create database sonar owner=sonar encoding='UTF-8';
  * GRANT ALL ON DATABASE sonar TO sonar;
  * 


Files Needed:
  sonarqube-4.5.1.zip
  sonar-runner-dist-2.4.zip

Modules needed:
  sonar-abacus-plugin-0.1.jar
  sonar-android-plugin-1.0.jar
  sonar-artifact-size-plugin-0.3.jar
  sonar-build-breaker-plugin-1.1.jar
  sonar-build-stability-plugin-1.2.1.jar
  sonar-cxx-plugin-0.9.1.jar
  sonar-doxygen-plugin-0.1.jar
  sonar-erlang-plugin-1.0.jar
  sonar-fortify-plugin-2.0.jar
  sonar-generic-coverage-plugin-1.1.jar
  sonar-javascript-plugin-2.1.jar
  sonar-motion-chart-plugin-1.7.jar
  sonar-scm-stats-plugin-0.3.1.jar
  sonar-tab-metrics-plugin-1.4.1.jar
  sonar-timeline-plugin-1.4.jar
  sonar-widget-lab-plugin-1.6.jar

o





-----

Notice: Compiled catalog for localhost in environment production in 0.97 seconds
Notice: /Stage[main]/Concat::Setup/File[/var/lib/puppet/concat]/ensure: created
Notice: /Stage[main]/Concat::Setup/File[/var/lib/puppet/concat/bin]/ensure: created
Notice: /Stage[main]/Concat::Setup/File[/var/lib/puppet/concat/bin/concatfragments.sh]/ensure: defined content as '{md5}7bbe7c5fce25a5ddd20415d909ba44fc'
Notice: /Stage[main]/Postgresql::Client/Package[postgresql-client]/ensure: created
Notice: /Stage[main]/Postgresql::Client/File[/usr/local/bin/validate_postgresql_connection.sh]/ensure: defined content as '{md5}20301932819f035492a30880f5bf335a'
Notice: /Stage[main]/Postgresql::Server::Install/Package[postgresql-server]/ensure: created
Notice: /Stage[main]/Postgresql::Server::Initdb/Exec[postgresql_initdb]/returns: executed successfully
Notice: /Stage[main]/Postgresql::Server::Config/File[systemd-override]/ensure: created
Notice: /Stage[main]/Postgresql::Server::Config/Postgresql::Server::Config_entry[data_directory]/Postgresql_conf[data_directory]/ensure: created
Notice: /Stage[main]/Postgresql::Server::Config/Concat[/var/lib/pgsql/data/pg_ident.conf]/File[/var/lib/puppet/concat/_var_lib_pgsql_data_pg_ident.conf]/ensure: created
Notice: /Stage[main]/Postgresql::Server::Config/Concat[/var/lib/pgsql/data/pg_ident.conf]/File[/var/lib/puppet/concat/_var_lib_pgsql_data_pg_ident.conf/fragments]/ensure: created
Notice: /Stage[main]/Postgresql::Server::Config/Concat[/var/lib/pgsql/data/pg_ident.conf]/File[/var/lib/puppet/concat/_var_lib_pgsql_data_pg_ident.conf/fragments.concat.out]/ensure: created
Notice: /Stage[main]/Postgresql::Server::Config/Concat[/var/lib/pgsql/data/pg_ident.conf]/File[/var/lib/puppet/concat/_var_lib_pgsql_data_pg_ident.conf/fragments.concat]/ensure: created
Notice: /Stage[main]/Postgresql::Server::Config/Concat[/var/lib/pgsql/data/pg_ident.conf]/Exec[concat_/var/lib/pgsql/data/pg_ident.conf]/returns: executed successfully
Notice: /Stage[main]/Postgresql::Server::Config/Concat[/var/lib/pgsql/data/pg_ident.conf]/Exec[concat_/var/lib/pgsql/data/pg_ident.conf]: Triggered 'refresh' from 2 events
Notice: /Stage[main]/Postgresql::Server::Config/Concat[/var/lib/pgsql/data/pg_ident.conf]/File[/var/lib/pgsql/data/pg_ident.conf]/content: content changed '{md5}f11c8332d3f444148c0b8ee83ec5fc6d' to '{md5}9300ac105fe777787ac9e793b8df8d25'
Notice: /Stage[main]/Postgresql::Server::Config/Concat[/var/lib/pgsql/data/pg_ident.conf]/File[/var/lib/pgsql/data/pg_ident.conf]/mode: mode changed '0600' to '0640'
Notice: /Stage[main]/Postgresql::Server::Config/Exec[restart-systemd]: Triggered 'refresh' from 1 events
Notice: /Stage[main]/Sonar/Exec[install_sonar]/returns: executed successfully
Notice: /Stage[main]/Sonar/File_line[set_sonar_db_postgresql]/ensure: created
Notice: /Stage[main]/Sonar/File[/opt/sonarqube-4.5.1/extensions/plugins/sonar-abacus-plugin-0.1.jar]/ensure: defined content as '{md5}cefdd8d7f44cf78277863a94cc9f049b'
Notice: /Stage[main]/Sonar/File[/opt/sonar]/ensure: created
Notice: /Stage[main]/Sonar/File[/opt/sonarqube-4.5.1/extensions/plugins/sonar-erlang-plugin-1.0.jar]/ensure: defined content as '{md5}85f4888a1053cce102d943166d30ec50'
Notice: /Stage[main]/Sonar/File[/opt/sonarqube-4.5.1/extensions/plugins/sonar-tab-metrics-plugin-1.4.1.jar]/ensure: defined content as '{md5}5657553bda730cf99041f9acf09fb4d3'
Notice: /Stage[main]/Sonar/File_line[set_sonar_db_passwd]/ensure: created
Notice: /Stage[main]/Sonar/File_line[set_sonar_db_username]/ensure: created
Notice: /Stage[main]/Sonar/File[/opt/sonarqube-4.5.1/extensions/plugins/sonar-cxx-plugin-0.9.1.jar]/ensure: defined content as '{md5}b2236c0e830d2505a52ca8b7a56b408b'
Notice: /Stage[main]/Postgresql::Server::Config/Postgresql::Server::Config_entry[listen_addresses]/Postgresql_conf[listen_addresses]/ensure: created
Notice: /Stage[main]/Postgresql::Server::Config/Concat[/var/lib/pgsql/data/pg_hba.conf]/File[/var/lib/puppet/concat/_var_lib_pgsql_data_pg_hba.conf]/ensure: created
Notice: /Stage[main]/Postgresql::Server::Config/Concat[/var/lib/pgsql/data/pg_hba.conf]/File[/var/lib/puppet/concat/_var_lib_pgsql_data_pg_hba.conf/fragments.concat.out]/ensure: created
Notice: /Stage[main]/Postgresql::Server::Config/Concat[/var/lib/pgsql/data/pg_hba.conf]/File[/var/lib/puppet/concat/_var_lib_pgsql_data_pg_hba.conf/fragments]/ensure: created
Notice: /Stage[main]/Postgresql::Server::Config/Postgresql::Server::Pg_hba_rule[local access to database with same name]/Concat::Fragment[pg_hba_rule_local access to database with same name]/File[/var/lib/puppet/concat/_var_lib_pgsql_data_pg_hba.conf/fragments/002_pg_hba_rule_local access to database with same name]/ensure: defined content as '{md5}61275db6b21adbf53b575d4c1a6bbed1'
Notice: /Stage[main]/Postgresql::Server::Config/Postgresql::Server::Pg_hba_rule[allow access to ipv6 localhost]/Concat::Fragment[pg_hba_rule_allow access to ipv6 localhost]/File[/var/lib/puppet/concat/_var_lib_pgsql_data_pg_hba.conf/fragments/101_pg_hba_rule_allow access to ipv6 localhost]/ensure: defined content as '{md5}ab588822a007943223faadf86be3044a'
Notice: /Stage[main]/Postgresql::Server::Config/Postgresql::Server::Pg_hba_rule[local access as postgres user]/Concat::Fragment[pg_hba_rule_local access as postgres user]/File[/var/lib/puppet/concat/_var_lib_pgsql_data_pg_hba.conf/fragments/001_pg_hba_rule_local access as postgres user]/ensure: defined content as '{md5}03454101c43efbcdecc71dd3f734a68f'
Notice: /Stage[main]/Postgresql::Server::Config/Postgresql::Server::Pg_hba_rule[deny access to postgresql user]/Concat::Fragment[pg_hba_rule_deny access to postgresql user]/File[/var/lib/puppet/concat/_var_lib_pgsql_data_pg_hba.conf/fragments/004_pg_hba_rule_deny access to postgresql user]/ensure: defined content as '{md5}205b04b3328583b8330f59e37d55c8e8'
Notice: /Stage[main]/Postgresql::Server::Config/Postgresql::Server::Pg_hba_rule[allow localhost TCP access to postgresql user]/Concat::Fragment[pg_hba_rule_allow localhost TCP access to postgresql user]/File[/var/lib/puppet/concat/_var_lib_pgsql_data_pg_hba.conf/fragments/003_pg_hba_rule_allow localhost TCP access to postgresql user]/ensure: defined content as '{md5}f30c1a00a0759236b37352c32cd0e284'
Notice: /Stage[main]/Postgresql::Server::Config/Concat[/var/lib/pgsql/data/pg_hba.conf]/File[/var/lib/puppet/concat/_var_lib_pgsql_data_pg_hba.conf/fragments.concat]/ensure: created
Notice: /Stage[main]/Postgresql::Server::Config/Postgresql::Server::Pg_hba_rule[allow access to all users]/Concat::Fragment[pg_hba_rule_allow access to all users]/File[/var/lib/puppet/concat/_var_lib_pgsql_data_pg_hba.conf/fragments/100_pg_hba_rule_allow access to all users]/ensure: defined content as '{md5}6332aa580d0a4d80f31f6ce365b93c92'
Notice: /Stage[main]/Postgresql::Server::Config/Concat[/var/lib/pgsql/data/pg_hba.conf]/Exec[concat_/var/lib/pgsql/data/pg_hba.conf]/returns: executed successfully
Notice: /Stage[main]/Postgresql::Server::Config/Concat[/var/lib/pgsql/data/pg_hba.conf]/Exec[concat_/var/lib/pgsql/data/pg_hba.conf]: Triggered 'refresh' from 8 events
Notice: /Stage[main]/Postgresql::Server::Config/Concat[/var/lib/pgsql/data/pg_hba.conf]/File[/var/lib/pgsql/data/pg_hba.conf]/content: content changed '{md5}9784211d3c0e7ad5a539b9dcb964b9c3' to '{md5}43ca2364f5669316995401a7f8eef77e'
Notice: /Stage[main]/Postgresql::Server::Config/Concat[/var/lib/pgsql/data/pg_hba.conf]/File[/var/lib/pgsql/data/pg_hba.conf]/mode: mode changed '0600' to '0640'
Notice: /Stage[main]/Postgresql::Server::Config/Postgresql::Server::Config_entry[port]/Postgresql_conf[port]/ensure: created
Notice: /Stage[main]/Postgresql::Server::Service/Anchor[postgresql::server::service::begin]: Triggered 'refresh' from 1 events
Notice: /Stage[main]/Postgresql::Server::Service/Service[postgresqld]/ensure: ensure changed 'stopped' to 'running'
Notice: /Stage[main]/Postgresql::Server::Service/Postgresql::Validate_db_connection[validate_service_is_running]/Exec[validate postgres connection for /postgres]: Triggered 'refresh' from 1 events
Notice: /Stage[main]/Postgresql::Server::Service/Anchor[postgresql::server::service::end]: Triggered 'refresh' from 1 events
Notice: /Stage[main]/Postgresql::Server::Reload/Exec[postgresql_reload]: Triggered 'refresh' from 1 events
Notice: /Stage[main]/Postgresql::Server::Passwd/Exec[set_postgres_postgrespw]/returns: ALTER ROLE
Notice: /Stage[main]/Postgresql::Server::Passwd/Exec[set_postgres_postgrespw]/returns: executed successfully
Notice: /Stage[main]/Sonar/Postgresql::Server::Role[sonar]/Postgresql_psql[CREATE ROLE "sonar" ENCRYPTED PASSWORD 'md5144b06ff6bf8a2c00d92ee1a16539126' LOGIN NOCREATEROLE NOCREATEDB NOSUPERUSER  CONNECTION LIMIT -1]/command: command changed 'notrun' to 'CREATE ROLE "sonar" ENCRYPTED PASSWORD 'md5144b06ff6bf8a2c00d92ee1a16539126' LOGIN NOCREATEROLE NOCREATEDB NOSUPERUSER  CONNECTION LIMIT -1'
Notice: /Stage[main]/Sonar/Postgresql::Server::Db[sonar]/Postgresql::Server::Database[sonar]/Postgresql_psql[Check for existence of db 'sonar']/command: command changed 'notrun' to 'SELECT 1'
Notice: /Stage[main]/Sonar/Postgresql::Server::Db[sonar]/Postgresql::Server::Database[sonar]/Exec[/usr/bin/createdb --port='5432' --owner='postgres' --template=template0 --encoding 'UTF8'  'sonar']: Triggered 'refresh' from 1 events
Notice: /Stage[main]/Sonar/Postgresql::Server::Db[sonar]/Postgresql::Server::Database[sonar]/Postgresql_psql[REVOKE CONNECT ON DATABASE "sonar" FROM public]: Triggered 'refresh' from 1 events
Notice: /Stage[main]/Sonar/Postgresql::Server::Db[sonar]/Postgresql::Server::Database_grant[GRANT sonar - ALL - sonar]/Postgresql::Server::Grant[database:GRANT sonar - ALL - sonar]/Postgresql_psql[GRANT ALL ON DATABASE "sonar" TO "sonar"]/command: command changed 'notrun' to 'GRANT ALL ON DATABASE "sonar" TO "sonar"'
Notice: Finished catalog run in 29.38 seconds
[vagrant@localhost vagrant]$ 


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


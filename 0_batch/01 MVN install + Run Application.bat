@echo off
set JAVA_HOME=C:\PROGRA~1\JAVA\JDK-12
set M2_HOME=c:\tools\apache-maven-3.6.0
set MODULE_PATH=service\target\Study01_service.jar
set MODULE_PATH=%MODULE_PATH%;service-provider\target\Study01_service-provider.jar
set MODULE_PATH=%MODULE_PATH%;service-client\target\Study01_service-client.jar
set MODULE=kp.client/kp.client.KpServiceClient
set SKIP_TESTS=-DskipTests -Dmaven.test.skip=true
pushd %cd%
cd ..
call %M2_HOME%\bin\mvn clean install %SKIP_TESTS%
call %JAVA_HOME%\bin\java --module-path %MODULE_PATH% --module %MODULE%
pause
popd
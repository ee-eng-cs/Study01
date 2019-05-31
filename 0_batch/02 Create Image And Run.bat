@echo off
set JAVA_HOME=C:\PROGRA~1\JAVA\JDK-12
SET REP_DIR=c:\Users\KP\.m2\repository
set IMAGE_DIR=..\target\runtime_image
set MOD_PATH=$JAVA_HOME/jmods
set MOD_PATH=%MOD_PATH%;%REP_DIR%\kp\Study01_service\1.0.0-SNAPSHOT\Study01_service-1.0.0-SNAPSHOT.jar
set MOD_PATH=%MOD_PATH%;%REP_DIR%\kp\Study01_service-client\1.0.0-SNAPSHOT\Study01_service-client-1.0.0-SNAPSHOT.jar
set MOD_PATH=%MOD_PATH%;%REP_DIR%\kp\Study01_service-provider\1.0.0-SNAPSHOT\Study01_service-provider-1.0.0-SNAPSHOT.jar
set MODULES=kp.client,kp.service,kp.provider
set MODULE=kp.client/kp.client.KpServiceClient

if exist %IMAGE_DIR% rmdir /S /Q %IMAGE_DIR%
call %JAVA_HOME%\bin\jlink --module-path %MOD_PATH% --add-modules %MODULES% --output %IMAGE_DIR%
call %IMAGE_DIR%\bin\java --module %MODULE%
pause
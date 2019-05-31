@echo off
set JAVA_HOME=C:\PROGRA~1\JAVA\JDK-12
set M2_HOME=c:\tools\apache-maven-3.6.0
pushd %cd%
cd ..
set LABEL=Analyze Dependency
call :AnalyzeDependency
set LABEL=Describe Module
call :DescribeModule
set LABEL=MVN Versions
call :MvnVersions
set LABEL=MVN Dependency
call :MvnDependency
set LABEL=MVN Javadoc
call :MvnJavadoc
pause
popd
goto :eof

:AnalyzeDependency
echo analyze dependency for module kp.service:
set MODULE_PATH=service\target\Study01_service.jar
call %JAVA_HOME%\bin\jdeps --module kp.service --module-path %MODULE_PATH%
echo.
echo analyze dependency for module kp.provider:
set MODULE_PATH=service\target\Study01_service.jar
set MODULE_PATH=%MODULE_PATH%;service-provider\target\Study01_service-provider.jar
call %JAVA_HOME%\bin\jdeps --module kp.provider --module-path %MODULE_PATH%
echo.
echo analyze dependency for module kp.client:
set MODULE_PATH=service\target\Study01_service.jar
set MODULE_PATH=%MODULE_PATH%;service-client\target\Study01_service-client.jar
call %JAVA_HOME%\bin\jdeps --module kp.client --module-path %MODULE_PATH%
call :RedLabel
goto :eof

:DescribeModule
echo describe module for Study01_service.jar:
call %JAVA_HOME%\bin\jar --describe-module --file=service\target\Study01_service.jar
echo describe module for Study01_service-provider.jar:
call %JAVA_HOME%\bin\jar --describe-module --file=service-provider\target\Study01_service-provider.jar
echo describe module for Study01_service-client.jar:
call %JAVA_HOME%\bin\jar --describe-module --file=service-client\target\Study01_service-client.jar
call :RedLabel
goto :eof

:MvnVersions
call %M2_HOME%\bin\mvn versions:display-plugin-updates
call %M2_HOME%\bin\mvn versions:display-dependency-updates
call :RedLabel
goto :eof

:MvnDependency
call %M2_HOME%\bin\mvn dependency:tree
call %M2_HOME%\bin\mvn dependency:resolve -Dclassifier=javadoc
call %M2_HOME%\bin\mvn dependency:resolve -Dclassifier=sources
call :RedLabel
goto :eof

:MvnJavadoc
call %M2_HOME%\bin\mvn package javadoc:aggregate
call :RedLabel
goto :eof

:RedLabel
powershell -Command Write-Host "FINISH %LABEL%" -foreground "Red"
goto :eof
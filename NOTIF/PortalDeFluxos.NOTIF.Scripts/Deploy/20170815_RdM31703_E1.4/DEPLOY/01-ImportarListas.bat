@ECHO OFF
cd %~dp0
powershell -ExecutionPolicy UnRestricted -File ".\01-ImportarListas.ps1"
@ECHO ON
pause

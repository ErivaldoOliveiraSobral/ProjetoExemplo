@ECHO OFF
cd %~dp0
powershell -ExecutionPolicy UnRestricted -File ".\03-ImportarRolesLista.ps1"
@ECHO ON
pause

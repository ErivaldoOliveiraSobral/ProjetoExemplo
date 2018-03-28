@ECHO OFF
cd %~dp0
powershell -ExecutionPolicy UnRestricted -File ".\04-CriarBibliotecaAnexosPropostas.ps1"
@ECHO ON
pause

call:flowVARS %*&goto:eof
@echo off&call:global&for %%i in (%*) do (call:7za "%%~i")
goto:eof
:7za
@C:\bin\7za.exe a "D:/zippedup/%~nx1_%USERDOMAIN%.zip" -tzip "%~1"&goto:eof

:global
set input=C:\bin\7za.exe
set output=D:/zippedup

set 7zPath=%input%&set outputPath=%output%&goto:eof


:flowVARS
@echo off&call:global&for %%i in (%*) do (call:7za "%%~i")
goto:eof
:7zaVARS
call %7zPath% a "%outputPath%/%~nx1_%USERDOMAIN%.zip" -tzip "%~1"&goto:eof
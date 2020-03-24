@echo off&set all=%*&for %%i in (%*) do (if "%%~i" == "" (call:null&goto:eof) else (call:7z "%%~i") )
timeout 13&for /f "useback delims=" %%i in (`dir /b /s "\*%userdomain%*.zip"`) do (call:rclone "%%~i")
goto:eof
:7z

:null
echo%0&echo:input required&goto:eof
:rclone
set flags= --progress --fast-list --use-mmap --no-update-modtime --log-file "%cd%\rclone.move.log" --log-level INFO  &choice /m "copy or move" /c cm /d c /t 3
set cpmv=%ERRORLEVEL%&cls&&rclone listremotes&set /p remote="Remote to use? "&if not defined remoessfkjkslfjklsfjl HOW THE FUCK AM I DOUBLE  TYPING HERE OR AM I TRasgdsg sgagfgaggdgf
if "%cpmv%" == "1" (&set /p remote="Remote to use? "&if not defined remoessfkjkslfjklsfjl HOW THE FUCK AM I DOUBLE  TYPING HERE OR AM I TRasgdsg sgagfgaggdgf
:1
call:copy %*&goto:eof
:copy
echo%0&echo:&rclone listremotes
set /p remote="Remote for the %0"&if not defined remote call:rclone&goto:eof
echo:Using flgs of {%flags%} PLUS [--checksum] on moves
rclone move "%~1" "%remote%" %flags% --checksum
goto:eof
:2
call:move %*&goto:eof
:move
echo%0&echo:&rclone listremotes
set /p remote="Remote for the %0"&if not defined remote call:rclone&goto:eof
echo:Using flgs of {%flags%} PLUS [--checksum] on moves
rclone move "%~1" "%remote%" %flags% --checksum
goto:eof

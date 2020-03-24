@echo:off
rem   These are intended to be thrown in your "sendto" folder to make shit easier than right click 7z.... 
rem   ESPECIALLY when dealing with multiple folders taht dont all need to be in a single zip with a generic name
rem   This is a mux of the 3 I just tested thatll ill drop next. 
rem   1.single Input 2. As many fucking inputs as you want spaced or not and --
rem   3. variation of 2 using vars for 7z path and output directory
rem   cli: start shell:sendto RUN: shell:sendto PATH: %APPDATA%\Microsoft\Windows\SendTo :ANYfuckingWHERE mklink /h "%APPDATA%\Microsoft\Windows\SendTo\$nameYouWant" "$pathToBat"
rem     if some poor sap does stumble upon this terrible shit feel free to remove the rem and rants etc if you want a tidy bat



::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:1 Just change it to the 7zip/7za path you have (if you use workstation they include 7za with their install, albeit older, but its there)
@C:\bin\7za.exe a "D:/zippedUp/%~nx1_%USERDOMAIN%.zip" -tzip "%~1"
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:2 same as above
@echo off&for %%i in (%*) do (call:7za "%%~i")
goto:eof
:7za
@C:\bin\7za.exe a "D:/zippedup/%~nx1_%USERDOMAIN%.zip" -tzip "%~1"&goto:eof
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:3 same as others, but change input to the 7z/a path and output to your target directory

@echo off&call:global&for %%i in (%*) do (call:7za "%%~i")
goto:eof

:7za
call %7zPath% a "%outputPath%/%~nx1_%USERDOMAIN%.zip" -tzip "%~1"&goto:eof

:global
                rem I dont like here fucking winders bitch about it being all patches since the 90s so I use  their left hand for call paths 
                          rem 7z/rclone/some*windersBIN and the likes dont give a fuck which is how it should be hence the proper slash

set input=C:\bin\7za.exe
set output=D:/zippedup

              rem Fusion so readable at command section
set 7zPath=%input%&set outputPath=%output%&goto:eof

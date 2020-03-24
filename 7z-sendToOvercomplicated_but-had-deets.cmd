@echo off&set in1=%~1&for %%i in (%*) do (if "%%~i" == "" (echo:&echo:Manully input source?&timeout 3&call:null&goto:eof)

:null
echo%0&echo:At the following prompt input a source target path or list[untested]. However, if you do have a list, using that extension{.list}, that can either be passed to 7zip direct, or can also be used in the set /p function&echo:Any input will have the userdomain [%USERDOMAIN%] appended to avoid multiple same directory named zips to poorly try to avoid duplicates, yet different folder zips, albeit also in a shitty way of identification.&for %%i in ("%CD%\*.list") do (if exist %%i (set /p input=<"%%~i"&call:7z&goto:eof) else (if not exit %%i (set /p input="Input?"&call echo:%input%&call:7z&goto:eof) )                              
:7z
echo%0&echo:Assuming default install path&echo:Defaults to 7za if not installed&if exist "C:\Program Files\7-Zip\7z.exe" (call:7z&goto:eof) else (if not exist "C:\Program Files\7-Zip\7z.exe" (for /f "useback delims=" %%i in (`dir /b /s "\*7z*a.exe"`) do (if exist %%i (call:7za&goto:eof) else (if not exist %%i (echo:%%i[7za] not found, but Ill leave the code on screen before exiting for a cli manual entry&echo:&call:nul&goto:eof) ) ) ) )
:7z
@"C:\Program Files\7-Zip\7z.exe" a "%~nx1_%USERDOMAIN%.zip" -tzip "%~1"
:7za
echo%0
:null
echo%0&echo:These are interchangable. Just 7za doesnt require dlls etc&echo:&cls&echo:[@"C:\Program Files\7-Zip\7z.exe" a "%~nx1_%USERDOMAIN%.zip" -tzip "%~1"]&echo:&echo:Format is 7zip a{archive} name.extension[input1--intended for a sendto call}_%USERDOMAIN% -typeZIP [actual called input -or- cli input}
goto:eof







::  echo%0&set /p input="Input a 1.sourceTargetPath -or- 2.list to be zipped. All inputs will be appended with the userdomain of %USERDOMAIN% to avoid multiple zips with the sme name"
::  if not defined input (call:null&goto:eof) else (echo:Just completting this shit&goto:eof)

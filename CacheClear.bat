@echo off
echo.
echo This script performs the following actions:
echo.
echo  1.) Ends Internet Explorer, Adobe Flash Player and Java processes
echo  2.) Clears Internet Explorer Temporary Internet Files and Cookies
echo  3.) Clears DNS Cache
echo  4.) Clears Adobe Flash Player cache (renames cache directory)
echo  5.) Clears Java (JRE) Temporary Files (renames cache directory)
echo  6.) Clears Java Web Start cache and downloaded applets
echo.
echo NOTE: Open websites will be closed. Save your work if needed, then
pause
echo.
echo  Ending Processes...
start taskkill /F /im "iexplore.exe" /im "FlashUtil*" /im "Flashplayer*" /im "SwHelper.exe" /im "swdnld.exe" /im "java.exe" /im "javaw.exe" /im "javaws.exe" /im "jucheck.exe" /im "jusched.exe" /im "jp2launcher.exe"
echo  Clearing Internet Explorer Temporary Internet Files and Cookies...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 10
echo  Clearing DNS Cache...
ipconfig /flushdns
echo  Clearing Adobe FlashPlayer Cache (renaming cache directory)...
ren "%appdata%\Adobe\Flash Player" "Flash Player_%date:~4,2%-%date:~7,2%-%date:~10,4%_%time:~0,2%%time:~3,2%_%time:~6,5%"
ren "%appdata%\Macromedia\Flash Player" "Flash Player_%date:~4,2%-%date:~7,2%-%date:~10,4%_%time:~0,2%%time:~3,2%_%time:~6,5%"
echo  Clearing Java (JRE) Temporary Files (renaming cache directory)...
IF EXIST "%appdata%\..\locallow\Sun\Java\" (
	ren "%appdata%\..\locallow\Sun\Java\Deployment\cache" "cache_%date:~4,2%-%date:~7,2%-%date:~10,4%_%time:~0,2%%time:~3,2%_%time:~6,5%"
	goto continue
 ) ELSE IF EXIST "%appdata%\Sun\Java\" ( 
	ren "%appdata%\Sun\Java\Deployment\cache" "cache_%date:~4,2%-%date:~7,2%-%date:~10,4%_%time:~0,2%%time:~3,2%_%time:~6,5%"
	goto continue
 ) ELSE echo Cache directory not found
:continue
echo  Clearing Java Web Start cache and applets (javaws -uninstall)...
start javaws.exe -uninstall
echo  Complete!
echo.
echo Exiting...
Timeout /T 10
exit
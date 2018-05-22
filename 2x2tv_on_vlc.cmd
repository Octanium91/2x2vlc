@echo off
set "script_title=2X2 TV on VLC (ver. 1.0) By Octanium"
title=%script_title%
set "CL=--repeat --no-video-title-show --deinterlace=-1 --input-title-format="2X2 TV Online""
set "CL=--deinterlace=-1"
set "VLC_EXE=%ProgramFiles%\VideoLAN\VLC\vlc.exe"
set "VLC_EXE86=%SystemDrive%\Program Files (x86)\VideoLAN\VLC\vlc.exe"
if exist "%VLC_EXE%" (
goto StartVLC
) else (
 if exist "%VLC_EXE86%" (
 set "VLC_EXE=%VLC_EXE86%"
 goto StartVLC
 ) else (
  echo.
  echo  Error!!! VLC not found!
  echo.
  echo ------------------------------------------------
  echo  "%VLC_EXE%"
  echo   -- or --
  echo  "%VLC_EXE86%"
  echo.
  echo ------------------------------------------------
  echo  Please install the VLC Media Player!
  echo.
  echo  Website: http://www.videolan.org/vlc/
  echo ------------------------------------------------
  echo.
  pause
  start "Website VLC" "iexplore.exe" "http://www.videolan.org/vlc/"
 )
)
timeout 2
cls
exit

:StartVLC
echo.
echo  Download playlist...
title=Download playlist...
if exist "%temp%\2x2vlcplaylist.m3u" del "%temp%\2x2vlcplaylist.m3u" /s /q
bitsadmin /transfer /download /priority high "https://raw.githubusercontent.com/Octanium91/2x2vlc/master/2x2pl.m3u" "%temp%\2x2vlcplaylist.m3u"
if %ERRORLEVEL% == 0 title=%script_title%&echo  Download play list OK&echo  Start VLC...&start "VLC LAN" "%VLC_EXE%" "%temp%\2x2vlcplaylist.m3u" %CL%&exit
title=%script_title%
echo Error downloading playlist =(
echo.
pause 
cls
exit
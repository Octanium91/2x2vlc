rem Author: Octanium (Octanium91)
@echo off
set "script_title=2X2 TV on VLC (ver. 1.0) By Octanium"
title=%script_title%
rem set "CL=--repeat --no-video-title-show --deinterlace=-1 --input-title-format="2X2 TV Online""
set "CL=--network-caching=3500 --deinterlace=-1"
rem Try to find VLC Media Player
if exist "%ProgramFiles%\VideoLAN\VLC\vlc.exe" set "VLC_EXE=%ProgramFiles%\VideoLAN\VLC\vlc.exe"&goto StartVLC
if exist "%ProgramFiles(x86)%\VideoLAN\VLC\vlc.exe" set "VLC_EXE=%ProgramFiles(x86)%\VideoLAN\VLC\vlc.exe"&goto StartVLC
if exist "%SystemDrive%\Program Files (x86)\VideoLAN\VLC\vlc.exe" set "VLC_EXE=%SystemDrive%\Program Files (x86)\VideoLAN\VLC\vlc.exe"&goto StartVLC
if exist "%SystemDrive%\Program Files\VideoLAN\VLC\vlc.exe" set "VLC_EXE=%SystemDrive%\Program Files\VideoLAN\VLC\vlc.exe"&goto StartVLC
rem If VLC Media Player not found
rem show error text and visit VLC website
echo.
echo  !!!Error!!! VLC not found!
echo.
echo ------------------------------------------------
echo  "%SystemDrive%\Program Files\VideoLAN\VLC\vlc.exe"
echo   -- or --
echo  "%SystemDrive%\Program Files (x86)\VideoLAN\VLC\vlc.exe"
echo.
echo ------------------------------------------------
echo  Please install the VLC Media Player!
echo.
echo  Website: http://www.videolan.org/vlc/
echo ------------------------------------------------
echo.
pause
start "Website VLC" "iexplore.exe" "http://www.videolan.org/vlc/"
timeout 2
exit

:StartVLC
rem Download playlist and start VLC Media Player
if exist "%temp%\2x2vlcplaylist.m3u" del "%temp%\2x2vlcplaylist.m3u" /s /q
cls
echo.
echo  Download playlist...
title=Download playlist...
bitsadmin /transfer /download /priority high "https://raw.githubusercontent.com/Octanium91/2x2vlc/master/2x2pl.m3u" "%temp%\2x2vlcplaylist.m3u"
if %ERRORLEVEL% == 0 title=%script_title%&echo  Download play list OK&echo  Start VLC...&start "VLC LAN" "%VLC_EXE%" "%temp%\2x2vlcplaylist.m3u" %CL%&exit
title=%script_title%
echo Error downloading playlist =(
echo.
pause 
exit
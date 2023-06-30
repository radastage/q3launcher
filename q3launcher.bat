@echo off
color 4
title ***QUAKE 3 ARENA LAUNCHER***
set launchprompt=

:menu
set /A randomseed = "%random% * %random%"
echo 1 = [36mStart Game[0m
echo 2 = [32mEdit Command Line[0m
echo 3 = [37mMap List[0m
echo 4 = [33mShow CVARs[0m
echo 5 = [34mShow CMDs[0m
echo 6 = [31mQuit[0m


set /P input=
goto :main

:main
if exist "q3commandline.txt" (
type "q3commandline.txt"
) ELSE (
echo +game baseq3 +map q3dm0 +addbot crash 3 red 100000 Crash +fraglimit 100 +timelimit 20 +g_gametype 1 > q3commandline.txt
)

if /i %input% == 1 goto :start
if /i %input% == 2 goto :edit
if /i %input% == 3 goto :list
if /i %input% == 4 goto :cvars
if /i %input% == 5 goto :cmds
if /i %input% == 6 goto :eof

:start
for /F "tokens=* EOL=# delims= " %%D in (q3commandline.txt) do (
set "launchprompt=%launchprompt% %%~D"
)
quake3.exe %launchprompt% 
set launchprompt=
goto :menu

:edit
if exist "q3commandline.txt" (
type "q3commandline.txt"
) ELSE (
echo +game baseq3 +map q3dm0 +addbot crash 3 red 100000 Crash +fraglimit 100 +timelimit 20 +g_gametype 1 > q3commandline.txt
)
notepad "q3commandline.txt"
goto :menu

:list
echo [31mQ3DM[0m0 Introduction
echo [31mQ3DM[0m1 Arena Gate
echo [31mQ3DM[0m2 House of Pain
echo [31mQ3DM[0m3 Arena of Death
echo [31mQ3DM[0m4 The Place of Many Deaths
echo [31mQ3DM[0m5 The Forgotten Place
echo [31mQ3DM[0m6 The Camping Grounds
echo [31mQ3DM[0m7 Temple of Retribution
echo [31mQ3DM[0m8 Brimstone Abbey
echo [31mQ3DM[0m9 Hero's Keep
echo [31mQ3DM[0m10 The Nameless Place
echo [31mQ3DM[0m11 Deva Station
echo [31mQ3DM[0m12 The Dredwerkz
echo [31mQ3DM[0m13 Lost World
echo [31mQ3DM[0m14 Grim Dungeons
echo [31mQ3DM[0m15 Demon Keep
echo [31mQ3DM[0m16 The Bouncy Map
echo [31mQ3DM[0m17 The Longest Yard
echo [31mQ3DM[0m18 Space Chamber
echo [31mQ3DM[0m19 Apocalypse Void
echo [31mQ3Tourney1[0m Powerstation 0218
echo [31mQ3Tourney2[0m The Proving Grounds
echo [31mQ3Tourney3[0m Hell's Gate
echo [31mQ3Tourney4[0m Vertical Vengeance
echo [31mQ3Tourney5[0m Fatal Instinct
echo [31mQ3Tourney6[0m The Very End of You
echo [31mQ3CTF1[0m Dueling Keeps
echo [31mQ3CTF2[0m Troubled Waters
echo [31mQ3CTF3[0m The StrongHold
echo [31mQ3CTF4[0m Space CTF
echo Test_BigBox
goto :menu

:cvars
if exist "q3cvars.txt" (
type "q3cvars.txt"
) ELSE (
echo q3cvars.txt not found.
)
goto :menu

:cmds
if exist "q3cmds.txt" (
type "q3cmds.txt"
) ELSE (
echo q3cmds.txt not found.
)
goto :menu

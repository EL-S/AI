@echo off
if not exist languagedatabase.txt echo.>languagedatabase.txt
if not exist worddatabase.txt echo.>worddatabase.txt
if not exist aicfg.txt goto aicfgfunc
goto aicfgread
:begin
ping 1.1.1.1 -n 1 -w 1500 > nul
echo %charname%: %charstart%
set spch=%charstart%
goto num
:inprogress
set /p text="You: "
goto commandcheck
:dict
for /f "tokens=1,* delims=@" %%i in (languagedatabase.txt) do (
  if /i "%text%"=="%%i" (
   ping 1.1.1.1 -n 1 -w 1000 > nul
   echo Ene: %%j
   set spch=%%j
   goto num
  )
)
For /F "Usebackq Tokens=1,* Delims=@" %%A in ("worddatabase.txt") Do (
    For %%@ in (%text%) DO (
        Echo "%%A"| FINDSTR /I "\"%%@\"" 1>NUL && (
		    ping 1.1.1.1 -n 1 -w 1000 > nul
            echo Ene: %%B
			set spch=%%B
			goto num
        )
    )
)
goto unknown
:unknown
ping 1.1.1.1 -n 1 -w 2000 > nul
echo Ene: I don't understand.
set custommsg=I don't understand.
goto unknown2
:unknown2
set vbsnum2=%random%
if exist temp%vbsnum2%.vbs goto unknown2
echo ' > "temp%vbsnum2%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp%vbsnum2%.vbs"
echo speech.speak "%custommsg%" >> "temp%vbsnum2%.vbs"
start temp%vbsnum2%.vbs
ping 1.1.1.1 -n 1 -w 500 > nul
del temp%vbsnum2%.vbs
ping 1.1.1.1 -n 1 -w 1000 > nul
echo Ene: How should I respond? 
set custommsg=How should I respond?
goto unknown3
:unknown3
set vbsnum2=%random%
if exist temp%vbsnum2%.vbs goto unknown3
echo ' > "temp%vbsnum2%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp%vbsnum2%.vbs"
echo speech.speak "%custommsg%" >> "temp%vbsnum2%.vbs"
start temp%vbsnum2%.vbs
ping 1.1.1.1 -n 1 -w 500 > nul
del temp%vbsnum2%.vbs 
ping 1.1.1.1 -n 1 -w 1000 > nul
set /p answer="You: "
echo %text%@%answer%>>languagedatabase.txt
ping 1.1.1.1 -n 1 -w 1000 > nul
echo Ene: Duly noted!
set custommsg=Duly noted!
goto unknown4
:unknown4
set vbsnum2=%random%
if exist temp%vbsnum2%.vbs goto unknown4
echo ' > "temp%vbsnum2%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp%vbsnum2%.vbs"
echo speech.speak "%custommsg%" >> "temp%vbsnum2%.vbs"
start temp%vbsnum2%.vbs
ping 1.1.1.1 -n 1 -w 500 > nul
del temp%vbsnum2%.vbs
goto inprogress
:commandcheck
IF "%text%"=="search" goto search
IF "%text%"=="clear screen" goto cls
IF "%text%"=="clear the screen" goto cls
IF "%text%"=="cls" goto cls
IF "%text%"=="please clear the screen" goto cls
goto dict
:cls
echo Ene: Are you sure?
set custommsg=Are you sure?
goto cls2
:cls2
set vbsnum2=%random%
if exist temp%vbsnum2%.vbs goto cls2
echo ' > "temp%vbsnum2%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp%vbsnum2%.vbs"
echo speech.speak "%custommsg%" >> "temp%vbsnum2%.vbs"
start temp%vbsnum2%.vbs
ping 1.1.1.1 -n 1 -w 500 > nul
del temp%vbsnum2%.vbs
:cls3
set /p why="You: "
IF /I %why%==yes goto cls5
IF /I %why%==no goto inprogress
echo Ene: I don't understand, please simply state what you mean.
set custommsg=I don't understand, please simply state what you mean.
goto cls4
:cls4
set vbsnum2=%random%
if exist temp%vbsnum2%.vbs goto searchvoice4
echo ' > "temp%vbsnum2%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp%vbsnum2%.vbs"
echo speech.speak "%custommsg%" >> "temp%vbsnum2%.vbs"
start temp%vbsnum2%.vbs
ping 1.1.1.1 -n 1 -w 500 > nul
del temp%vbsnum2%.vbs
goto cls3
:cls5
cls
goto inprogress
:search
ping 1.1.1.1 -n 1 -w 1000 > nul
echo Ene: What do you want me to search on youtube?
set custommsg=What do you want me to search on youtube?
goto searchvoice
:searchvoice
set vbsnum2=%random%
if exist temp%vbsnum2%.vbs goto searchvoice
echo ' > "temp%vbsnum2%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp%vbsnum2%.vbs"
echo speech.speak "%custommsg%" >> "temp%vbsnum2%.vbs"
start temp%vbsnum2%.vbs
ping 1.1.1.1 -n 1 -w 500 > nul
del temp%vbsnum2%.vbs
set /p sc="You: "
start "" "http://www.google.com/search?btnI=I'm+Feeling+Lucky&q=%SC%+site:youtube.com+-user+-channel+-redirect"
echo Ene: Searched!
set custommsg=Searched!
goto searchvoice2
:searchvoice2
set vbsnum2=%random%
if exist temp%vbsnum2%.vbs goto searchvoice2
echo ' > "temp%vbsnum2%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp%vbsnum2%.vbs"
echo speech.speak "%custommsg%" >> "temp%vbsnum2%.vbs"
start temp%vbsnum2%.vbs
ping 1.1.1.1 -n 1 -w 500 > nul
del temp%vbsnum2%.vbs
ping 1.1.1.1 -n 1 -w 1000 > nul
echo Ene: Do you need to search anything else?
set custommsg=Do you need to search anything else?
goto searchvoice3
:searchvoice3
set vbsnum2=%random%
if exist temp%vbsnum2%.vbs goto searchvoice3
echo ' > "temp%vbsnum2%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp%vbsnum2%.vbs"
echo speech.speak "%custommsg%" >> "temp%vbsnum2%.vbs"
start temp%vbsnum2%.vbs
ping 1.1.1.1 -n 1 -w 500 > nul
del temp%vbsnum2%.vbs
:again
set /p why="You: "
IF /I %why%==yes goto search
IF /I %why%==no goto inprogress
echo Ene: I don't understand, please simply state what you mean.
set custommsg=I don't understand, please simply state what you mean.
goto searchvoice3
:searchvoice4
set vbsnum2=%random%
if exist temp%vbsnum2%.vbs goto searchvoice4
echo ' > "temp%vbsnum2%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp%vbsnum2%.vbs"
echo speech.speak "%custommsg%" >> "temp%vbsnum2%.vbs"
start temp%vbsnum2%.vbs
ping 1.1.1.1 -n 1 -w 500 > nul
del temp%vbsnum2%.vbs
goto again
:num
set vbsnum=%random%
if exist temp%vbsnum%.vbs goto num
echo ' > "temp%vbsnum%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp%vbsnum%.vbs"
echo speech.speak "%spch%" >> "temp%vbsnum%.vbs"
start temp%vbsnum%.vbs
ping 1.1.1.1 -n 1 -w 500 > nul
del temp%vbsnum%.vbs
goto inprogress
:aicfgfunc
if not exist aicfg.txt echo.>aicfg.txt
echo Mysterious Voice: Hello, What do you wish to call me?
set /p cfgname="You: "
echo Mysterious Voice: How would you like me to start conversations with you?
set /p cfgstart="You: "
echo name=%cfgname%>aicfg.txt
echo start=%cfgstart%>>aicfg.txt
goto aicfgread
:aicfgread
set text=name
for /f "tokens=1,* delims==" %%i in (aicfg.txt) do (
  if /i "%text%"=="%%i" (
   set charname=%%j
   set spch=%%j
  )
)
set text=start
for /f "tokens=1,* delims==" %%i in (aicfg.txt) do (
  if /i "%text%"=="%%i" (
   set charstart=%%j
   set spch=%%j
  )
)
goto begin
pause
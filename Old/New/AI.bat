@echo off
if not exist languagedatabase.txt echo.>languagedatabase.txt
if not exist worddatabase.txt echo.>worddatabase.txt
if not exist aicfg.txt goto aicfgfunc
goto aicfgread
:begin
ping 1.1.1.1 -n 1 -w 1500 > nul
echo %charname%: %charstart%
call:voice "%charstart%"
goto inprogress
:unknown
ping 1.1.1.1 -n 1 -w 500 > nul
echo %charname%: I'm sorry, I don't understand what you are trying to say.
call:voice "I'm sorry, I don't understand what you are trying to say."
ping 1.1.1.1 -n 1 -w 500 > nul
echo %charname%: How should I respond?
call:voice "How should I respond?"
set /p answer="You: "
echo %text%@%answer%>>languagedatabase.txt
ping 1.1.1.1 -n 1 -w 500 > nul
echo %charname%: Thanks for helping!
call:voice "Thanks for helping!"
goto inprogress
:inprogress
set /p text="You: "
goto commandcheck
:dict
for /f "tokens=1,* delims=@" %%i in (languagedatabase.txt) do (
  if /i "%text%"=="%%i" (
   ping 1.1.1.1 -n 1 -w 500 > nul
   echo %charname%: %%j
	call:voice "%%j"
	goto inprogress
  )
)
For /F "Usebackq Tokens=1,* Delims=@" %%A in ("worddatabase.txt") Do (
    For %%@ in (%text%) DO (
        Echo "%%A"| FINDSTR /I "\"%%@\"" 1>NUL && (
		    ping 1.1.1.1 -n 1 -w 500 > nul
            echo %charname%: %%B
			call:voice "%%B"
			goto inprogress
        )
    )
)
goto unknown
:commandcheck
IF "%text%"=="search" goto search
goto dict
:search
ping 1.1.1.1 -n 1 -w 1000 > nul
echo %charname%: What do you want me to search on youtube?
call:voice "What do you want me to search on youtube?"
set /p sc="You: "
start "" "http://www.google.com/search?btnI=I'm+Feeling+Lucky&q=%SC%+site:youtube.com+'watch?v='"
echo Searched!
ping 1.1.1.1 -n 1 -w 1000 > nul
:anythingelse
echo %charname%: Do you need to search anything else?
call:voice "Do you need to search anything else?"
:again
set /p why="You: "
IF /I %why%==yes goto search
IF /I %why%==no goto inprogress
echo %charname%: I don't understand, please answer with yes or no.
call:voice "I don't understand, please answer with yes or no."
goto again
:voice
set spch=%~1
set vbsnum=%random%
if exist temp%vbsnum%.vbs goto voice "%~1"
echo ' > "temp%vbsnum%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp%vbsnum%.vbs"
echo speech.speak "%spch%" >> "temp%vbsnum%.vbs"
start temp%vbsnum%.vbs
ping 1.1.1.1 -n 1 -w 100 > nul
del temp%vbsnum%.vbs
goto:eof
:aicfgfunc
if not exist aicfg.txt echo.>aicfg.txt
echo Mysterious Voice: Hello, What do you wish to call me?
call:voice "Hello, What do you wish to call me"
set /p cfgname="You: "
echo Mysterious Voice: How would you like me to start conversations with you?
call:voice "How would you like me to start conversations with you"
set /p cfgstart="You: "
echo name=%cfgname%>aicfg.txt
echo start=%cfgstart%>>aicfg.txt
goto aicfgread
:aicfgread
set text=name
for /f "tokens=1,* delims==" %%i in (aicfg.txt) do (
	if /i "%text%"=="%%i" (
	set charname=%%j
	)
)
set text=start
for /f "tokens=1,* delims==" %%i in (aicfg.txt) do (
  if /i "%text%"=="%%i" (
	set charstart=%%j
  )
)
goto begin
pause
@echo off
if not exist languagedatabase.txt echo.>languagedatabase.txt
if not exist worddatabase.txt echo.>worddatabase.txt
if not exist aicfg.cfg goto aicfgfunc
goto aicfgread
:begin
call:say "%charname%" "%charstart%"
goto inprogress
:unknown
call:say "%charname%" "I'm sorry, I don't understand what you are trying to say."
call:say "%charname%" "How should I respond?"
set /p answer="You: "
echo %text%@%answer%>>languagedatabase.txt
call:say "%charname%" "Thanks for helping!"
goto inprogress
:inprogress
set /p text="You: "
goto commandcheck
:dict
for /f "tokens=1,* delims=@" %%i in (languagedatabase.txt) do (
	if /i "%text%"=="%%i" (
		call:say "%charname%" "%%j"
		goto inprogress
	)
)
for /f "Tokens=1,* Delims=@" %%A in (worddatabase.txt) do (
	for %%@ in (%text%) do (
		echo "%%A"| FINDSTR /i "\"%%@\"" 1>nul && (
			call:say "%charname%" "%%B"
			goto inprogress
        )
    )
)
goto unknown
:commandcheck
if "%text%"=="search" goto search
if "%text%"=="clear screen" goto cls
if "%text%"=="clear the screen" goto cls
if "%text%"=="please clear the screen" goto cls
set str1="%text%"
if not x%str1: cls=%==x%str1% goto cls
goto dict
:search
call:say "%charname%" "What do you want me to search on youtube?"
set /p sc="You: "
start "" "http://www.google.com/search?btnI=I'm+Feeling+Lucky&q=%SC%+site:youtube.com+'watch?v='"
call:say "%charname%" "I've found the most appropriate video."
call:say "%charname%" "Do you need to search anything else?"
:searchredo
set /p why="You: "
set str1="%why%"
if not x%str1:yes=%==x%str1% goto search
set str1="%why%"
if not x%str1:no=%==x%str1% goto inprogress
call:say "%charname%" "I don't understand, please answer with yes or no."
goto searchredo
:cls
call:say "%charname%" "Are you sure you want to clear the screen?"
:clsredo
set /p clsans="You: "
set str1="%clsans%"
if not x%str1:yes=%==x%str1% goto clsfin
set str1="%clsans%"
if not x%str1:no=%==x%str1% goto inprogress
call:say "%charname%" "Pardon?"
goto clsredo
:clsfin
cls
goto inprogress
:say
echo %~1: %~2
set spch=%~2
set vbsnum=%random%
if exist temp%vbsnum%.vbs goto voice "%~1"
echo ' > "temp%vbsnum%.vbs"
echo set speech = Wscript.CreateObject("SAPI.spVoice") >> "temp%vbsnum%.vbs"
echo speech.speak "%spch%" >> "temp%vbsnum%.vbs"
start temp%vbsnum%.vbs
ping 1.1.1.1 -n 1 -w 10 > nul
del temp%vbsnum%.vbs
echo %~1>x&FOR %%? in (x) do set /A strlength=%%~z? - 2&del x
set /a waittime=%strlength%*75
ping 1.1.1.1 -n 1 -w %waittime% > nul
goto:eof
:aicfgfunc
if not exist aicfg.cfg echo.>aicfg.cfg
call:say "Mysterious Voice" "Hello, What do you wish to call me?"
set /p cfgname="You: "
call:say "%cfgname%" "How would you like me to start conversations with you?"
set /p cfgstart="You: "
echo name=%cfgname%>aicfg.cfg
echo start=%cfgstart%>>aicfg.cfg
cls
goto aicfgread
:aicfgread
set text=name
for /f "tokens=1,* delims==" %%i in (aicfg.cfg) do (
	if /i "%text%"=="%%i" (
	set charname=%%j
	)
)
set text=start
for /f "tokens=1,* delims==" %%i in (aicfg.cfg) do (
  if /i "%text%"=="%%i" (
	set charstart=%%j
  )
)
goto begin
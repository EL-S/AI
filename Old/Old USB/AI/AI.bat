@echo off
if not exist languagedatabase.txt echo.>languagedatabase.txt
if not exist worddatabase.txt echo.>worddatabase.txt
:begin
ping 1.1.1.1 -n 1 -w 1500 > nul
echo Ene: Hello, I'm Ene.
goto inprogress
:unknown
ping 1.1.1.1 -n 1 -w 2000 > nul
echo Ene: I don't understand. :c
ping 1.1.1.1 -n 1 -w 1000 > nul
echo Ene: How should I respond? 
ping 1.1.1.1 -n 1 -w 1000 > nul
set /p answer="You: "
echo %text%@%answer%>>languagedatabase.txt
ping 1.1.1.1 -n 1 -w 1000 > nul
echo Duly noted!
goto inprogress
:inprogress
set /p text="You: "
goto commandcheck
:dict
for /f "tokens=1,* delims=@" %%i in (languagedatabase.txt) do (
  if /i "%text%"=="%%i" (
   ping 1.1.1.1 -n 1 -w 1000 > nul
   echo Ene: %%j
   goto inprogress
  )
)
For /F "Usebackq Tokens=1,* Delims=@" %%A in ("worddatabase.txt") Do (
    For %%@ in (%text%) DO (
        Echo "%%A"| FINDSTR /I "\"%%@\"" 1>NUL && (
		    ping 1.1.1.1 -n 1 -w 1000 > nul
            echo Ene: %%B
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
echo Ene: What do you want me to search on youtube?
set /p sc="You: "
start "" "http://www.google.com/search?btnI=I'm+Feeling+Lucky&q=%SC%+site:youtube.com+-user+-channel+-redirect"
echo Searched!
ping 1.1.1.1 -n 1 -w 1000 > nul
:anythingelse
echo Do you need to search anything else?
:again
set /p why="You: "
IF /I %why%==yes goto search
IF /I %why%==no goto inprogress
echo I don't understand, please simply state what you mean.
goto again
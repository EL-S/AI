@echo off
if not exist languagedatabase.txt echo.>languagedatabase.txt
:begin
ping 1.1.1.1 -n 1 -w 1500 > nul
echo Ene: Hello, I'm Ene.
ping 1.1.1.1 -n 1 -w 1000 > nul
set /p text="You: "
For /F "Usebackq Tokens=1,* Delims=@" %%A in ("worddatabase.txt") Do (
    For %%@ in (%text%) DO (
        Echo "%%A"| FINDSTR /I "\"%%@\"" 1>NUL && (
            echo Ene: %%B
			goto inprogress
        )
    )
)
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
ping 1.1.1.1 -n 1 -w 1000 > nul
set /p text="You: "
For /F "Usebackq Tokens=1,* Delims=@" %%A in ("worddatabase.txt") Do (
    For %%@ in (%text%) DO (
        Echo "%%A"| FINDSTR /I "\"%%@\"" 1>NUL && (
            echo Ene: %%B
			goto inprogress
        )
    )
)
goto unknown
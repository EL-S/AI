@echo off
if not exist languagedatabase.txt echo.>languagedatabase.txt
if not exist worddatabase.txt echo.>worddatabase.txt
:begin
ping 1.1.1.1 -n 1 -w 1500 > nul
echo Ene: Hello, I'm Ene.
ping 1.1.1.1 -n 1 -w 1000 > nul
goto inprogress

:inprogress
set /p text2="You: "
If "%text2%"=="search" goto searcher
goto nup
:searcher
ping 1.1.1.1 -n 1 -w 1000 > nul
echo Ene: What do you want me to search on youtube?
set /p sc="You: "
start "" "http://www.google.com/search?btnI=I'm+Feeling+Lucky&q=%SC%+site:youtube.com+-user+-channel"
echo Searched!
ping 1.1.1.1 -n 1 -w 1000 > nul
:nup
echo didn't work maybe
pause

:checker
echo hmmmm
pause
@Echo off
if not exist worddatabase.txt echo.>worddatabase.txt
:ask
Echo+
SET /P "Question=>>[YOU] "
Call :Answer "%Question%"
GOTO:ASK

:answer
Echo+
For /F "Usebackq Tokens=1,* Delims=@" %%A in ("worddatabase.txt") Do (
    For %%@ in (%Question%) DO (
        Echo "%%A"| FINDSTR /I "\"%%@\"" 1>NUL && (
            Echo:   [AI] %%B
            GOTO:ASK
        )
    )
)
Echo:   [AI] I don't understand you.
GOTO ask
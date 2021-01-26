REM  LM: batch di avvio di EMACS
REM
REM NB:
REM la variabile ambiente HOME definisce la direcotry dove Emacs cerca e scrive il file di configurazione (.emacs, .emacs.d/init.el etc)
REM il '%*' serve a passare al comando runemacs.exe eventuali parametri forniti all'avvio (da shell)
REM per indicare ad Emacs una "document root", la directory base in cui partire ad aprire il file (C-x C-f)
REM si deve usare il campo "Start in:" nello shortcut che rimanda al batch
REM NMB: indicare una path relativo per runemacs.exe, rende portabile la soluzione

D:
cd D:\home
set HOME=.\
C:\emacs\emacs-27.1-x86_64\bin\emacsclientw.exe -c -n  %*

REM c:\path\to\emacs\bin\emacsclientw.exe -c -n -a c:\path\to\emacs\bin\runemacs.exe
REM This shortcut will connect to Emacs daemon if it is running, otherwise opens a new frame.
REM 
REM   -c tells emacs to create a new frame instead of trying to use an existing frame.
REM   -n means no wait - don't wait for the server to return
REM  -a EDITOR specifies to the emacsclientw.exe which editor to run if emacs.exe is not running

REM emacsclientw.exe --create-frame --no-wait --alternate-editor runemacs.exe --server-file %APPDATA%\.emacs.d\server\server
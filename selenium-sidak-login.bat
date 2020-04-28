@echo off

::================================================
:: TOMORROW FUNCTION
::================================================
set /a d=%date:~0,2%
set /a m=%date:~3,2%
set /a y=%date:~6,4%

:loop
  set /a d+=1

  if %d% gtr 31 (
    set d=1
    set /a m+=1
     
    if %m% gtr 12 (
      set m=1
      set /a y+=1
    )
  )
xcopy /d:%m%-%d%-%y% /l . .. >nul 2>&1 || goto loop
set day=0%d%
set month=0%m%
::END TOMORROW FUNCTION

::================================================
:: RANDOM NUMBER 0 - 59 ((Y-X)+1)
::================================================
set /a min=%random%%% 59
set /a sec=%random%%% 59
set minute=0%min%
set second=0%sec%

title Selenium Auto Login sidak.unmul.ac.id
echo Running script: selenium-sidak.py
C:\Users\ROG-GL553VD\Anaconda3\python.exe selenium-sidak.py
echo Crete Task Scheduler on %day:~-2%/%month:~-2%/%y% 07:%minute:~-2%:%second:~-2%
SCHTASKS /CREATE /SC ONCE /TN "Selenium\SIDAK Autologin" /TR "D:\python-project\selenium-sidak\selenium-sidak-login.bat" /SD %day:~-2%/%month:~-2%/%y% /ST 07:%minute:~-2%:%second:~-2%
SCHTASKS /CREATE /SC ONCE /TN "Selenium\SIDAK Autologout" /TR "D:\python-project\selenium-sidak\selenium-sidak-logout.bat" /SD %day:~-2%/%month:~-2%/%y% /ST 16:%minute:~-2%:%second:~-2%
pause
exit 1
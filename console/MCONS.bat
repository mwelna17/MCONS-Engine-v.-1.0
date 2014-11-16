@echo off
title MCONS Engine v. 1.0
color a
:activate
echo Login into console by typing "login"
echo if you don't have an account then type "register"
set /p "menu=>"
if %menu%==login goto login
if %menu%==register goto rej
if %menu%==%apass% goto console
goto error

:welcome
echo Authorizing completed.
pause
goto console

:console
title MCONS Engine v. 1.0 - Main Panel
cls
echo Type a command here:
set /p "menu=?"
if %menu%==exit exit
if %menu%==goto shut
if %menu%==help goto help
if %menu%==calc goto calc
if %menu%==about goto about
if %menu%==create goto create
if %menu%==create_txt goto create_txt
if %menu%==say goto say
if %menu%==variable goto variable
if %menu%==variable_show goto variable_show
if %menu%==list goto list
if %menu%==color_a goto color_a
if %menu%==color_b goto color_b
if %menu%==color_c goto color_c
if %menu%==color_d goto color_d
if %menu%==color_e goto color_e
if %menu%==color_standard goto color_standard
if %menu%==color goto color
if %menu%==color_ goto color
if %menu%==refresh goto refresh
if %menu%==ip_settings goto ip_settings
if %menu%==launch goto launch
if %menu%==variable_del goto variable_del
goto errorcommand
)
) else (goto errorcommand)

:launch
echo Type directory of application
set /p A=App
start %A%
pause
goto console

:color
cls
echo There is a description of this command in Help
pause
goto helpcolor

:refresh
start MCONS.bat /b
exit

:error
cls
echo Authorizing failed. Try again
pause
goto activate

:errorcommand
echo Wrong syntax or command. Try again
pause
cls
goto console

:rej
    cls
    if exist Username.uf (
    if exist Password.uf (
    goto login
    )) Else (goto reg)
     
    :reg
title MCONS Engine v. 1.0 - Register
    
    echo Register
    echo.
    echo.
    set /p U=User:
    set /p P=Pass:
    echo %P%>password.uf
    echo %U%>username.uf
    echo Registering completed!
    pause
    goto login


:ip_settings
ipconfig
pause
goto console

:color_standard
cls
color a
echo Color changed to standard
pause
goto console

:color_a
color b
goto console

:color_b
color c
goto console

:color_c
color d
goto console

:color_d
color e
goto console


:color_e
color f
goto console

:list
title MCONS Engine v. 1.0 - list
echo Type directory to list
set /p L=List:
tree %L%
pause
goto console


:variable
title MCONS Engine v. 1.0 - Creating variable
cls
rem echo The variable's name is ALWAYS "variable"
echo Name variable
set /p N=Name
echo %N%>local_name.uf
echo Type something in variable
set /p T=Text:
echo %T%>local_text.uf
set /a %N% = %T%
cls
echo Variable %N% successfuly created
pause
goto console
)
) else (goto errorcommand)

:variable_show
if exist local_name.uf goto variable_show1
if not exist local_name.uf goto variable_show2
if exist local_text.uf goto variable_show1
if not exist local_text.uf goto variable_show2

:variable_show1
cls
echo Variable %N% is %T%
pause
goto console

:variable_show2
cls
echo Variable doesn't exist. You can create it by "variable" command
pause
goto console

:variable_del
echo Are you sure to delete variable %N%?
set /p "menu=>"
if %menu%==yes goto variable_del_yes
if %menu%==no goto console
goto errorcommand

:variable_del_yes
del local_name.uf
del local_text.uf
echo variable successfuly deleted
pause
goto console
)
) else (goto errorcommand)

:variable_show_file
start local_text.uf
pause
goto console

:say
cls
echo Type text to say
set /p txt=Text
echo %txt%
if %txt%==%N% goto variable_show
pause
goto console


:create_txt
title MCONS Engine v. 1.0 - Create file
echo enter directory
echo REMEMBER about file extension, for example: example.TXT
set /p DF=FileDirect
if exist %DF% goto file_exist
copy example.txt %DF%
echo %DF%
pause
)
) else (goto errorcommand)
if exist %DF% goto create_file_fine
if not exist %DF% goto create_file_error

:file_exist
title MCONS Engine v. 1.0 - File already exist
cls
echo File %DF% already exists!
echo Try again typing other directory
pause
goto create_txt

:create_file_fine
title MCONS Engine v. 1.0 - Success creating .txt file
cls
echo file %DF% successfuly created
pause
goto console

:create_file_error
title MCONS Engine v. 1.0 - File creating error
cls
echo Error creating file: Wrong directory or syntax error
echo Try again
pause
goto create_txt

:create
title MCONS Engine v. 1.0 - Create folder
echo Enter directory
set /p D=Direct
if exist %D% goto folder_exist
md %D%
echo %D%
pause
)
) else (goto errorcommand)
if exist %D% goto create_fine
if not exist %D% goto create_error

:folder_exist
title MCONS Engine v. 1.0 - Folder already exist
cls
echo Folder %D% already exists!
echo Try again typing other directory
pause
goto create

:create_fine
title MCONS Engine v. 1.0 - Success creating folder
cls
echo folder %D% succesfully created
pause
goto console

:create_error
title MCONS Engine v. 1.0 - Folder creating error
cls
echo Error creating folder: Wrong directory or syntax error
echo Try again
pause
goto create

:login
    cls
    setlocal
    set User2=
    for /f "tokens=*" %%a in ('type username.uf 2^>NUL') do set User2=%%a
    for /f "tokens=*" %%a in ('type password.uf 2^>NUL') do set Pass2=%%a
     
    :Loginp2
title MCONS Engine v. 1.0 - Login
    cls
    echo Login
    echo.
    set /p user= User:
    set /p pass= Pass:
    if /i %user% equ %User2% (
    if /i %pass% equ %Pass2% (
    goto welcome
    )
    ) else (goto fail)
     
    :fail
title MCONS Engine v. 1.0 - Fail Authorization
    cls
    echo Password or username is wrong. Try again
    pause
    goto login

   :shut
    shutdown -s
	


:calc
title MCONS Engine v. 1.0 - Calculator
cls
echo A calculator for simple operations
set /p calc=enter operation:
set /a calc=%calc%
echo %calc%=%calc2%
pause > nul
cls
echo type "calc" to return to calculator
echo type "return" to get to main panel
set /p "menu=>"
if %menu%==return goto console
if %menu%==calc goto calc
goto errorcommand

:help
title MCONS Engine v. 1.0 - Help
cls
echo Avaible commands:
echo lol,exit,shut,help,calc,create,create_txt,say,variable,variable_show,color,
echo refresh,ip_settings,launch,variable_del
echo type "return" to get to the main panel again
set /p "menu=>"
if %menu%==exit goto exithelp
if %menu%==shut goto shuthelp
if %menu%==help goto helphelp
if %menu%==calc goto helpcalc
if %menu%==create goto helpcreate
if %menu%==create_txt goto helpcreatetxt
if %menu%==say goto helpsay
if %menu%==variable goto helpvariable
if %menu%==variable_show goto helpvariableshow
if %menu%==color goto helpcolor
if %menu%==refresh goto helprefresh
if %menu%==ip_settings goto helpipsettings
if %menu%==launch goto helplaunch
if %menu%==variable_del goto helpvariabledel
if %menu%==return goto console
goto errorhelp

:helpvariabledel
title MCONS Engine v. 1.0 - Help - variable_del
cls
echo Clears the variable
pause
goto help

:helplaunch
title MCONS Engine v. 1.0 - Help - launch
cls
echo This command launches applications
pause
goto help

:helpipsettings
title MCONS Engine v. 1.0 - Help - ip_settings
cls
echo Shows ips and other connection stuff
pause
goto help

:lolhelp
title MCONS Engine v. 1.0 - Help - lol
cls
echo Little suprise
pause
goto help

:exithelp
title MCONS Engine v. 1.0 - Help - close
cls
echo Exits the programm
pause
goto help

:shuthelp
title MCONS Engine v. 1.0 - Help - shut
echo Shuts down the computer
pause
goto help

:helphelp
title MCONS Engine v. 1.0 - Help - help
cls
echo Shows the help
pause
goto help

:helpcalc
title MCONS Engine v. 1.0 - Help - calc
cls
echo A simple calculator
pause
goto help

:helpcreate
title MCONS Engine v. 1.0 - Help - create
cls
echo That command simply creates folder in typed directory
pause
goto help

:helpcreatetxt
title MCONS Engine v. 1.0 - Help - create_txt
cls
echo That command creates .txt file in typed directory
pause
goto help

:helpsay
title MCONS Engine v. 1.0 - Help - say
cls
echo say is a command that shows the typed text
echo Text typed in this command saves as a variable and can be used in other commands
pause
goto help

:helpvariable
title MCONS Engine v. 1.0 - Help - variable
cls
echo That command creates a variable
echo Warning! This command is still under development. Some bugs may occur while using it
pause
goto help

:helpvariableshow
title MCONS Engine v. 1.0 - Help - variable_show
cls
echo That command shows the variable that is set by command "variable"
echo Warning! This command is still under development. Some bugs may occur while using it
pause
goto help

:helpcolor
title MCONS Engine v. 1.0 - Help - color
cls
echo usage: color_a-e
echo a=cyan, b=red, c=magenta, d=yellow/orange, e=white, standard= standard,green color
pause
goto help

:helprefresh
title MCONS Engine v. 1.0 - Help - refresh
cls
echo Restarts the programm
pause
goto help

:errorhelp
cls
echo There is no such command in database
pause
goto help


:about
cls
title MCONS Engine v. 1.0 - About
echo You can read the tex about MCONS
pause
start about.txt
pause
goto console
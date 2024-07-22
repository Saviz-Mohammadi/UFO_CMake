@echo off
setlocal enabledelayedexpansion



REM Note: Windows does not play well with double "" and spaces in file paths.
REM
REM PATHS:
set PATH_JQ_EXECUTABLE=.\..\jq\jq-windows-amd64.exe
set PATH_CONFIGURATION=.\config.json



REM Flags for echoing messages and deleting build directory:
set "extraEchoEnabled=false"



REM This section will make sure to check all arguments passed to the script
REM one by one to see if there is an argument named "-e" (echo).
:check_arguments
if "%~1" == "-e" (

    set "extraEchoEnabled=true"
)

REM Shift arguments to process the next one.
shift
if not "%~1"=="" goto check_arguments



REM Variable corresponding to build directory argument and value.
set "-B=-B"
set "B_value="



REM echo messages.
if !extraEchoEnabled! == true (
    
    echo.
    echo "Output of what was provided from jq program"
    echo [[---------------------------------------------------------------]]
    echo [[---------------------------------------------------------------]]
    echo.
)



REM Loop through each option and value pair using jq.
REM Each pair value is concatinated using '@' symbol, then seperated using delimiter as '@'.
for /f "tokens=1,2 delims=@" %%a in ('%PATH_JQ_EXECUTABLE% -r ".cmake_args[] | .option + \"@\" + .value" %PATH_CONFIGURATION%') do (
    
    REM Process each option and value pair.
    set "option=%%a"
    set "value=%%b"
    
    REM Determine which variable to assign based on the option.
    if "!option!"=="-B" (
    
        set "B_value=!value!"
    )

    REM echo messages.
    if !extraEchoEnabled! == true (
        
        echo !option!, !value!
    )
)



REM echo messages.
if !extraEchoEnabled! == true (
    
    echo.
    echo [[---------------------------------------------------------------]]
    echo [[---------------------------------------------------------------]]
    echo.
    echo.
)



REM echo messages.
if !extraEchoEnabled! == true (
    
    echo.
    echo "Output of what is stored in variable after processing"
    echo [[---------------------------------------------------------------]]
    echo [[---------------------------------------------------------------]]
    echo.
    
    
    
    echo %-B%, %B_value%
)



REM Run tests using CTest.
ctest --test-dir %B_value%



endlocal
@echo off
setlocal enabledelayedexpansion



REM Note: Windows does not play well with double "" and spaces in file paths.
REM
REM PATHS:
set PATH_JQ_EXECUTABLE=.\..\jq\jq-windows-amd64.exe
set PATH_CONFIGURATION=.\config.json



REM Flags for echoing messages and deleting build directory:
set "extraEchoEnabled=false"
set "removingBEnabled=false"



REM This section will make sure to check all arguments passed to the script
REM one by one to see if there is an argument named "-e" (echo).
:check_arguments
if "%~1" == "-e" (

    set "extraEchoEnabled=true"
)

if "%~1" == "-d" (

    set "removingBEnabled=true"
)

REM Shift arguments to process the next one.
shift
if not "%~1"=="" goto check_arguments



REM Variables corresponding to each CMake argument and value.
REM You can expand this list as needed.
set "-S=-S"
set "S_value="

set "-B=-B"
set "B_value="

set "-G=-G"
set "G_value="

set "-DCMAKE_TOOLCHAIN_FILE=-DCMAKE_TOOLCHAIN_FILE"
set "DCMAKE_TOOLCHAIN_FILE="



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
    if "!option!"=="-S" (
    
        set "S_value=!value!"
    ) else if "!option!"=="-B" (
    
        set "B_value=!value!"
    ) else if "!option!"=="-G" (
    
        set "G_value=!value!"
    ) else if "!option!"=="-DCMAKE_TOOLCHAIN_FILE" (

        set "DCMAKE_TOOLCHAIN_FILE=!value!"
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
    echo "Output of what is stored in variables after processing"
    echo [[---------------------------------------------------------------]]
    echo [[---------------------------------------------------------------]]
    echo.
    
    
    
    echo %-S%, %S_value%
    echo %-B%, %B_value%
    echo %-G%, %G_value%
    echo %-DCMAKE_TOOLCHAIN_FILE%, %DCMAKE_TOOLCHAIN_FILE%
)



REM echo messages.
if !extraEchoEnabled! == true (
    
    echo.
    echo [[---------------------------------------------------------------]]
    echo [[---------------------------------------------------------------]]
    echo.
    echo.
)



if !removingBEnabled! == true (

    echo Deleting contents of %B_value%
    
    rd /s /q "%B_value%"
    
    mkdir "%B_value%"
    
    echo "Delete operation complete."
)



REM Initialize Arguments as empty
set "Arguments="



REM Add arguments with non-empty values to Arguments variable
if not "%S_value%"=="" set "Arguments=!Arguments! -S "%S_value%""
if not "%B_value%"=="" set "Arguments=!Arguments! -B "%B_value%""
if not "%G_value%"=="" set "Arguments=!Arguments! -G "%G_value%""
if not "%DCMAKE_TOOLCHAIN_FILE%"=="" set "Arguments=!Arguments! -DCMAKE_TOOLCHAIN_FILE="%DCMAKE_TOOLCHAIN_FILE%""



REM echo messages.
if !extraEchoEnabled! == true (
    
    echo.
    echo "Output of what is stored in Arguments"
    echo [[---------------------------------------------------------------]]
    echo [[---------------------------------------------------------------]]
    echo.
    echo %Arguments%
)



REM echo messages.
if !extraEchoEnabled! == true (
    
    echo.
    echo [[---------------------------------------------------------------]]
    echo [[---------------------------------------------------------------]]
    echo.
    echo.
)



REM Call cmake to generate project.
cmake %Arguments%



REM Call cmake to build project.
cmake --build %B_value% --parallel



endlocal

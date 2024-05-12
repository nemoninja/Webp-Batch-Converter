@echo off
goto :init

:header
    echo Converts all images in a specified folder to .webp format.
    echo.
    goto :eof

:usage
    echo USAGE:
    echo   %__BAT_NAME% "folder_path"
    goto :eof

:missing_argument
    call :header
    call :usage
    echo.
    echo Error: Please specify a folder path or try "--help".
    goto :eof

:init
    set "RequiredArg="

:parse
    if "%~1"=="" goto :validate
    if /i "%~1"=="--help"     call :header & call :usage "%~2" & goto :end

    if not defined RequiredArg     set "RequiredArg=%~1"     & shift & goto :parse

    shift
    goto :parse

:validate
    if not defined RequiredArg call :missing_argument & goto :end

:main
    echo File path to search:    "%RequiredArg%"
	
	for %%a in (%RequiredArg%\.) do set "NewFolderName=%%~nxa"
	set Timestamp=%DATE:/=%_%TIME::=%
	set Timestamp=%Timestamp: =%
	set Timestamp=%Timestamp:,=.%
	set "NewFolderName=%NewFolderName%_%Timestamp%"
	
	mkdir %NewFolderName%
	
	for /f "usebackq delims=|" %%f in (`dir /b "%RequiredArg%" ^| findstr /ir ".png .jpg"`) do (
	echo %%f detected.
	start cwebp "%RequiredArg%\%%f" -o %NewFolderName%\%%~nf.webp
	echo %%f is converted.
	)
	goto :end

:end
    call :cleanup
    exit /B

:cleanup
    REM The cleanup function is only really necessary if you
    REM are _not_ using SETLOCAL.
    set "RequiredArg="
    goto :eof
@echo off
REM Usage: package.bat v1.4.4
REM Regenerates duckdb.tar.gz from the duckdb-sources submodule
REM with the correct DUCKDB_VERSION embedded.

if "%~1"=="" (
    echo Usage: package.bat ^<version^>
    echo Example: package.bat v1.4.4
    exit /b 1
)

set OVERRIDE_GIT_DESCRIBE=%~1

if exist duckdb rd /s /q duckdb
if exist duckdb.tar.gz del duckdb.tar.gz

python.exe update_sources.py

@echo off

 

rem arguments:

rem   %1: path or name of a specific file to check.

 

if defined %1 do (

        goto scan_var

) else (

        goto scan_dir

)

goto end

 

:scan_var

"C:\Program Files (x86)\LuaJit\lua5.1.exe" LuaCheck.lua %1 %2

goto end

 

:scan_dir

for %%f in (.\*.script) do (

        "C:\Program Files (x86)\LuaJit\lua5.1.exe" "%cd%\LuaCheck.lua" "%%f"

        if %errorlevel% neq 0 pause

)

goto end

 

:end

rem del /Q LuaCheck.log

rem del /Q luac.out

pause
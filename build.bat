@echo off
setlocal enabledelayedexpansion

if not exist "mods" mkdir "mods"

:: 使用robocopy复制所有文件并展平目录结构
for /r "rawmods" %%f in (*) do (
    set "filename=%%~nxf"
    set "counter=1"
    
    :check_duplicate
    if exist "mods\!filename!" (
        set "filename=%%~nx!counter!f"
        set /a counter+=1
        goto check_duplicate
    )
    
    copy "%%f" "mods\!filename!" >nul
)

echo All files copied from rawmods to mods (flattened structure)
pause

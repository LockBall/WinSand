@echo off
echo Doing All The Things ...

    echo disable hide file extensions
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f

    echo hot and black
        :: Remove wallpaper path
        reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f

        :: Set background color to black (RGB 0 0 0)
        reg add "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "0 0 0" /f

        :: Optional: force solid color mode
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v BackgroundType /t REG_DWORD /d 1 /f

        :: Enable dark mode for apps and system
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v AppsUseLightTheme /t REG_DWORD /d 0 /f
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v SystemUsesLightTheme /t REG_DWORD /d 0 /f


    echo restart explorer
        taskkill /f /im explorer.exe
        timeout /t 2 >nul
        start explorer.exe

    echo Reopen Explorer
        timeout /t 1 >nul
        start "" "C:\from_host"

:: Keep window open
echo.
pause

# build.ps1 - idempotent Ninja build using VS Dev environment
# Removes previous build folder, sets MSVC x64 environment, configures with Ninja, and builds Release.

if (Test-Path -Path "C:\dev\my-app\build") {
    Write-Host "Removing existing build folder..."
    Remove-Item -LiteralPath "C:\dev\my-app\build" -Recurse -Force
}

# Run the VS developer batch and the CMake/Ninja commands inside the same cmd process
cmd.exe /c '"C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\VsDevCmd.bat" -arch=amd64 && cmake -S C:\dev\my-app -B C:\dev\my-app\build -G "Ninja" && cmake --build C:\dev\my-app\build --config Release'

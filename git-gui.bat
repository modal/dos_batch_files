@echo off
rem This script allows one to pull up a git gui for the current directory
rem REQUIRES
rem msysgit installation
rem activestate tcl for wish.exe

start c:\tcl\bin\wish.exe %gitdir%\libexec\git-core\git-gui %*
rem start c:\tcl\bin\wish.exe c:\bin\git\msysgit\libexec\git-core\git-gui

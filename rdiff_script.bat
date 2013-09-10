@echo off
rem **************************************************************************
rem
rem rdiff_script.bat
rem
rem **************************************************************************
rem
rem Description:
rem
rem rdiff-backup script for creating incremental backups of working
rem directories at work to another hard drive.
rem
rem rdiff-backup can be downloaded from the following link:
rem http://www.nongnu.org/rdiff-backup/
rem
rem
rem Requirements:
rem
rem Requires rdiff-backup to be mapped to the path environment variable.
rem
rem
rem Notes:
rem
rem Nest folders up to Base folder must be created for rdiff-backup to work.
rem schtask command can be used for scheduling tasks.
rem http://ss64.com/nt/schtasks.html
rem http://support.microsoft.com/kb/308569
rem http://drupal.org/node/31506
rem
rem http://stackoverflow.com/questions/245395/hidden-features-of-windows-batch-files
rem
rem Maintenance:
rem
rem Periodically remove old incremental saves and verify the backup.
rem
rem Alternative Solutions:
rem
rem BUP is a backup utility built around git and maybe more suitable for my use
rem when it has a stable release.
rem
rem **************************************************************************

echo %0 start

set DRV=e:

IF EXIST %DRV% GOTO :DRV_EXISTS
echo ############################
echo  eee  RR    RR    OO    RR
echo E    R  R  R  R  O  O  R  R
echo Eee  RRR   RRR   O  O  RRR
echo E    R  R  R  R  O  O  R  R
echo Eeee R   R R   R  OO   R   R
echo ############################
echo ERROR: %DRV% DRIVE NOT CONNECTED, RDIFF-BACKUP SCRIPT NOT RUN
pause
exit

:DRV_EXISTS
rdiff-backup --print-statistics --verbosity 5 --terminal-verbosity 5 --create-full-path c:\_bkspc %DRV%\rd_backup\_bkspc
rdiff-backup --print-statistics --verbosity 5 --terminal-verbosity 5 --create-full-path c:\bin %DRV%\rd_backup\bin
rdiff-backup --print-statistics --verbosity 5 --terminal-verbosity 5 --create-full-path c:\home %DRV%\rd_backup\home
rdiff-backup --print-statistics --verbosity 5 --terminal-verbosity 5 --create-full-path c:\projects %DRV%\rd_backup\projects
rdiff-backup --print-statistics --verbosity 5 --terminal-verbosity 5 --create-full-path c:\repo %DRV%\rd_backup\repo
rdiff-backup --print-statistics --verbosity 5 --terminal-verbosity 5 --create-full-path c:\license %DRV%\rd_backup\license

echo RDIFF backup batch script complete

pause

rem **************************************************************************
rem Useful rdiff-backup commands
rem
rem Backup without printing to the screen.
rem rdiff-backup c:\home e:\rd_backup\home
rem Verify Backup Directory
rem rdiff-backup --verify-at-time now e:\rd_backup\home
rem Compare Folders
rem rdiff-backup --compare-full c:\home e:\rd_backup\home
rem Deleting older files (4 weeks)
rem rdiff-backup --remove-older-than 4W e:\rd_backup\home
rem **************************************************************************


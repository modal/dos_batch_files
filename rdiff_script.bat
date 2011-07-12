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
rem directories at work.
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
rem
rem Maintenance:
rem
rem Periodically remove old incremental saves and verify the backup.
rem
rem **************************************************************************

IF EXIST G: GOTO :GEXISTS
echo ############################
echo  eee  RR    RR    OO    RR
echo E    R  R  R  R  O  O  R  R
echo Eee  RRR   RRR   O  O  RRR
echo E    R  R  R  R  O  O  R  R
echo Eeee R   R R   R  OO   R   R
echo ############################
echo ERROR: G DRIVE NOT CONNECTED, RDIFF-BACKUP SCRIPT NOT RUN
pause
exit

:GEXISTS
rdiff-backup --print-statistics --verbosity 5 --terminal-verbosity 5 c:\Keil\C51\projects g:\rd_backup\Keil\C51\projects
rdiff-backup --print-statistics --verbosity 5 --terminal-verbosity 5 c:\_bkspc g:\rd_backup\_bkspc
rdiff-backup --print-statistics --verbosity 5 --terminal-verbosity 5 c:\adsp g:\rd_backup\adsp
rdiff-backup --print-statistics --verbosity 5 --terminal-verbosity 5 c:\bin g:\rd_backup\bin
rdiff-backup --print-statistics --verbosity 5 --terminal-verbosity 5 c:\home g:\rd_backup\home
rdiff-backup --print-statistics --verbosity 5 --terminal-verbosity 5 c:\projects g:\rd_backup\projects
rdiff-backup --print-statistics --verbosity 5 --terminal-verbosity 5 c:\repo g:\rd_backup\repo
rdiff-backup --print-statistics --verbosity 5 --terminal-verbosity 5 c:\license g:\rd_backup\license



pause

rem **************************************************************************
rem Useful rdiff-backup commands
rem
rem Backup without printing to the screen.
rem rdiff-backup c:\home g:\rd_backup\home
rem Verify Backup Directory
rem rdiff-backup --verify-at-time now g:\rd_backup\home
rem Compare Folders
rem rdiff-backup --compare-full c:\home g:\rd_backup\home
rem Deleting older files (4 weeks)
rem rdiff-backup --remove-older-than 4W g:\rd_backup\home
rem **************************************************************************


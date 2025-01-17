
REM ========== START PARAMETER SETTINGS ================
set geodmsversion=GeoDms16.0.5
set exe_dir=C:\Program Files\ObjectVision\%geodmsversion%
set ProgramPath=%exe_dir%\GeoDmsRun.exe
set LocalDataProjDir=C:\LocalData\LandUseScanner_Germany
set MT_FLAGS=/S1 /S2 /S3

REM ========= END PARAMETER SETTINGS ===========

set CurrentDir=%CD%
CD ..
set ProjDir=%CD%
CD %CurrentDir%

:runScenarios

call ..\batch\RunImpl.cmd %ProjDir%\cfg\main.dms /ModelRuns/Baseline/Generate_AllYear
if %ErrorLevel% NEQ 0 goto ErrorEnd

REM call ..\batch\RunImpl.cmd %ProjDir%\cfg\main.dms /ModelRuns/Trend/Generate_AllYear
REM if %ErrorLevel% NEQ 0 goto ErrorEnd

REM call ..\batch\RunImpl.cmd %ProjDir%\cfg\main.dms /ModelRuns/Dynamik/Generate_AllYear
REM if %ErrorLevel% NEQ 0 goto ErrorEnd


echo "Ready ?"
pause

exit

:ErrorEnd
echo "%ErrorLevel%"
echo "Something went wrong..."
pause

exit
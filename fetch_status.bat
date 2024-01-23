@echo off
for /D %%i in (*) do (
	cd %~dp0%%i
	if exist .git\ (
		echo .
		echo =======================================
		echo              %%i
		echo =======================================
		git fetch
		git status
		echo .
		echo .
	)
)
pause
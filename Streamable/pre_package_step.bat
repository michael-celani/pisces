pushd "%~dp0."
copy /Y ..\README.md datafiles\README.md
copy /Y ..\CHANGELOG.md datafiles\CHANGELOG.md
popd

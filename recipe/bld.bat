
cd win32
cscript configure.js prefix=%LIBRARY_PREFIX% include=%LIBRARY_INC% ^
        lib=%LIBRARY_LIB% sodir=%LIBRARY_BIN% iconv=yes zlib=yes
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1

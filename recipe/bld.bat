:: Export symbols in RcppExports.cpp
sed -i -e "s/void R_init_quanteda_textstats/__declspec(dllexport) void R_init_quanteda_textstats/" src/RcppExports.cpp
IF %ERRORLEVEL% NEQ 0 exit 1
:: Remove part of PKG_LIBS that tries to link non-existent libraries.
sed -i -e "s/$(LAPACK_LIBS) $(BLAS_LIBS)//" src/Makevars.win
IF %ERRORLEVEL% NEQ 0 exit 1

"%R%" CMD INSTALL --build . %R_ARGS%
IF %ERRORLEVEL% NEQ 0 exit /B 1

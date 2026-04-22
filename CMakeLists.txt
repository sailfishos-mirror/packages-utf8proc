cmake_minimum_required(VERSION 3.10)
project(swipl-utf8proc)

include("../cmake/PrologPackage.cmake")

find_package(PkgConfig REQUIRED)
pkg_check_modules(UTF8PROC IMPORTED_TARGET libutf8proc)
if(TARGET PkgConfig::UTF8PROC)

swipl_plugin(
    utf8proc
    MODULE unicode4pl
    C_SOURCES unicode4pl.c
    C_LIBS PkgConfig::UTF8PROC
    PL_LIBS unicode.pl)

pkg_doc(utf8proc
	SECTION
	    unicode.pl)

test_libs(utf8proc)

endif()

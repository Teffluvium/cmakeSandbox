# - Try to find UnitTest++
#
#

SET (UNITTEST++_FOUND FALSE)

FIND_PATH (UNITTEST++_INCLUDE_DIR UnitTest++.h
	/usr/include/unittest++
	/usr/include/UnitTest++
	/usr/local/include/unittest++
	/opt/local/include/unittest++
	/usr/local/include/UnitTest++
	/opt/local/include/UnitTest++
	$ENV{UNITTESTXX_PATH}/src
	$ENV{UNITTESTXX_INCLUDE_PATH}
	)

FIND_LIBRARY (UNITTEST++_LIBRARY NAMES UnitTest++ PATHS
	/usr/lib
	/usr/local/lib
	/opt/local/lib
	$ENV{UNITTESTXX_PATH}
	ENV{UNITTESTXX_LIBRARY_PATH}
	)

IF (UNITTEST++_INCLUDE_DIR AND UNITTEST++_LIBRARY)
	SET (UNITTEST++_FOUND TRUE)
ENDIF (UNITTEST++_INCLUDE_DIR AND UNITTEST++_LIBRARY)

IF (UNITTEST++_FOUND)
   IF (NOT UnitTest++_FIND_QUIETLY)
      MESSAGE(STATUS "Found UnitTest++: ${UNITTEST++_LIBRARY}")
   ENDIF (NOT UnitTest++_FIND_QUIETLY)
ELSE (UNITTEST++_FOUND)
   IF (UnitTest++_FIND_REQUIRED)
      MESSAGE(FATAL_ERROR "Could not find UnitTest++")
   ENDIF (UnitTest++_FIND_REQUIRED)
ENDIF (UNITTEST++_FOUND)

MARK_AS_ADVANCED (
	UNITTEST++_INCLUDE_DIR
	UNITTEST++_LIBRARY
	)

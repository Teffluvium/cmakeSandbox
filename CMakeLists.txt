cmake_minimum_required(VERSION 3.1)

project( cmakeSandbox )

message( "CMAKE_SYSTEM_NAME                     = ${CMAKE_SYSTEM_NAME}")
message( "CMAKE_SYSTEM_VERSION                  = ${CMAKE_SYSTEM_VERSION}")
message( "CMAKE_SYSTEM                          = ${CMAKE_SYSTEM}")
message( "CMAKE_CXX_COMPILER                    = ${CMAKE_CXX_COMPILER}")
message( "CMAKE_CXX_COMPILER_ID                 = ${CMAKE_CXX_COMPILER_ID}")
message( "CMAKE_CXX_COMPILER_VERSION            = ${CMAKE_CXX_COMPILER_VERSION}")
message( "CMAKE_CXX_COMPILER_EXTERNAL_TOOLCHAIN = ${CMAKE_CXX_COMPILER_EXTERNAL_TOOLCHAIN}")
message( "CMAKE_MODULE_PATH                     = ${CMAKE_MODULE_PATH}")

## Find required external utilities
set( CMAKE_MODULE_PATH
    ${CMAKE_MODULE_PATH}
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules"
    )

# Add Boost package
find_package( Boost )
include_directories( ${Boost_INCLUDE_DIRS} )

# Add OpenCV package
# Explicitly sets (if it exists) the local OpenCV_DIR to the system environment variable
# This was not implicitly occurring in the Ubuntu build of the project
set( OpenCV_DIR $ENV{OpenCV_DIR} )
find_package( OpenCV HINTS /usr/local/opt/opencv3 )
include_directories( ${OpenCV_INCLUDE_DIRS} )

# Add JsonCpp package
find_package( JsonCpp REQUIRED )
include_directories( ${JSONCPP_INCLUDE_DIRS} )

# Add UnitTest++ package
find_package( UnitTest++ REQUIRED )
include_directories( ${UNITTEST++_INCLUDE_DIR} )

# Pass the system name to the compiler
add_compile_options("-D ${CMAKE_SYSTEM_NAME}")

# Update the LIBS to include Boost, OpenCV, and JsonCpp
set( LIBS ${LIBS}
    ${OpenCV_LIBRARIES}
    ${JSONCPP_LIBRARIES}
    ${Boost_LIBRARIES}
    ${UNITTEST++_LIBRARY}
    )

# Set some compiler flags and config items
set( CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/build" )

set( CMAKESANDBOX_SOURCES
    cmakeSandbox.cpp
    )

add_executable( ${PROJECT_NAME} ${CMAKESANDBOX_SOURCES} )

set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 11)

link_libraries( stdc++fs )
set_property(
    TARGET ${PROJECT_NAME}
    PROPERTY CXX_STANDARD 11 )

target_link_libraries( ${PROJECT_NAME}
    ${LIBS}
    ${EXTERNAL_LIBS}
    ${OpenCV_LIBRARIES}
    ${JSONCPP_LIBRARIES}
    # ${Boost_FILESYSTEM_LIBRARY}
    # ${Boost_SYSTEM_LIBRARY}
    ${UNITTEST++_LIBRARY}
    )


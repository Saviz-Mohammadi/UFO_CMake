cmake_minimum_required(VERSION "3.30.0" FATAL_ERROR)


# [[ Project ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

# Project name cannot contain spaces. Use underlines instead.

project("Project_Name"
	
    VERSION 0.0.1

    DESCRIPTION "Project description"

    LANGUAGES CXX)

set(EXECUTABLE_NAME "${PROJECT_NAME}")


set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Project ]]





# [[ CMake Tools ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

# Note: For this option to work, you need to activate Catch2 as well.
option(USE_UNIT_TESTS

    "Activates the use of 'unit_tests'"
    OFF)


# Note: For this option to work, clangFormat must be installed on the system.
option(USE_TOOL_CLANGFORMAT

    "Activates the tool 'clangFormat' for the project"
    OFF)


# Note: For this option to work, Doxygen must be installed on the system.
option(USE_TOOL_DOXYGEN

    "Activates the tool 'Doxygen' for the project"
    OFF)


# Note: This is only for the Windows operating system.
option(USE_TOOL_COPY_DLLS

    "This tool will copy all DLL files to the destination binary folder"
    OFF)


# Note: This is only for the Windows operating system.
option(USE_TOOL_FORCE_STATIC_MSVC

    "This tool will force static building with MSVC"
    OFF)


option(USE_TOOL_COPY_RESOURCES

    "This tool copies all resource files to the destination binary folder"
    OFF)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ CMake Tools ]]





# [[ External Library Options ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

option(USE_LIB_NLOHMANN_JSON

    "Adds the library 'nlohmann_json' to the project"
    OFF)


option(USE_LIB_FMT

    "Adds the library 'fmt' to the project"
    OFF)


option(USE_LIB_SPDLOG

    "Adds the library 'spdlog' to the project"
    OFF)


option(USE_LIB_CXXOPTS

    "Adds the library 'cxxopts' to the project"
    OFF)


option(USE_LIB_CATCH2

    "Adds the library 'Catch2' to the project"
    OFF)


option(USE_LIB_WXWIDGETS
	
    "Adds the library 'wxWidgets' to the project"
    OFF)
	

option(USE_LIB_BOOST
	
    "Adds the library 'Boost' to the project"
    OFF)


option(USE_LIB_CURL

    "Adds the library 'curl' to the project"
    OFF)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ External Library Options ]]





# [[ Output Locations ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

set(OUTPUT_DIRECTORY "")

set(CMAKE_BINARY_DIR "${CMAKE_SOURCE_DIR}/../build/bin")




if(CMAKE_SIZEOF_VOID_P EQUAL 8)

    set(OUTPUT_DIRECTORY

        "${CMAKE_BINARY_DIR}/${CMAKE_SYSTEM_NAME}/64-bit/")
endif()


if(CMAKE_SIZEOF_VOID_P EQUAL 4)

    set(OUTPUT_DIRECTORY

        "${CMAKE_BINARY_DIR}/${CMAKE_SYSTEM_NAME}/32-bit/")
endif()



set(CMAKE_RUNTIME_OUTPUT_DIRECTORY	# Defines executable path
	
    "${OUTPUT_DIRECTORY}/$<CONFIG>/executable")


set(CMAKE_LIBRARY_OUTPUT_DIRECTORY	# Defines shared lib path
	
    "${OUTPUT_DIRECTORY}/$<CONFIG>/executable")


set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY	# Defines static lib path
	
    "${OUTPUT_DIRECTORY}/$<CONFIG>/lib_static")

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Output Locations ]]





# [[ Resource Files ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

# Please note that these resources will not be automatically copied to the
# binary location unless you activate the "copy_resources.cmake" script.

set(BASE_RESOURCE_LOCATION

    "${CMAKE_SOURCE_DIR}/resources")


set(BASE_TXT_LOCATION

    "${BASE_RESOURCE_LOCATION}/txt")


set(BASE_JSON_LOCATION

    "${BASE_RESOURCE_LOCATION}/json")


set(BASE_ICON_LOCATION

    "${BASE_RESOURCE_LOCATION}/icons")




# Make sure to prefix the path with ${BASE_TXT_LOCATION}.
set(RESOURCE_TXT_FILES

    "")


# Make sure to prefix the path with ${BASE_JSON_LOCATION}.
set(RESOURCE_JSON_FILES

    "")


# Make sure to prefix the path with ${BASE_ICON_LOCATION}.
set(RESOURCE_ICON_FILES

    "")

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Resource Files ]]





# [[ Executable Target ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

add_executable(${EXECUTABLE_NAME})



set(HEADER_FILES

    "${CMAKE_CURRENT_SOURCE_DIR}/internal_libraries/main/include/main.hpp")

set(SOURCE_FILES

    "${CMAKE_CURRENT_SOURCE_DIR}/internal_libraries/main/src/main.cpp")

set_target_properties(${EXECUTABLE_NAME}

    PROPERTIES

    VERSION "${PROJECT_VERSION}")



target_sources(${EXECUTABLE_NAME}
	
    PUBLIC
    ${HEADER_FILES}

    PRIVATE
    ${SOURCE_FILES}
    ${RESOURCE_TXT_FILES}
    ${RESOURCE_JSON_FILES}
    ${RESOURCE_ICON_FILES})



target_include_directories(${EXECUTABLE_NAME}

    PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}/internal_libraries/main/include/")

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Executable Target ]]





# [[ Compile Definitions ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

if(CMAKE_SIZEOF_VOID_P EQUAL 8)

    target_compile_definitions(${EXECUTABLE_NAME}

        PUBLIC
        "TARGET_IS_64_BIT")
endif()


if(CMAKE_SIZEOF_VOID_P EQUAL 4)

    target_compile_definitions(${EXECUTABLE_NAME}

        PUBLIC
        "TARGET_IS_32_BIT")
endif()




target_compile_definitions(${EXECUTABLE_NAME}
	
    PUBLIC
	
    $<$<PLATFORM_ID:Linux>:TARGET_IS_LINUX>
    $<$<PLATFORM_ID:Darwin>:TARGET_IS_APPLE>
    $<$<PLATFORM_ID:Windows>:TARGET_IS_WINDOWS>)




target_compile_definitions(${EXECUTABLE_NAME}
	
    PUBLIC
	
    $<$<CONFIG:Debug>:DEBUG_MODE>
    $<$<CONFIG:Release>:RELEASE_MODE>
    $<$<CONFIG:RelWithDebInfo>:RELEASE_WITH_DEBUGINFO_MODE>
    $<$<CONFIG:MinSizeRel>:RELEASE_MINSIZE_MODE>)

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Compile Definitions ]]





# [[ Including CMake Tools ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

# Some of these tools affect the project's behavior. Therefore, they need to
# be invoked before anything else, allowing their effects to propagate to
# dependencies as well.

if(USE_TOOL_CLANGFORMAT)

    include("${CMAKE_CURRENT_SOURCE_DIR}/cmake_scripts/other/clangFormat.cmake")
endif()


if(USE_TOOL_DOXYGEN)

    include("${CMAKE_CURRENT_SOURCE_DIR}/cmake_scripts/other/doxygen.cmake")
endif()


if(USE_TOOL_COPY_DLLS)

    include("${CMAKE_CURRENT_SOURCE_DIR}/cmake_scripts/other/copy_dlls.cmake")
endif()


if(USE_TOOL_FORCE_STATIC_MSVC)

    include("${CMAKE_CURRENT_SOURCE_DIR}/cmake_scripts/other/force_static_msvc.cmake")
endif()


if(USE_TOOL_COPY_RESOURCES)

    include("${CMAKE_CURRENT_SOURCE_DIR}/cmake_scripts/other/copy_resources.cmake")
endif()

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Including CMake Tools ]]





# [[ External libraries ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

include(FetchContent)




# This variable contains the list of libraries that we link against.
set(EXTERNAL_LIBRARIES_TO_LINK)




if(USE_LIB_NLOHMANN_JSON)

    include("${CMAKE_CURRENT_SOURCE_DIR}/cmake_scripts/libraries/nlohmann.cmake")
endif()


if(USE_LIB_FMT)

    include("${CMAKE_CURRENT_SOURCE_DIR}/cmake_scripts/libraries/fmt.cmake")
endif()


if(USE_LIB_SPDLOG)

    include("${CMAKE_CURRENT_SOURCE_DIR}/cmake_scripts/libraries/spdlog.cmake")
endif()


if(USE_LIB_CXXOPTS)

    include("${CMAKE_CURRENT_SOURCE_DIR}/cmake_scripts/libraries/cxxopts.cmake")
endif()


if(USE_LIB_CATCH2)

    include("${CMAKE_CURRENT_SOURCE_DIR}/cmake_scripts/libraries/Catch2.cmake")
endif()


if(USE_LIB_WXWIDGETS)

    include("${CMAKE_CURRENT_SOURCE_DIR}/cmake_scripts/libraries/wxWidgets.cmake")
endif()


if(USE_LIB_BOOST)

    include("${CMAKE_CURRENT_SOURCE_DIR}/cmake_scripts/libraries/boost.cmake")
endif()


if(USE_LIB_CURL)

    include("${CMAKE_CURRENT_SOURCE_DIR}/cmake_scripts/libraries/curl.cmake")
endif()




# Linking to external libraries.
target_link_libraries(${EXECUTABLE_NAME}

    PRIVATE
    ${EXTERNAL_LIBRARIES_TO_LINK})

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ External libraries ]]





# [[ Internal Libraries ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

# Some of our internal libraries may utilize external libraries.
# This call must occur after fetching the external libraries
# to ensure that external libraries are visible and available
# to our internal libraries.

add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/internal_libraries")




# Linking to my own libraries.
target_link_libraries(${EXECUTABLE_NAME}

    PRIVATE
    "Lib_Factorial")

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Internal Libraries ]]





# [[ Adding "unit_tests" Directory ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]

# UNIT_TESTS depend on internal libraries that may themselves depend on external
# libraries. Therefore, this call must be made after adding internal libraries and
# external libraries to ensure everything is visible and available
# to the UNIT_TESTS.

if(USE_UNIT_TESTS)

    add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/unit_tests")
endif()

# [[ ----------------------------------------------------------------------- ]]
# [[ ----------------------------------------------------------------------- ]]
# [[ Adding "unit_tests" Directory ]]

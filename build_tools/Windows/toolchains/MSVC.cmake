# MSVC

# Target platform
set(CMAKE_SYSTEM_NAME Windows)

# Additional paths for CMake to notice (Compiler locations, Third-party library locations)
set(CMAKE_PREFIX_PATH "${CMAKE_PREFIX_PATH};")

# Configuration types
set(CMAKE_CONFIGURATION_TYPES "Debug;Release")

# Architecture
set(CMAKE_GENERATOR_PLATFORM "x64")

# Toolset version
set(CMAKE_GENERATOR_TOOLSET "v143")

# Additional compiler and linker flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4 /O2 /MT /MP")

# GGC (Unix Makefiles)

# Target platform
set(CMAKE_SYSTEM_NAME Linux)

# Additional paths for CMake to notice (Compiler locations, Third-party library locations)
set(CMAKE_PREFIX_PATH "${CMAKE_PREFIX_PATH};")

# Configuration type
set(CMAKE_BUILD_TYPE "Debug")

# Additional compiler and linker flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -m64 -static -static-libgcc -static-libstdc++")

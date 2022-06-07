
cmake_minimum_required(VERSION 3.0.0)

set(M_PROJECT_NAME
    wakusei
)
set(M_SOURCE_DIR
    src
)
set(M_SOURCE
    ${M_SOURCE_DIR}/main.cpp
)
set(M_LIBRARIES_DIR
    libs
)
set(M_LIBRARIES 
    emulator
)
#set(CMAKE_CXX_FLAGS "-ggdb ${CMAKE_CXX_FLAGS}")
set(CMAKE_CXX_FLAGS "-s -fvisibility=hidden ${CMAKE_CXX_FLAGS}")

project(${M_PROJECT_NAME})

###########
# Project #
###########
add_executable(${M_PROJECT_NAME} ${M_SOURCE})

foreach(LIBRARY ${M_LIBRARIES})
    add_subdirectory("${M_LIBRARIES_DIR}/${LIBRARY}")
endforeach(LIBRARY)
target_link_libraries(${M_PROJECT_NAME} ${M_LIBRARIES})
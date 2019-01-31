# hide symbols.
target_link_libraries(TARGET [PUBLIC|PRIVATE|INTERFACE] LIBS  "-Wl,--exclude-libs,ALL")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wl,--exclude-libs,ALL")
set (CMAKE_SHARED_LINKER_FLAGS "-Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/export.script")

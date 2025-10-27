project(led_test)
cmake_minimum_required(VERSION 3.22)

add_executable(led_test
    cAPA102.c
    main.c
)

target_include_directories(led_test PUBLIC ${CMAKE_CURRENT_LIST_DIR})

install(TARGETS led_test RUNTIME)
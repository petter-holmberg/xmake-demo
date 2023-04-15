set_toolchains("clang")
-- Can also configure for clang compiler with "xmake config --cxx=clang"
--     and to use clang static linker, add "--ld=clang"
--     and to use clang shared linker, add "--sh=clang"

set_languages("c++20")

set_warnings("everything", "error")
add_cxxflags("gcc::-Wduplicated-cond")
add_cxxflags("clang::-Wno-c++98-compat")
add_cxxflags("cl::/wd4668 /wd4710 /wd4711 /wd4868")

add_includedirs("include")

target("greetings")
    set_kind("static")
    add_files("src/greetings.cpp")

target("hello")
    add_deps("greetings")
    add_includedirs("include")
    add_files("src/hello.cpp")

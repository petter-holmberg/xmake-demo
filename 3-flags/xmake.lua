-- To see our build flags, use "xmake -v" for verbose
set_languages("c++20") -- In gcc: "-std=c++20"

-- Our options: "none", "fast", "faster", "fastest", "smallest", "aggressive"
set_optimize("fastest") -- In gcc: "-O3"

-- Our options: "none", "less", "more", "all", "allextra", "everything", "error"
set_warnings("everything", "error") -- In gcc: "-Wall -Wextra -Weffc++ -Werror"

-- Extra flags
add_cxxflags("gcc::-Wduplicated-cond")              -- Specific to gcc
add_cxxflags("clang::-Wno-c++98-compat")            -- Specific to clang
add_cxxflags("cl::/wd4668 /wd4710 /wd4711 /wd4868") -- Specific to msvc

add_includedirs("include")

target("greetings")
    set_kind("static")
    add_files("src/greetings.cpp")

target("hello")
    add_deps("greetings")
    add_files("src/hello.cpp")

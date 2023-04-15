set_languages("c++20")

set_warnings("everything", "error")
add_cxxflags("gcc::-Wduplicated-cond")
add_cxxflags("clang::-Wno-c++98-compat")
add_cxxflags("cl::/wd4668 /wd4710 /wd4711 /wd4868")

-- release mode is default, configure for debug mode with "xmake config -m debug"
--     Also try "xmake config --menu"
add_rules("mode.debug", "mode.release")
if is_mode("debug") then
    add_defines("DEBUG")
elseif is_mode("release") then
    add_defines("NDEBUG")
    set_optimize("fastest")
end

add_includedirs("include")

target("greetings")
    set_kind("static")
    add_files("src/greetings.cpp")

target("hello")
    add_deps("greetings")
    add_files("src/hello.cpp")

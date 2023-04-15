set_languages("c++20")

set_warnings("allextra", "error")
add_cxxflags("gcc::-Wduplicated-cond")
add_cxxflags("clang::-Wno-c++98-compat")
add_cxxflags("cl::/wd4668 /wd4710 /wd4711 /wd4868")

add_rules("mode.debug", "mode.release")
if is_mode("debug") then
    add_defines("DEBUG")
elseif is_mode("release") then
    add_defines("NDEBUG")
    set_optimize("fastest")
end

add_requires("catch2 >= 3.3")

target("greetings")
    set_kind("static")
    add_files("src/greetings.mpp") -- Supports .mpp, .ixx, .cppm, .mxx

target("hello")
    add_deps("greetings")
    add_files("src/hello.cpp")

target("test")
    add_packages("catch2")
    add_deps("greetings")
    add_files("test/test.cpp")
    before_run(function (target)
        print("Running static analysis on src folder")
        os.exec("cppcheck src --error-exitcode=1")
        print("Running unit tests on target: %s", target:name())
    end)
    after_run(function (target)
        print("Successful run of %s", target:targetfile())
    end)

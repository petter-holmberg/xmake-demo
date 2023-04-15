set_languages("c++20")

set_warnings("everything", "error")
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

add_requires("catch2 >= 3.3") -- Add package requirement with version check
--add_requires("catch2", {configs = {shared = true}, debug = true}}) -- Example options
-- If not found locally, looks for it using xrepo, features >600 popular libraries
-- Submit packages to https://github.com/xmake-io/xmake-repo
-- "xmake package" will generate package files for your project

-- Examples of other package managers
--add_requires("conan::catch2", {alias = "catch2"})
--add_requires("vcpkg::catch2", {alias = "catch2"})
--add_requires("apt::catch2", {alias = "catch2"})

-- To just find and use the installed system library
--add_requires("catch2", {system = true})

-- If you want a private package repository (see https://github.com/xmake-io/xmake-repo)
--add_repositories("myrepo git@github.com:myrepo/xmake-repo.git dev")

add_includedirs("include")

target("greetings")
    set_kind("static")
    add_files("src/greetings.cpp")

target("hello")
    add_deps("greetings")
    add_files("src/hello.cpp")

target("test")
    add_packages("catch2")
    add_deps("greetings")
    add_files("test/test.cpp")

    -- Example of doing something before and after test runs
    before_run(function (target)
        print("Running static analysis on src folder")
        os.exec("cppcheck src --error-exitcode=1")
        print("Running unit tests on target: %s", target:name())
    end)
    after_run(function (target)
        print("Successful run of %s", target:targetfile())
    end)

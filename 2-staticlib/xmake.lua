add_includedirs("include") -- Can do this in each of the targets too

-- My static library
target("greetings")
    set_kind("static") -- Other target options: "shared", "phony", "object", "headeronly"
    add_files("src/greetings.cpp")

-- Binary that links to it
target("hello")
    set_kind("binary") -- This is the default target kind, could be omitted
    add_deps("greetings")
    add_files("src/hello.cpp")

-- Linking to libraries outside the project (see step 6 for a more general solution)
--add_links("foo", "bar") -- Add library link. In gcc: "-lfoo -lbar"
--add_syslinks("pthread") -- Add system link libraries. In gcc: "-lpthread" added last
--add_linkdirs("path/to/foobar") -- Add link search directories. In gcc "-Lpath/to/foobar"

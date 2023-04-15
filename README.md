    __  ___ __  __  __ _| | ______
    \ \/ / |  \/  |/ _  | |/ / __ \
     >  <  | \__/ | /_| |   <  ___/   IN 7 EASY STEPS
    /_/\_\_|_|  |_|\__ \|_|\_\____|
                         by ruki, xmake.io

[xmake](https://xmake.io) is a lightweight cross-platform build utility
that is very friendly to beginners.

This repository contains a reference C++ project set up with xmake
in incremental steps, demonstrating how to use it.

Use `xmake` to build and `xmake run` to run the examples.

1. Hello World (single binary compiled from one source file)
2. Add a static library and link to the binary
3. Add compiler flags
4. Switch to another compiler (clang)
5. Add different configurations for debug and release mode
6. Add a package dependency (catch2) and some before/after run target actions
7. Switch to C++20 modules

For additional details, see the `xmake.lua` files and `intro.md`/`outro.md`.

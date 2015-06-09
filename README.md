# cmake-childproject-minimumexample
cmake-childproject-minimumexample

This is a minimal example of adding a child project to cmake, ie instead of using `include` or `add_subdirectory`, both of which are conceptually simpler, but have their own set of issues, ie minimal isolation between projects.

This is based on the arrayfile cmake files/configuration, which downloads, builds, and installs clBLAS.

In this implementation in this repository here, it uses an existing source-code directory, but note that 'externalproject' can actually take a git repository url, and do the download automatically, and thus take the place of `git submodule`.

# To build

*Assumptions*:
* using linux ubuntu 14.04
* cmake installed
* g++ installed

Procedure:
* cd into testxtinc
* run `./run.sh`
=> hopefully binaries should pop out in `install` subdirectory.  Can run it by doing:
```
install/run.sh
```


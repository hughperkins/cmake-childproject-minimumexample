# cmake-childproject-minimumexample
cmake-childproject-minimumexample

This is a minimal example of adding a child project to cmake, ie instead of using `include` or `add_subdirectory`, both of which are conceptually simpler, but have their own set of issues, ie minimal isolation between projects.

This is based on the arrayfile cmake files/configuration, which downloads, builds, and installs clBLAS.

In this implementation in this repository here, it uses an existing source-code directory, but note that 'externalproject' can actually take a git repository url, and do the download automatically, and thus take the place of `git submodule`.

# Variations

There are two variations:
* testextinc-manual: uses externalproject to build the external project, but sets up include directory paths etc manually in the parent project
  * eg, if we dont own the child proejct, this could be appropriate?
* testextinc-findpackage: puts the variables in a xxxConfig.cmake file, that we read using find_package

# To build

*Assumptions*:
* using linux ubuntu 14.04
* cmake installed
* g++ installed

Procedure:
* cd into testextinc-manual or testextinc-findpackage
* run `./run.sh`
=> hopefully binaries should pop out in `install` subdirectory.  Can run it by doing:
```
install/run.sh
```


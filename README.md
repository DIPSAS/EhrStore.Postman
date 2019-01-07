# EhrStore API TESTS
Create Postman test collections and place them in the `src/` directory. TeamCity
will run any collection named `*collection.json`, even in subfolders in `src/`.

You can use the global variables `Protocol`, `ServerHostname`, `ServerPort` and
`BasePath` in your test collections. All of these are set in TeamCity to point
to different EhrStore instances.

# git submodules
You can add repositories as `git submodules` in the `src/` directory. To
retrieve all of these when you clone the repo you must run 

```
git submodule update --init --recursive
```

in the root directory of this repository.

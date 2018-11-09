# EhrStore API TESTS
Create Postman test collections and place them in the `src/` directory. TeamCity
will run any collection named `*collection.json`, even in subfolders in `src/`.

You can use the global variables `Protocol`, `ServerHostname`, `ServerPort` and
`BasePath` in your test collections. All of these are set in TeamCity to point
to different EhrStore instances.

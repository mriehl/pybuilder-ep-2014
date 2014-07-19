# Shell demo
* Create virtualenv, install pybuilder
* Alternative if no network: source an existing virtualenv with all dependencies installed already

* Start a project, watch the tasks.
* Install dependencies.
* Run, watch it fail due to missing coverage. Disable `break_build`.

* Add a script. Publish it and install the `tar.gz` to run the script.

* Move code from script into a package. Re-build and watch it work.

* Start pytddmon. Re-enable coverage. Add a test.

* Add a flake8 error to the package. Run it. Make it break the build.
* Add frosted + error to the package.

# Practical PyBuilder {data-background="res/pybuilder.png" data-background-size="5%" data-background-repeat="none" data-background-position="right bottom" .spaceps}

<div style="text-align: center;">_Maximilien Riehl_</div>

<div style="margin: 2em 1em 0em; text-align: right;">
<small>July 25th, 2014</small>
</div>

# I'm max

github.com/mriehl

max@riehl.io

<img src="res/Germany.png"/>
<img src="res/France.png"/>
<img src="res/England.png"/>

# Where I work {data-background="res/firmensitz.jpg" data-background-position="center bottom" .opaque}

ImmobilienScout24 is the leading german real estate portal

Using python for automation / infrastructure

# What I do
<div
    data-typescript="demos/script-update"
    data-timing="demos/timing-update"
    data-speed=2
    data-cols=120
    data-rows=20
    data-show-controls="false"
    data-font-size="auto"
    class="cinescript">
</div>

# We're not that small
```python
>>> vvc = VVC("***************")
>>> vvc.connect("mriehl")
>>> reduce(lambda n, vm: n + 1, vvc.get_all_vms(), 0)
615
>>> 
```

# {data-background="res/enough-to-do.jpg" data-background-position="center top"}


# Sneak peek
<div
    data-typescript="demos/script-yadtshell"
    data-timing="demos/timing-yadtshell"
    data-speed=2
    data-cols=135
    data-rows=20
    data-show-controls="false"
    data-font-size="auto"
    class="cinescript">
</div>

# Running tasks{data-background="res/tasks.jpg" .opaque}
Small logic building blocks

```bash
pyb run_unit_tests analyze
```

# Make it just work™{data-background="res/tools.jpg" data-background-size="75%" .whitetext}

# Make it just work™
```bash
pyb
```
and in `build.py`:
```python
url = 'https://github.com/yadt/yadtshell'
version = '1.8.5'

default_task = ['clean', 'analyze', 'publish']


@init
def set_properties(project):
    project.depends_on('hostexpand')
```

# Batteries included: plugins{data-background="res/batteries.png" .whitetext}
* install_dependencies
* flake8/frosted/pylint
* unittest
* coverage
* distutils
* pytddmon
* ... and many more!

<div style="bottom: 0; text-align: left; opacity: 0.1">Image credit: Aled17</div>

# Key-value based configuration

```python
@init
def set_properties(project):
    project.set_property('integrationtest_parallel', True)

    project.set_property('flake8_break_build', True)

    FROSTED_BARE_EXCEPT = 'W101'
    project.set_property('frosted_ignore', [FROSTED_BARE_EXCEPT])

    project.set_property('coverage_threshold_warn', 75)
    project.set_property('coverage_break_build', True)

    project.get_property('distutils_commands').append('bdist_wheel')
```

# requirements.txt built-in
```
pyb install_[runtime|build]dependencies
```


and in `build.py`:


```python
@init
def set_properties(project):
    project.build_depends_on("mock")

    for dependency in ["docopt", "ultrajson", "treq"]:
        project.depends_on(dependency)
    project.depends_on("twisted", ">=13.2.0")

    project.set_property("install_dependencies_index_url",
                         "http://devpi-server.invalid/root/pypi")
```

# Get started with start-project
```bash
$ pyb --start-project
Project name (default: 'europython') : 
Source directory (default: 'src/main/python') : 
Unittest directory (default: 'src/unittest/python') : 
Scripts directory (default: 'src/main/scripts') : 
Use plugin python.flake8 (Y/n)? (default: 'y') : 
Use plugin python.coverage (Y/n)? (default: 'y') : 
Use plugin python.distutils (Y/n)? (default: 'y') : 
$ tree
.
|-- build.py
`-- src
    |-- main
    |   |-- python
    |   `-- scripts
    `-- unittest
        `-- python
```

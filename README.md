# avail-test
Run your general purpose availability tests in parallel

# Download avail-tests

```
git clone https://github.com/aminmarashi/avail-test.git avail-test
cd avail-test
# source install.sh
```

# Install availability tests

## Install locally for the current user

```
source install.sh
```

## Install system-wide

```
make DESTDIR=/usr/local/bin/ install
```

**Note:** You may need to use `sudo`

# Config

Make a file called `avail.config`, this will be used for static test configuration.

```
## avail.config

### Run config, can also be given as arguments to avail-run

# this file is a shell script, so no space after =

# If specified this will one or more prefix to your tests
# --run-prefix[=]prefix
RUN_PREFIX=`echo {1..10}_`

# This will be used to run your tests, you should use single quote to avoid interpolation
# (-c|--command)[=]command
COMMAND='test '

# This is where we look for your test files which will be run using the COMMAND (defaults to `pwd`/tests)
# (-t|--test-dir)[=]test-dir
TEST_DIR="`pwd`/tests"

# Init script will be executed before running the actual tests, useful for initialization purposes
# --init-script[=]script
INIT_SCRIPT="`pwd`/init.sh"

### Watch config, can also be given as arguments to avail-watch

# Timeout in seconds, when expired if the test logs are not updated they're considered as dead (default = 10s)
# --alive-timeout[=]timeout
ALIVE_TIMEOUT=10

# This is a command that if given will run against your test logs to determine whether they're still alive (should return true)
# Also the log file is given as $1 like the example below
# --alive-check=check-command # this has to be the last argument 
ALIVE_CHECK='tail -n 1 $1 | grep some_text >/dev/null 2>&1'

# Use watch command to watch the tests
# (-w|--watch-command)
WATCH_COMMAND=1

# Time interval between each watch update (defualt = 1s)
# --interval[=]interval
INTERVAL=1
```

# How to run

## Show help

```
avail-test -h
```

## Run the tests

```
avail-test [options]
```

## avail.log

An availability log will be created in your CWD

```
tail -f avail.log
```

## Stopping the tests

```
./stop.sh
```

## Watch the logs

```
avail-watch --interval=1 --alive-timeout=60
```

## Watch the last line of the logs (you need watch command installed)

```
avail-watch -w
```

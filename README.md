sprout-pyenv
===============

[![Build Status](https://travis-ci.org/kigster/sprout-pyenv.svg?branch=master)](https://travis-ci.org/kigster/sprout-pyenv)

Recipes to install `pyenv` and manage python versions with it on OS X. Based on [sprout-rbenv](https://github.com/pivotal-sprout/sprout-rbenv) cookbook by Pivotal Labs.

## Usage

Simply define ad version of Python you'd like to install in the following format:

```ruby

# soloist
- sprout-pyenv
# ...

node_attributes:
  sprout:
    pyenv:
      pythons:
        2.7.11: {}
      default_python: 2.7.11
```

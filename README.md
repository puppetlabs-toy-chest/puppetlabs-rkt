[![Puppet
Forge](http://img.shields.io/puppetforge/v/puppetlabs/rkt.svg)](https://forge.puppetlabs.com/puppetlabs/rkt)
[![Build
Status](https://secure.travis-ci.org/puppetlabs/puppetlabs-rkt.png)](http://travis-ci.org/puppetlabs/puppetlabs-rkt)


1. [Overview](#overview)
2. [Module Description - What the module does and why it is
   useful](#module-description)
3. [Setup - The basics of getting started with rkt](#setup)
4. [Usage - Configuration options and additional functionality](#setup)

## Overview

This Puppet module installs and manages the
[rkt](https://github.com/coreos/rkt) container runtime and associated
tools.

## Module Description

This module provides several classes `rkt` and `rkt::acbuild` which
install `rkt` and `acbuild` directly from the GitHub releases. The
module also contains a new type `rkt_pod` which provides some
interaction with running pods.

## Setup

You can install the module using the Puppet module tool like so:

```
puppet module install puppetlabs/rkt
```

## Usage

To install the rkt command line utilties `rkt` and `acbuild` use:

```puppet
include rkt
include rkt::acbuild
```

By default this installs the version of `rkt` recorded in the `params`
class. You can override this with:

```puppet
class { 'rkt':
  version => '1.0.0',
}
```

The `rkt_pod` type currently only supports listing pods, but could be
extended in the future to running ACI's. You can use it like so:

```
$ puppet resource rkt_pod
rkt_pod { 'c8ecd9ae':
  ensure     => 'exited',
  app        => 'hello',
  image_name => 'hello',
}
```

## Maintainers

This module is maintained by: Gareth Rushgrove <gareth@puppet.com>

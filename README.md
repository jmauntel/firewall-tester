## Overview

This script tests all specified TCP connections between systems.

## Features:

Has 3 tests

* test_fw_full - Checks a full session against the target node and port
* test_fw_port - Performs a three-way handshake only against the target node and port
* test_url - Performs a curl against the supplied URL

## Usage:

Each line in the application script requires an environment designation and then the test command.  The environment designation is really a function that executes successfully if the environment matches the environment passed to the script.  This feature allows you to test individual environments.

Test example:  

```
DEV && test_fw_full web-dev-01.acme.com app-dev-01.acme.com 8080
```

Script execution example:

```
[user@host]: ~/firewall-tester $ ./acme.sh DEV
P - web-dev-01.acme.com to https://acmeapp-dev.acme.com (test_url)
P - app-dev-01.acme.com to acme-dev-db.acme.com on port 1521 (test_fw_full)

Pass: 2, Warn: 0, Fail: 0, Total: 2

Test took 2 seconds
```

General guidlines:  
1. One script per tier  
2. Use a wrapper script to group tiers for an application  
3. Assuming that tiers are configured identically, you only need to test first node in tier  
4. Always commit changes to version control   

## Requirements

* A user account that has access to SSH via key-based authentication to all of the source systems defined in the test script

## Supported Platforms

This code was developed and tested using CentOS 5, but is assumed to work
on other platforms as well.

## Dependencies:

* Requires firewall-tester libraries to be sourced ../lib
* bash >= 3.2.25
* curl >= 7.15.5

## Authors:

* Jesse Mauntel (maunteljw@gmail.com)  

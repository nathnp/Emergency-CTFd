# Emergency-CFTd

For when you need an emergency instance of [CTFd](https://github.com/CTFd/CTFd).

## How To Use

> [!WARNING]
> Only run this in a VM. This script will install software such as docker, and auto start a docker container of CFTd.

To use, just paste this line into your terminal.
`curl https://ectf.nthp.me | bash`

After you run the script, you can stop and restart CFTd using the following commands.

To stop: `./CFTdStop.sh`

To Restart `./CFTdStart.sh`

## Works on

| Distro    | Working | Notes |
|-----------|---------|-------|
| OpenSUSE  | ✅       |       |
| Debian 12 | ✅       |       |
| Fedora 40 | ❌       | Containers stuck "restarting"      |

Distro tests are done in Linode VMs, using 1GB of ram, and 1 CPU
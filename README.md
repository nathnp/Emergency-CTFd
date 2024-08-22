# Emergency-CFTd

For when you need an emergency instance of CTFd.

## How To Use

> [!WARNING]
> Only run this in a Debain VM. This script will install software such as docker, and auto start a docker container of CFTd.

To use, just paste this line into your terminal.
`curl https://ectf.nthp.me | bash`

After you run the script, you can stop and restart CFTd using the following commands.

To stop: `./CFTdStop.sh`

To Restart `./CFTdStart.sh`

This has been tested on a Debian 12 VM in Linode. With 1GB of ram, and one CPU.

This really sucks. But it's real easy to make and install:

You'll need

Packages: linux & linux-header WITH MATCHING VERSIONS

Then get into the directory with your alx sources and do:

Copy the kernel module source code into the /usr/src/ directory.
```
sudo mkdir /usr/src/alx-4.20
sudo cp -Rv . /usr/src/alx-4.20
```
Add the kernel module to the DKMS tree so that it is tracked by DKMS.
```
sudo dkms add alx-4.20
```
Build the kernel module using DKMS. If the build encounters errors, you may need to edit the dkms.conf file.
```
sudo dkms build alx-4.20
```
Install the kernel module using DKMS.
```
sudo dkms install alx-4.20
```
Tun and done!


The above sources were taken from kernel version 4.12 and slightly modified for newer kernel

They appear to work fine on 5.0.0 as well

And here is the faulty commit:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/ethernet/atheros/alx?id=bc2bebe8de8ed4ba6482c9cc370b0dd72ffe8cd2

The above sources were obtained by manually modifying 4.12 alx driver with the above commit.

Oh, and this is all GPL-3 licensed. See the "LICENSE" for more detail

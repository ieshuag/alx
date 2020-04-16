ifneq ($(KERNELRELEASE),)
	obj-m += alx.o
	alx-objs := main.o ethtool.o hw.o
else
	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
	PWD :=$(shell pwd)
	TARGET_PATH := kernel/drivers/net
	INBOXDRIVER := $(shell find $(subst build,$(TARGET_PATH),$(KERNELDIR)) -name alx.ko.* -type f)


.PHONY: modules
modules:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

.PHONY: all
all: clean modules install

.PHONY: clean
clean:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) clean

.PHONY: install
install:
ifneq ($(shell lsmod | grep alx),)
	rmmod alx
endif
ifneq ($(INBOXDRIVER),)
	rm -f $(INBOXDRIVER)
endif
	$(MAKE) -C $(KERNELDIR) M=$(PWD) INSTALL_MOD_DIR=$(TARGET_PATH) modules_
	modprobe alx

.PHONY: install_rules
install_rules:
	install --group=root --owner=root --mode=0644 $(RULEFILE) $(RULEDIR)
endif

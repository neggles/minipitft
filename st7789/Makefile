KDIR ?= /lib/modules/${kernelver}/build
obj-m += fb_st7789v.o

default:
	$(MAKE) -C $(KDIR) M=$$PWD

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean

install: $(modules_install)
modules_install:
	$(MAKE) -C $(KDIR) M=$$PWD modules_install

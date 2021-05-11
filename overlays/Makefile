PWD := $(shell pwd)

DTC_FLAGS   ?= -@
DTC_INCLUDE := /lib/modules/${kernelver}/build/include

dtbo-y  += minipitft114.dtbo
dtbo-y  += minipitft13.dtbo

targets  += $(dtbo-y)
always-y += $(dtbo-y)
clean-files := $(dtbo-y)

all:
	make -C /lib/modules/${kernelver}/build M=$(PWD) DTC_INCLUDE=${DTC_INCLUDE}

clean:
	make -C /lib/modules/${kernelver}/build M=$(PWD) clean

install:
	cp $(dtbo-y) /boot/overlays/

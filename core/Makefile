BIN = boot/stage1/bootloader.bin kernel/kernel.bin

QEMU = qemu-system-x86_64

TARGET = ferret.img

all: $(TARGET)

$(TARGET): subsystem
	@cat $(BIN) > $@

subsystem:
	-$(MAKE) -C boot/stage1
	-$(MAKE) -C boot/stage2
	-$(MAKE) -C kernel

.PHONY: run clean clean-all

run:
	@-$(QEMU) -drive format=raw,file=$(TARGET)

clean:
	-$(MAKE) -C boot/stage1 clean
	-$(MAKE) -C boot/stage2 clean
	-$(MAKE) -C kernel clean

clean-all:
	@-rm $(TARGET)
	-$(MAKE) -C boot/stage1 clean
	-$(MAKE) -C boot/stage2 clean
	-$(MAKE) -C kernel clean-all

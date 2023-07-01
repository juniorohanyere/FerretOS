BIN = boot/bootloader kernel/kernel

QEMU = qemu-system-x86_64

TARGET = ferret.img

all: $(TARGET)

$(TARGET): subsystem
	@cat $(BIN) > $@

subsystem:
	-$(MAKE) -C boot
	-$(MAKE) -C kernel

.PHONY: run clean clean-all

run:
	@-$(QEMU) -drive format=raw,file=$(TARGET)

clean:
	-$(MAKE) -C boot clean
	-$(MAKE) -C kernel clean

clean-all:
	@-rm $(TARGET)
	-$(MAKE) -C boot clean-all
	-$(MAKE) -C kernel clean-all

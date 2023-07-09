BIN = core/boot/stage1/bootloader.bin core/kernel.bin

QEMU = qemu-system-x86_64

TARGET = ferret.img

all: subsystem $(TARGET)

$(TARGET): $(BIN)
	@cat $^ > $@

subsystem:
	-$(MAKE) -C core/boot/stage1
	-$(MAKE) -C core

.PHONY: run clean clean-all

run:
	@-$(QEMU) -drive format=raw,file=$(TARGET)

clean:
	@-rm $(TARGET)

clean-all: clean
	-$(MAKE) -C core clean-all
	-$(MAKE) -C core/boot/stage1 clean-all
	-$(MAKE) -C core/boot/stage2 clean-all
	-$(MAKE) -C core/drivers clean-all
	-$(MAKE) -C core/kernel clean-all

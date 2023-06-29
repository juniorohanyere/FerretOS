BIN = stage1/bootloader.bin stage2/bootloader.bin

QEMU = qemu-system-x86_64

TARGET = bootloader

all: $(TARGET)

$(TARGET): subsystem
	@cat $(BIN) > $(TARGET)

subsystem:
	$(MAKE) -C stage1
	$(MAKE) -C stage2

.PHONY: run clean clean-all

run:
	@$(QEMU) -drive format=raw,file=$(TARGET)

clean:
	-$(MAKE) -C stage1 clean
	-$(MAKE) -C stage2 clean

clean-all: clean
	@-rm $(TARGET)

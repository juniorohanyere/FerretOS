ASM = nasm

ASMFLAGS = bin

SRCS = bootsector.asm bootloader.asm data.asm screen.asm stdio.asm

HEADERS = bootloader.inc bootsector.inc

QEMU = qemu-system-x86_64

TARGET = bootloader

all: $(TARGET)

$(TARGET): $(SRCS) $(HEADERS)
	@$(ASM) -f $(ASMFLAGS) $< -o $@

.PHONY: run clean

run:
	@-$(QEMU) -drive format=raw,file=$(TARGET)
clean:
	@-rm $(TARGET)

ASM = nasm

ASMFLAGS = bin

SRCS = stage1/bootsector.asm stage1/bootloader.asm stage1/data.asm \
	stage1/disk.asm stage1/getc.asm stage1/screen.asm stage1/stdio.asm \
	stage1/string.asm stage2/$(bootsector.asm)

INCLUDES = stage1/bootloader.inc stage1/bootsector.inc stage1/stdio.inc

QEMU = qemu-system-x86_64

TARGET = bootloader

all: $(TARGET)

$(TARGET): $(SRCS) $(INCLUDES)
	@$(ASM) -f $(ASMFLAGS) $< -o $@

.PHONY: run clean

run:
	@-$(QEMU) -drive format=raw,file=$(TARGET)
clean:
	@-rm $(TARGET)

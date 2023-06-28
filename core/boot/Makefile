ASM = nasm

ASMFLAGS = bin

SRCS = stage1/bootsector.asm

SRCS += stage1/bootloader.asm stage1/data.asm stage1/disk.asm \
	stage1/getbuffer.asm stage1/screen.asm stage1/stdio.asm \
	stage1/string.asm

SRCS += stage2/bootloader.asm stage2/bootsector.asm stage2/data.asm \
	stage2/gdt.asm stage2/getbuffer.asm stage2/keyboard.asm \
	stage2/screen.asm stage2/stdio32.asm stage2/stdio.asm stage2/string.asm

INCLUDES = stage1/bootloader.inc stage1/bootsector.inc stage1/stdio.inc

INCLUDES += stage2/bootloader.inc stage2/bootsector.inc stage2/getbuffer.inc

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

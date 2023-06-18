ASM = nasm

ASMFLAGS = bin

SRCS = bootsector.asm bootloader.asm data.asm disk.asm getbuffer.asm screen.asm \
	stdio.asm string.asm validate.asm

INCLUDES = bootloader.inc bootsector.inc getbuffer.inc stdio.inc

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

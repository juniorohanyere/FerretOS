ASM = nasm

AFLAGS = bin

SRC = bootsector.asm

DEPS = bootloader.asm data.asm disk.asm getbuffer.asm keyboard.asm screen.asm \
	stdio.asm string.asm

INCLUDES = bootloader.inc bootsector.inc stdio.inc

QEMU = qemu-system-x86_64

TARGET = bootloader.bin

all: $(TARGET)

$(TARGET): $(SRC) $(DEPS) $(INCLUDES)
	@$(ASM) -f $(AFLAGS) $< -o $@

.PHONY: clean

clean:
	@-rm $(TARGET)

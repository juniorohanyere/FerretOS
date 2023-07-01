ASM = nasm

AFLAGS = bin

SRC = bootsector.asm

DEPS = bootloader.asm data32.asm data.asm kernel.asm stdio32.asm \
	string.asm validate.asm

INCLUDES = bootloader.inc bootsector.inc data.inc string.inc \
	validate.inc

QEMU = qemu-system-x86_64

TARGET = bootloader.bin

all: $(TARGET)

$(TARGET): $(SRC) $(DEPS) $(INCLUDES)
	@$(ASM) -f $(AFLAGS) $< -o $@

.PHONY: clean

clean:
	@-rm $(TARGET)

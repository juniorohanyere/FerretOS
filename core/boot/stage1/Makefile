# assembler
ASM = nasm

# assembler flags
AFLAGS = -f bin

# source files
SRCS = bootsector.asm

# dependencies
DEPS = bootloader.asm data.asm disk.asm getc.asm screen.asm stdio.asm \
	string.asm

# includes
INCLUDES = bootloader.inc bootsector.inc

# target
TARGET = bootloader.bin

all: $(TARGET)

$(TARGET): $(SRCS) $(DEPS) $(INCLUDES)
	@$(ASM) $(AFLAGS) $< -o $@

.PHONY: clean clean-all

clean:
	@-rm $(TARGET)

clean-all:
	@-rm *.bin

# linker
LD = ld

# linker flags
# linking with an offset of 0x1000
# and generating a binary output
LDFLAGS = -Ttext 0x1000 --oformat binary

# elf file for bootloader
# to be linked with the kernel object files
ELF = boot/stage2/bootloader.elf

# object files for the drivers
OBJS = drivers/ports.o drivers/screen2.o #drivers/screen.o
# linking with the drivers/screen.o has a conflict

# object files for kernel
OBJS += kernel/kernel.o

# set a target, we're creating a binary file
# to represent our kernel that will be linked with the bootloader
TARGET = kernel.bin

all: subsystem $(TARGET)

$(TARGET): $(ELF) $(OBJS)
	$(LD) $(LDFLAGS) $^ -o $@

subsystem:
	-$(MAKE) -C boot/stage2
	-$(MAKE) -C drivers
	-$(MAKE) -C kernel

.PHONY: clean clean-all

clean:
	@-rm $(TARGET)

clean-all:
	@-rm *.bin

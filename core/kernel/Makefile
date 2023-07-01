ASM = nasm

CC = gcc

AFLAGS = -f elf64

CFLAGS = -ffreestanding

OBJS = kernel.o kernel_entry.o

TARGET = kernel

all: $(TARGET)

$(TARGET): $(OBJS)
	ld -o $@ -Ttext 0x1000 $^ --oformat binary

kernel.o: kernel.c
	$(CC) $(CFLAGS) -c $< -o $@

kernel_entry.o: kernel_entry.asm
	$(ASM) $< $(AFLAGS) -o $@

.PHONY: clean clean

clean:
	@-rm $(OBJS)

clean-all:
	@-rm $(TARGET) *.o

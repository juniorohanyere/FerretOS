/**
 * inb - function that reads a byte from the specified port
 *
 * @port: the port to read the byte from
 *
 * Description: uses the inline assembly systax
 *		notice how the source and destination registers
 *		are switched from NASM
 *		'"=a" (result)'; sets '=' the C variable '(result)'
 *		to the value of register e'a'x
 *		'"d" (port)': maps the C variable '(port)' into e'd'x register
 *		inputs and outputs are separated by colons
 *
 * Return: return the result (destination)
*/

unsigned char inb(unsigned short port)
{
	unsigned char result;

	__asm__("in %%dx, %%al" : "=a" (result) : "d" (port));

	return (result);
}

/**
 * outb - function that writes a byte to a specified port
 *
 * @port: the port to write to
 * @data: the data to be written
 *
 * Description: notice how here both registers are mapped to C variables
 *		and nothing is returned, thus, no equals '=' in the asm syntax
 *		however we see a comma since there are two variables
 *		in the input area and none in the 'return' area
 *
 * Return: return nothing
*/

void outb(unsigned short port, unsigned char data)
{
	__asm__("out %%al, %%dx" : : "a" (data), "d" (port));
}

/**
 * inw - function that reads a word from a specified port
 *
 * @port: the port to read the word from
 *
 * Return: return the result (destination)
*/

unsigned short inw(unsigned short port)
{
	unsigned short result;

	__asm__("in %%dx, %%ax" : "=a" (result) : "d" (port));

	return (result);
}

/**
 * outw - writes a word to a specified port
 *
 * @port: the port to write the word to
 * @data: the data to be written
 *
 * Return: return nothing
*/

void outw(unsigned short port, unsigned short data)
{
	__asm__("out %%ax, %%dx" : : "a" (data), "d" (port));
}

#include "../drivers/screen.h"
#include "kernel.h"

/**
 * main - entry point for out kernel
 *
 * Return: always return 0
*/

int main(void)
{
	char *video_memory = (char *) 0xb8000;

	clearscr();
	*video_memory = 'L';

	return (0);
}

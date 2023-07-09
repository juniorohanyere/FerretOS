/**
 * main - entry point for out kernel
 *
 * Return: always return 0
*/

int main(void)
{
	char *video_memory = (char *) 0xb8000;

	*video_memory = 'L';

	return (0);
}

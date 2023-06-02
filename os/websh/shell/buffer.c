#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "buffer.h"

/**
 * getbuffer - function that gets entire buffer entered by a user
 *
 * @buf: pointer variable to store the buffer
 *
 * Description: reads buffer until a new line is encountered,
 *		saves the read buffer into @buf
 *		@buf needs to be a malloc'ed pointer
 *		with any given momory size
 *
 * Return: return the number of characters read
*/

int getbuffer(char **buf)
{
	ssize_t flag;
	size_t *buffer_size;

	/* allocating initial memory for each pointer variable */
	buffer_size = malloc(sizeof(size_t));

	/* if malloc fails, print an error */
	if (buf == NULL || buffer_size == NULL)
	{
		printf("Insufficient memory: could not allocate memory");
		exit(98);	/* exit with status 98 */
	}

	flag = getline(buf, buffer_size, stdin);

	if (flag == -1)
		exit(EXIT_SUCCESS);

	/* freeing malloc'ed variables */
	free(buffer_size);

	return (flag);
}

/**
 * splitbuffer - function that splits a buffer into words
 *
 * @src: the buffer to split
 * @dest: the variable to save the generated words
 *
 * Return: return the number of words generated
*/

int splitbuffer(char *dest[], char **src)
{
	char *token;
	int i;

	/* allocating enoungh memory */
	token = malloc(sizeof(char) * 1024);

	token = strtok(*src, " ");

	/* save the generated words into @dest */
	for (i = 0; token != NULL; i++)
	{
		/**
		 * dest[i] needs to be malloc'ed
		 * since we don't know the size of each tokens generated
		 *
		 * NOTE: @dest needs to be free'd after a call to this function
		 *	 (after dest[i] is no longer needed)
		*/
		dest[i] = malloc(sizeof(char) * 1024);

		dest[i] = token;
		token = strtok(NULL, " ");
	}

	free(token);

	return (i);	/* the number of words generated */
}

/**
 * setnull - function to set the value of an array of pointers to null
 *
 * @ptr: array of pointers to set to null
 *
 * Return: return nothing
*/

void setnull(char *ptr[])
{
	int i;

	/* set all index of the pointer to null */
	for (i = 0; ptr[i] != NULL; i++)
	{
		ptr[i] = NULL;

		/* refer to splitbuffer() for reason this is being free'd */
		free(ptr[i]);
	}
}

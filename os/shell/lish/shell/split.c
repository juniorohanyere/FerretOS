#include <stdlib.h>
#include <string.h>

#include "split.h"

/**
 * split_buffer - function that splits a buffer into words
 *
 * @buffer: the buffer to split
 * @word: variable to save the tokens generated
 *
 * Return: return the number of words obtained
*/

int split_buffer(char **buffer, char *word[])
{
	char *token;
	int i;

	token = malloc(sizeof(char) * 1024);
	token = strtok(*buffer, " ");

	/* reset_to_null(word); */	/* segmentation fault */

	/* save the generated tokens into the @word */
	for (i = 0; token != NULL; i++)
	{
		/**
		 * word[i] needs to be malloc'ed
		 * since we don't know the size of each tokens generated
		 *
		 * NOTE: the @word needs to be free'd after a call to this function
		*/
		word[i] = malloc(sizeof(char) * 1024);

		word[i] = token;
		token = strtok(NULL, " ");
	}

	free(token);

	return (i);
}

/**
 * reset_to_null - function to reinitialise a char array pointer
 *               with a null value
 *
 * @ptr: pointer variable to reset to null
 *
 * Return: return nothing
*/

void reset_to_null(char *ptr[])
{
	int i;

	/* set all index of the pointer to null */
	while (ptr[i] != NULL)
	{
		ptr[i] = malloc(sizeof(char) * 1024);
		ptr[i] = "\0";
	}
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "shell.h"
#include "split.h"

/**
 * shell - a function to display the command prompt
 *
 * Return: return the number of shell arguments entered
*/

int shell(void)
{
	/* initialize the necessary variables */

	char **buffer;
	char *arg_vector[BUFFER_SIZE];
	int i, arg_counter;
	ssize_t flag;
	size_t *buffer_size;

	/* allocate enough memory for the pointer variables */
	buffer = malloc(sizeof(char) * BUFFER_SIZE);
	buffer_size = malloc(sizeof(size_t) * 1024);

	/* loop through to keep displaying the command prompt */
	while (TRUE)
	{
		printf ("|--(user@webhost)-[~]\n");
		printf ("|-$ ");

		flag = getline(buffer, buffer_size, stdin);

		if (flag == -1)
		{
			exit(EXIT_SUCCESS);
		}

		/* save the generated tokens into the args variable */
		arg_counter = split_buffer(buffer, arg_vector);

		/** fucntion accepting args as a paramenter, to handle commands **/
		printf("Debugging: %s", arg_vector[4]);
		reset_to_null(arg_vector);
		printf("\n\n");

	}

	/* freeing malloc'ed variables */
	free(buffer);
	free(arg_vector);	/* this was malloc'ed in the split_buffer fucntion */

	return (i);	/* return the number of arguments entered. i.e number of words */
}

int main(void)
{
	shell();
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "shell.h"
#include "buffer.h"

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

	buffer = malloc(sizeof(char));

	/* loop through to keep displaying the command prompt */
	while (TRUE)
	{
		printf("|--(user@localhost)-[~]\n");
		printf("|-$ ");

		getbuffer(buffer);
		/* save the generated tokens into the args variable */
		arg_counter = splitbuffer(arg_vector, buffer);

		/** function accepting args as a paramenter, to handle commands **/
		/* ......................... */

		/* set the value of arg_vector to null */
		setnull(arg_vector);

		printf("\n\n");

	}

	/* freeing malloc'ed variables */
	free(buffer);

	/* return the number of arguments entered. i.e number of words */
	return (arg_counter);
}

int main(void)
{
	shell();
}

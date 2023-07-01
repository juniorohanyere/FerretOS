void dummy_test_entrypoint()
{

}

void main(void)
{
	char *video_memory = (char*) 0xb8000;
	*video_memory = 'G';
}

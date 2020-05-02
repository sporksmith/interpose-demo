call_write: call_write.c
	gcc -g -o call_write call_write.c

libinterpose.so: interpose.c
	gcc -shared -o libinterpose.so interpose.c

all: call_write libinterpose.so libexplicit_interpose.so

call_write: call_write.c
	gcc -g -o call_write call_write.c

libinterpose.so: interpose.c
	gcc -fPIC -g -L. -shared -o libinterpose.so interpose.c

libexplicit_interpose.so: explicit_interpose.c
	gcc -fPIC -g -L. -shared -o libexplicit_interpose.so explicit_interpose.c -ldl

prog : ABR.o test-makefile.o
	gcc -o prog ABR.o test-makefile.o


ABR.o : ABR.c
	gcc -o ABR.o -c ABR.c

test-makefile.o : test-makefile.c
	gcc -o test-makefile.o -c player.c

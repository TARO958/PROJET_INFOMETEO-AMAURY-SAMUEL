all: exec

main.o: main.c
	gcc -c main.c -o main.o

# Compilation

ABR.o: ABR.c ABR.h
	gcc -c ABR.c -o ABR.o

AVL.o: AVL.c AVL.h
	gcc -c AVL.c -o AVL.o

TAB.o: TAB.c TAB.h
	gcc -c TAB.c -o TAB.o

exec: main.o AVL.o ABR.o TAB.o
	gcc main.o AVL.o ABR.o TAB.o -o exec

# supprime les fichier objet
clean:
	rm -f *.o exec

	


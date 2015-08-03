CC = gcc
CFLAGS = -g -Wall -std=gnu99 -fgnu89-inline
LINKER = -lncurses
ELF = chessgame
INC_W_LEVEL = -Wextra -pedantic
BLDFOLDER = build
CHESSLIB = chesslib.c

chessgame: main.c chesslib.c chesslib.h
	if [ ! -e $(BLDFOLDER) ]; then mkdir $(BLDFOLDER); fi \
	&& $(CC) $(CFLAGS) $< $(CHESSLIB) -o $@ $(LINKER); mv $@ $(BLDFOLDER)

chessgameWall: main.c chesslib.c chesslib.h
	if [ ! -e $(BLDFOLDER) ]; then mkdir $(BLDFOLDER); fi \
	&& $(CC) $(CFLAGS) $(INC_W_LEVEL) $< $(CHESSLIB) -o $@ $(LINKER); mv $@ $(BLDFOLDER)

chesslib: chesslib.c
	$(CC) -c $(CFLAGS) $<; \
	ar -cvq chesslib.a chesslib.o; \
	rm chesslib.o
run:
	exec ./$(BLDFOLDER)/$(ELF)

runW:
	exec ./$(BLDFOLDER)/$(ELF)Wall

.PHONY: clean
clean:
	rm -rf build \
	rm -rf *.o

cleantxt:
	rm -rf build/*.txt \
	rm -rf *.txt

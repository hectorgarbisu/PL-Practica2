all: lex cc

lex:
	flex hahascriptLex.l

cc:
	gcc -g -Wall lex.yy.c -o alex -lfl

clean: 
	-rm lex.yy.c
	-rm alex
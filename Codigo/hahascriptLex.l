%{
#define UNKNOWN	256

#define INT 	257
#define FLOAT 	258
#define CHAR 	259
#define STRING 	260

#define FUNC 	261
#define LOOP 	262
#define LOOPE 	263
#define APAR 	264
#define CPAR 	265
#define ABLO 	266
#define CBLO 	267
#define COND 	268
#define ELSE 	269
#define ASIG 	270
#define MAYORQUE 271
#define MAYORIGU 272
#define INCR 	273
#define SUMA 	274
#define MULTI 	275
#define POTEN 	276
#define DECRE 	277
#define RESTA 	278
#define DIVIS 	279
#define LOGAR 	280
#define RETURN 	281
#define BREAK 	282

#define COMILLA 283
#define PUNTOCOMA 284

#define IDEN 	285

int numline =1;
void error(char* );
%}

digit			[0-9]
letter			[a-zA-Z]
lcnaoh			[b-gi-z]
notAorH			[b-gi-zB-GI-Z]
espacios		[ \t]
bobb			[-_]

%%
\n 					 { numline++;      }
"a"                  { return INCR;    }
"aa"                 { return SUMA;    }
"aaa"                { return MULTI;   }
"aaaa"               { return POTEN;   }
"h"                  { return DECRE;   }
"hh"                 { return RESTA;   }
"hhh"                { return DIVIS;   }
"hhhh"               { return LOGAR;   }
"\"".*"\"" 			 { return STRING;  }
"\""                 { return COMILLA; }
"aHa"                { return ASIG;    }
"XDD"                { return MAYORQUE;}
"XD"                 { return MAYORIGU;}
"haha"               { return FUNC;    }
"ahah"               { return RETURN;  }
L                    { return LOOP;    }
"O"                  { return LOOPE;   }
"ha"                 { return APAR;    }
"ah"                 { return CPAR;    }
"HA"                 { return ABLO;    }
"AH"                 { return CBLO;    }
"Ha"                 { return COND;    }
"aH"                 { return ELSE;    }
"ROFL"               { return BREAK;   }
";".*$				 { /*comentario*/  }

{lcnaoh}({digit}|{letter}|{bobb})*  { return IDEN; } 
{digit}+              { return INT; }
{digit}*"."{digit}*   { return FLOAT; }
\'{letter}|{digit}\'  { return CHAR; }
{espacios}+ 		  { /*NOP*/ }
.                    { printf("Unknown character [%c]\n",yytext[0]);
                       return UNKNOWN;    }


%%
int main (int argc, char** argv){
	const char* identifiers[40];
	identifiers[0] = "UNKNOWN";
	identifiers[1] = "INT";
	identifiers[2] = "FLOAT";
	identifiers[3] = "CHAR";
	identifiers[4] = "STRING";
	identifiers[5] = "FUNC";
	identifiers[6] = "LOOP";
	identifiers[7] = "LOOPE";
	identifiers[8] = "APAR";
	identifiers[9] = "CPAR";
	identifiers[10] = "ABLO";
	identifiers[11] = "CBLO";
	identifiers[12] = "COND";
	identifiers[13] = "ELSE";
	identifiers[14] = "ASIG";
	identifiers[15] = "MAYORQUE";
	identifiers[16] = "MAYORIGU";
	identifiers[17] = "INCR";
	identifiers[18] = "SUMA";
	identifiers[19] = "MULTI";
	identifiers[20] = "POTEN";
	identifiers[21] = "DECRE";
	identifiers[22] = "RESTA";
	identifiers[23] = "DIVIS";
	identifiers[24] = "LOGAR";
	identifiers[25] = "RETURN";
	identifiers[26] = "BREAK";
	identifiers[27] = "COMILLA";
	identifiers[28] = "PUNTOCOMA";
	identifiers[29] = "IDEN";
	identifiers[30] = "";
	identifiers[31] = "";
	identifiers[32] = "";
	identifiers[33] = "";
	identifiers[34] = "";
	identifiers[35] = "";
	identifiers[36] = "";
	identifiers[37] = "";
	identifiers[38] = "";
	identifiers[39] = "";
	int s;
	if(argc>1){
		yyin = fopen(argv[1],"r");
		if(yyin==NULL)
			printf("\aError abrieno el fichero.\n");
		else{
			printf("%s :\n", argv[1]);
			s = yylex();
			while(s!=0){
				printf("%d %s \t%s\n", s, identifiers[s-256], yytext);
				s = yylex();
			}
		}
	}
	printf("\n%d lines\n",numline);
	printf("end of file\n");
	return 0;
}
int yywrap(void){	
	return 1;
}
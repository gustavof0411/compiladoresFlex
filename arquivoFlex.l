%{
#include "tokens.h"
#include <stdio.h>
%}
%option noyywrap nodefault yylineno

PALAVRA_CHAVE "if"|"else"|"while"
PARENTESE [\(|\)]
IDENTIFICADOR [a-z][a-zA-Z]*
NUM [0-9]+
OPERADOR [\+|\-|\*|\/|\=]

%%

[ \t\n\r]+
{PALAVRA_CHAVE} {printf("PALAVRA-CHAVE: %s\n", yytext);}
{PARENTESE} {printf("PARENTESE: %s\n", yytext);}
{IDENTIFICADOR} {printf("IDENTIFICADOR: %s\n", yytext);}
{NUM} {printf("NUMERO: %s\n", yytext);}
{OPERADOR} {printf("OPERADOR: %s\n", yytext);}
. {printf("ERRO LEXICO: %s\n", yytext);}
<<EOF>> { return EOF;}

%%

int main(int argc, char **argv) {
    if (argc==2){
        yyin = fopen(argv[1], "r");
        if (!yyin){
            printf("Arquivo nao encontrado.\n");
            printf("Entrando no modo de entrada livre (insira entradas pra teste no terminal):");
        }
    }
    else {
        printf("Entrando no modo de entrada livre (insira entradas pra teste no terminal):");
    }
    yylex();
    return 0;
}
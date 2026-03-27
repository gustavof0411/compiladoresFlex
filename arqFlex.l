%{
#include "tokens.h"
#include <stdio.h>
%}
%option noyywrap nodefault yylineno

PALAVRA_CHAVE "if"|"else"|"while"
IDENTIFICADOR [a-z][a-zA-Z]*
%%
[ \t\n\r]+ /* skip whitespace */
{PALAVRA_CHAVE} {printf("encontrou: %s\n", yytext);}
{IDENTIFICADOR} {printf("encontrou: %s\n", yytext);}
. {printf("nao\n");}
<<EOF>> { return EOF; /*para identificador depois testar _?[a-z][a-zA-Z]*  */  }

%%

int main() {
    yylex();
    return 0;
}
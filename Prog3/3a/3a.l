%option noyywrap
%{
#include<stdio.h>
#include<stdlib.h>
%}
%%

"//"[ a-zA-Z0-9]* {printf("single-line comment found\n");}
[/][*](.|\n)*[*][/] {printf("multi-line comment found\n");}
. {fprintf(yyout, "%s", yytext);}

%%
int main()
{
    yyin = fopen("input.c", "r+");
    yyout = fopen("output.c", "r+");

    yylex();
    printf("Successful\n");
    return 0;
}

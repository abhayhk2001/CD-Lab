%option noyywrap
%{
	#include "y.tab.h"
%}
%%

[abc] return yytext[0];
[\n.] return 0;

%%

%{
#include "y.tab.h"
%}
 

%%
[A-Za-z]+|[0-9]+|[-+][0-9]+ return A;
"+"|"-"|"*"|"/"|"="         return o;
"("|")"                     return yytext[0];
"\n"                        return NL;
. return yytext[0];
%%

int yywrap(){return 1;}

%{
#include "y.tab.h"
%}

keyword main|int|for|while|do|char|return|float

%%
{keyword}  {printf("Invalid ID - Keyword Exists!\n");}
[A-Za-z]+  {return A;}
[0-9]+     {return B;}
_          {return A;}
\n         {return NL;}
.          {return yytext[0];}
%%

int yywrap(){return 1;}

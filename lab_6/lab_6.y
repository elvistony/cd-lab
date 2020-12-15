%{
#include <stdio.h>
#include <stdlib.h>
%}

%token A B NL;

%%
start: S NL {printf("Valid Identifier\n\n");exit(0);};
S: A C|A;
C: A C|A|B|B C;
%%

int yyerror(){printf("Invalid Identifier\n\n");exit(0);}

int main(){
    printf("Enter String: \t");
    yyparse();
    return 0;
}

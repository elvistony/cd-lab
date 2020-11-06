%{
#include <stdio.h>
%}

%token A o NL;

%%
start: E NL {printf("Valid Expression!\n");exit(0);};
E:W o W|'('E')'|W
W:A|E
%%

int yyerror(char *msg){printf("Invalid Expression!\n");exit(0);}

int main(){
    printf("Enter an Expression:\t");
    yyparse();
    return 0;
}

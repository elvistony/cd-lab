%{
    #include<stdio.h>
    int flag=0;
%}

    %token NUMBER
    %left '+' '-'
    %left '*' '/' '%'
    %left '(' ')'
    
%%
ArithematicExpression:E{
printf("\nAns:  %d",$$);
return 0;
};
E: E '+' E {$$=$1+$3;}
 | E '-' E {$$=$1-$3;}
 | E '*' E {$$=$1*$3;}
 | E '/' E {$$=$1/$3;}
 | E '%' E {$$=$1%$3;}
 | '(' E ')' {$$=$2;}
 | NUMBER {$$=$1;}
 ;
%%
void main(){
    printf("Enter a Math Expression: ");
    yyparse();
    if(flag==0)
        printf("\nValid Expression!\n");
}
void yyerror(){
    printf("\nInvalid Expression\n"); flag=1;
}

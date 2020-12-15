%{ 
    #include <stdio.h>
    #include <ctype.h>
    #include <string.h>
    int yylex();
    void push ();
    void codegen();
    void codegen_umin();
    void codegen_assign();
    void yyerror();
    char st[100][10];
    int top=0;
    char i_[2] = "0";
    char temp[2] = "t";
    extern char *yytext;
%}

%token ID NUM
%right '='
%left '+' '-'
%left '*' '/'
%left UMINUS

%%
S:ID{push();} '='{push();} E{codegen_assign();};
E:E'+'{push();} T{codegen();}
 |E'-'{push();} T{codegen();}
 |T 
;
T:T'*'{push();} F{codegen();}
 |T'/'{push();} F{codegen();}
 |F ;
F:'(' E ')'
 |'-'{push();} F {codegen_umin();}
 |ID{push();}
 |NUM{push();};
%%


int main(){
    printf("Input Arithmetic Exp: ");
    yyparse();
    return 0;
}

void push(){
    strcpy(st[++top],yytext);
}

void codegen(){
    strcpy(temp,"t");
    strcat(temp,i_);
    
    printf("%s = %s %s %s\n",temp,st[top-2],st[top-1],st[top]);
    top-=2;
    strcpy(st[top],temp);
    i_[0]++;
}

void codegen_umin(){
    strcpy(temp,"t");
    strcat(temp,i_);
    printf("%s=-%s\n",temp,st[top]);
    top--;
    strcpy(st[top],temp);
    i_[0]++;
}

void codegen_assign(){
    printf("%s = %s \n\n",st[top-2],st[top]);
    top-=2;
}

void yyerror(){
    printf("\nInvalid Expression\n");
}

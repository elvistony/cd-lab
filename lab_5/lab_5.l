%{
#include <stdio.h>
int pre=0,num=0,key=0,op=0,id=0,scom=0,mcom=0;
%} 

ope "+"|"-"|"*"|"/"|"="

%%
[#] {fprintf(yyout, "%s", yytext); pre++;}
[0-9]+ {fprintf(yyout, "%s", yytext); num++;}
main|int|scanf|printf|else|if|return|char {fprintf(yyout, "%s", yytext); key++;}
{ope} {fprintf(yyout, "%s ", yytext); op++;}
[a - z A - Z][a - z A - Z 0 - 9]* {fprintf(yyout, "%s", yytext); id++;}
"//".* {scom++;}
\/\*(.*\n)*.*\*\/ {mcom++;}
[\n \t] {fprintf(yyout, "%s \n", yytext);}
[""] {}
%%

int main(){
  yyin = fopen("in.c","r");
  yyout =fopen("out.c","w");
  yylex();

  printf("No. of Keywords:\t\t %d \n",key);
  printf("No. of Operators:\t\t %d \n",op);
  printf("No. of Comments:\t\t %d \n",scom+mcom);
  printf("No. of Identifiers:\t\t %d \n",id);
  printf("No. of Numbers:\t\t\t %d \n",num);
  printf("No. of PreProcessor Directives: %d \n",pre);
  return 0;
}

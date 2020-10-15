%{
#include<stdio.h>
int flag=0,a=0,b=0,op,c=0;
%}
%%
[+] {op=1;}
[-] {op=2;}
[*] {op=3;}
[/] {op=4;}
[0-9]+ { 
if (flag==0) {a=atoi(yytext); flag=1;}
else {
b=atoi(yytext);
if(op==1) {c=a+b; a=c;}
if(op==2) {c=a-b; a=c;}
if(op==3) {c=a*b; a=c;}
if(op==4) {c=a/b; a=c;}
}}
%%
int main (int argc, char **argv){
    if (argc>1)
        yyin = fopen (argv[1],"r");
    else{
        printf("Enter Input: ");
        yylex();
        printf("ans = %d \n",c);
        }
    return 0;
}



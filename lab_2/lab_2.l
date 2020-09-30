%{
  #include <stdio.h>
  int sen=0,space=0,line=0,symbol=0,letter=0;
%}
%%
\n  {line++;}
" " {space++;}
[.] {sen++;}
[a-zA-Z] {letter++;}
. {symbol++;}
%%
int main()
{
  yyin=fopen("a.txt","r");
  yylex();
  printf("no.of lines:%d\n",line);
  printf("no.of space:%d\n",space);
  printf("no.of sentences:%d\n",sen);
  printf("no.of letters:%d\n",letter);
  printf("no.of characters:%d\n",letter+sen+space+symbol);
  printf("no.of words:%d\n",space+sen);
  printf("no.of symbols:%d\n",symbol);
}

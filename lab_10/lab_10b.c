#include<stdio.h>
#include<math.h>
#include<string.h>
#include<ctype.h>
#include<stdlib.h>


int n,m=0,p,i=0,j=0,fiC,foC;
char a[10][10],firsts[10],follows[10];
void follow(char c);
void first(char c);


int main(){
    int i,j,z;
    char c,ch;
    printf("Enter the no of productions:\n");
    scanf("%d",&n);
    printf("Enter the productions:\n");
    for(i=0;i<n;i++)
        scanf("%s%c",a[i],&ch);
    char firsts[10];
    int first_c;
    printf("|Variable\t\t FIRST\t\t FOLLLOW|\n");
    for (i=0;i<n;i++){
        c = a[i][0];
        m=0;
        first(c);
        fiC=m;
        m=0;
        follow(c);
        foC=m;
        printf("[ %c ] \t \t",c);
        for(j=0;j<fiC;j++)
            printf("%c",firsts[j]);
        printf("\t");
        
        for(j=0;j<foC;j++)
            printf("%c",follows[j]);
        printf("\n");
    }
    return(0);
}

void first(char c){
    int k;
    if(!isupper(c))
        firsts[m++]=c;
    for(k=0;k<n;k++){
        if(a[k][0]==c){
            if(a[k][2]=='$')
                follow(a[k][0]);
            else if(islower(a[k][2]))
                firsts[m++]=a[k][2];
            else first(a[k][2]);
        }
    }
    
}
void follow(char c){
    if(a[0][0]==c)
        follows[m++]='$';
    for(i=0;i<n;i++){
        for(j=2;j<strlen(a[i]);j++){
            if(a[i][j]==c){
                if(a[i][j+1]!='\0')
                    first(a[i][j+1]);
                if(a[i][j+1]=='\0' && c!=a[i][0])
                    follow(a[i][0]);
            }
        }
    }
}

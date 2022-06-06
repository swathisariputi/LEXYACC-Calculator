/*Defitinitions*/
%{
#include<stdio.h>
%}

/* Rules*/
%%
.{4}a.*p$ {printf("Strings having fifth element as a and having last letter as 'p'\n");} 

.{4}a.*$ {printf("Strings having fifth element as 'a\n");} 

.*p$ {printf("Strings having last letter as 'p'\n");} 

.*p.{1}$ {printf("Strings having last 2nd second letter as 'p'\n");} 

ab {printf("Strings having exactly 2 letters as 'ab'\n");}

.*[A-Z].*[0-9].*[<>~,*&()#@].*|.*[A-Z].*[<>~,*&()#@].*[0-9].*|.*[0-9].*[A-Z].*[<>~,*&()#@].*|.*[0-9].*[<>~,*&()#@].*[A-Z].*|.*[<>~,*&()#@].*[0-9].*[A-Z].*|.*[<>~,*&()#@].*[A-Z].*[0-9].* {printf("String having atleast one Capital, one special character, one number \n");}

.*[A-Z].* {printf("strings having atleast one Capital\n");}

vnit {printf("String vnit in lower case\n");}

"\n" {printf("\nEnter next string\n");}

exit {exit(0);}
%%

int yywrap(void){ 
  return 1;
}

int main()
{
	// The function that starts the analysis
	yylex();
	return 0;
}

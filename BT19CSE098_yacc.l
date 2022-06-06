
/*Defitinitions*/
%{
#include<stdio.h>
#include"BT19CSE098_yacc.tab.h"
%}

/*Rules*/

%%

"while"   {return WHILE;}

_*[a-zA-Z]_*[a-zA-Z0-9]*_*  {return VAR;}

[1-9][0-9]+|[0-9]    {return NUMBER;}

"=="       {return EQUALS;}

[\t\n]   ; 


[=,\{\}\(\);] {return *yytext;}


%%

int yywrap(void){ 
  return 1;
}

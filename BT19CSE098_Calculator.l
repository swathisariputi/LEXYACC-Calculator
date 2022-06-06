%{
/*Definitions*/
#include<stdio.h>
#include "BT19CSE098_Calculator.tab.h"
%}

/* Rules*/

%%

([1-9][0-9]+|[0-9])?\.[0-9]+ {
               yylval.fval =atof(yytext);
               return NUMBER;
         }
^-?[0-9]+ {
         yylval.fval =atof(yytext);
         return NUMBER;
         }

[0-9]+ {
		yylval.fval=atof(yytext);
		return NUMBER;

	}

[\t] ;

[\n] ;

exit {return exit_command;} //exit for terminating program

. return yytext[0];

%%

//c code
int yywrap()
{
return 1;
}

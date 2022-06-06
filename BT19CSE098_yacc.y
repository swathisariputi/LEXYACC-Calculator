%{
/*Definitions*/
#include<stdio.h>
void yyerror();
%}

%token NUMBER
%token VAR
%token WHILE
%token EQUALS

%%

statement_list : statement			
        | statement_list statement
                ;
statement  :
        while_stmt '{' statement_list '}'     {printf("While loop check-done\n");}
            | VAR '=' NUMBER ';'
            | VAR '=' VAR ';'
        ;
while_stmt :
        WHILE '('condition')'
       ;

condition  :
             VAR EQUALS NUMBER | VAR EQUALS VAR
            ;


%%

//driver code
int main()
{
   printf("\nEnter while loop for check with condition == \n");
   yyparse();
   return 0;
}

//error handling
void yyerror()
{
   printf("\nError: Syntax Error\n\n");
}

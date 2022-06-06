%{
/*Definitions*/
#include<stdio.h>
void yyerror();
#include <math.h>
%}

%union{
  float fval;
  char *sval; 
}  
%token <fval> NUMBER
%type <fval> E
%type <sval> line
%token exit_command
//operators according to their associativity and precedence
%left '+' '-'                 
%left '*' '/' '%'
%left '(' ')'
%right '^'

/* Rules */

%%

input: 
     |input line 
     ;

line: '=' {printf("Enter Expression for calculation or type exit to come out of calculator\n");}
    |E '=' {printf("\nResult:%f\n\n",$1);}
    |exit_command {return 0;}
    
    ;

E:NUMBER {$$=$1;}
 |E'+'E {$$=$1+$3;}
 |E'-'E {$$=$1-$3;}
 |E'*'E {$$=$1*$3;}
 |E'/'E {if($3 == 0){
	 printf("Error : Can not divide by zero\n");
         return 0;}
	else{
	 $$ = $1/$3;
         }
       }
 |'('E')' {$$=$2;}
 |'-'E {$$=-$2;}
 |'+'E {$$=$2;}
 |E'^'E{
       if($1==0 && $3<=0){
 	 printf("Error : The power of 0 is undefined for negative exponent\n");
         return 0;
       }   
       else{
       $$=pow($1,$3);  //To get correct value
       /*float x=$1,y=$3;                         For getting Correct value , we can use inbuilt pow function math.h 
       int i;                                      Or for getting accurate exponentiation value for floating point numbers , we can use this logic written here.
	   float a,sum,term,const_err;                      
	   sum=1.0;   // initialize sum of series 
	   a=y*log(x);
	   term=a;
	   const_err=0.00001;
	   i=1;
	   while(fabs(term)>const_err)
	   {
		  sum=sum+(float)term/i;
		  term=(float)term*a/i;
		  i++;
	   }
	   $$=sum;*/
       }
    }
  |

;

%%

//driver code
void main()
{
   printf("\nEnter Arithmetic Expression ending with '=' \n");
   yyparse();
}

//error handling
void yyerror()
{
   printf("\nError: Syntax Error or Entered invalid Arithmetic Expression\n\n");
}

%{
	#include<stdio.h>
	#include<string.h>
	#include<stdlib.h>
	#include<math.h>
	#include "mainf.tab.h"
        extern int yylval; 
        
%}
variable         [a-zA-Z]
header	         "import ".*
Comment	         [#].*
CommentMulti     "##"[^##]*"##"
	
%%
"Main"	    {printf("\nMain Function Start\n"); 
                     return VOIDMAIN; }
[-+]?[0-9]+  	    {yylval = atoi(yytext); return NUM; }
[0-9]*"."[0-9]+     {yylval=atoi(yytext);return NUM;}
{variable}	    {ECHO;printf("\n"); 
                    yylval = *yytext - 'a'; return VAR; }
"SP" 		    {return PST;  }
"EP"  		    {return PEN;  }
"{{" 		    {return BST;  }
"}}"  		    {return BEN;  }
[;][;]              {return SM;   }

"t_int"  	    {return INT;}
"t_float"           {return FLOAT;}
"crt"               {return CHAR;}
"array"		    {return ARRAY;}

"iff" 	            {return IF;   }
"els" 		    {return ELSE; }
"elf" 		    {return ELSEIF; }
"for_" 		    {return FOR;}
"since"             {return WHILE;}
"result"            {return CASE;}
"Test"	            {return SWITCH;}
"DEFAULT" 	    {return DEFAULT;}

"Display"           {return PRINTFUNCTION; } 
"++"	            {return PLUS;}
"--"	            {return MINUS; }
"**"	            {return MUL; }
"//"	            {return DIV; }
"%%"	            {return MOD; }
"<<"	            {return LT;  }
">>"	            {return GT;}
"<<="	            {return LE;}
">>="	            {return GE;}
"->"                {return FNRETURN;}


"factorial_"	    {return FACTORIAL;}
"oddeven_"	    {return ODDEVEN;}
"prime"	            {return PRIME;}
"sort"	            {return SORT;}
"max"               {return MAX;}
"min"               {return MIN;}
"gcd"               {return GCD;}
"lcm"               {return LCM;}
"increment"         {return INC;}
"decrement"         {return DEC;}
"AND_"              {return AND;}
"OR_"               {return OR;}

"sqr"	            {return SQR;}
"sqrt"	            {return SQRT;}
"exponential"	    {return EXP;}
"pow"	            {return POW;}
"log_"		    {return LOG;}
"sin_"		    {return SIN;}
"cos_"              {return COS;}
"tan_"              {return TAN;}

"Def"	    {return FUNCTION;} 
"TRY"		    {return TRY;}
"CATCH"		    {return CATCH;}

"CLASS"	            {printf("New Class  Name : ");
                     ECHO;printf(" "); 
                     return CLASS;}

{Comment}	    {printf("\nSingle line comment found :: ");ECHO;printf("\n");}
{CommentMulti}	    {printf("\nMultiple line comment found :: \n");ECHO;printf("\n");}
{header}            {printf("\nHeader file found :\n");
                    ECHO;printf("\n");}
[+-/*<>=,:^]        {yylval = yytext[0];	
                     return *yytext;}

[ ]*	    	    {}
[\n]*		    {}
[\t]*		    {}
.	            {printf("\nUnknown Syntax : %s\n",yytext);}


%%

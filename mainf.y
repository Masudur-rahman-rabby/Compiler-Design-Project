%{
  #include<stdio.h>
  #include<stdlib.h>
  #include<math.h>

  int sym[30]; int s[30]={0};
  char fun[20];
  int ar[30][10];

  int varnum=0;
  int expnum=0;
  int ifelsenum=0;
  int fornum=0; 
  int whilenum=0;
  int switchnum=0; 
  int printnum=0;
  int fun_num=0;
  int arr_num=0;
  int class_num=0;
  int trycatch_num=0;
  int var_assign_num=0;
%}
/* bison declarations */

%token VOIDMAIN NUM VAR PST PEN BST BEN SM INT FLOAT CHAR ARRAY GCD LCM INC DEC AND OR IF ELSE ELSEIF FOR WHILE CASE SWITCH DEFAULT PRINTFUNCTION PLUS MINUS MUL DIV MOD LT GT LE GE FACTORIAL ODDEVEN PRIME SORT SQR SQRT EXP POW LOG SIN COS TAN TRY CATCH CLASS FUNCTION FUN MAX MIN FNRETURN
%nonassoc ELSE
%nonassoc IFX
%nonassoc FOR
%nonassoc FUNCTION

%left LE GE 
%left LT GT 
%left PLUS MINUS
%left MUL DIV MOD
%left SQRT SQR 
%left SIN COS TAN LOG

%%

program: VOIDMAIN BST line BEN {printf("Main Function is Finished !!!\n");
                                 printf("\n");    }
	 ;

line:   /* NULL */

	| line statement
	;

statement: SM	
		
	| declaration SM		{ varnum++;}

	| expression SM			{  $$=$1;
		                           printf("\n.........................................\n");
		                           expnum++;
		                  }
	
  | VAR '=' expression SM         { 
			printf("\nValue of the variable: %d\n",$3);
				sym[$1]=$3;
				$$=$3;
				printf("\n.........................................\n");
				var_assign_num++;
				}

  | VAR PST NUM PEN '=' expression SM         { 
					   printf("\nValue of the variable: %d\n",$3);
             ar[$1][$3]=$6;
					   $$=$6;
					   printf("\n.........................................\n");
					   var_assign_num++;
				}

  | IF PST expression PEN BST statement BEN %prec IFX   {
								if($3){
								   	printf("\nvalue of expression in IF: %d\n",$6);
								       }
								else{   printf("\nWhen IF_Condition is Wrong->\n");
									printf("\nCondition value is '0' in IF block\n");
								}

								printf("\n.........................................\n");
								ifelsenum++;

							}

  | IF PST expression PEN BST statement BEN ELSE BST statement BEN {
								if($3){
									printf("value of expression in IF: %d\n",$6);
								}
								else{
									printf("value of expression in ELSE: %d\n",$10);
								}
								ifelsenum++;
								printf("\n.........................................\n");
							}
       
  | IF PST expression PEN BST statement BEN ELSEIF PST expression PEN BST statement BEN ELSE BST statement BEN
                                                                {
								 if($3)      {
									      printf("value of expression in IF: %d\n",$6);
								             }
                  else if($10){
                        printf("value in ELSE_IF: %d\n",$13);
                              }
								 else        {
		                    printf("value of expression in ELSE: %d\n",$17);
								             }     
								ifelsenum++;
								printf("\n.........................................\n");
							}  
      
        
  | FOR PST NUM ',' NUM ',' NUM PEN BST statement BEN { 
	                                                     int i;
	                                                     printf("FOR Loop execution");
	                                                     for(i=$3 ; i<$5 ; i=i+$7 )
                                                             {printf("\nvalue of the  i: %d | expression value : %d\n", i,$10);}
                                                             
	                                                     printf("\n.........................................\n");
                                                             fornum++;
                                                            }

	
  | FOR PST NUM ',' NUM PEN BST statement BEN {   
                                                    int i;
	                                            printf("FOR Loop execution(Second type)");
                                                      for (i=$3 ; i<=$5;i=i+1)
                                                         {
                                                              printf("\nvalue of the  i: %d | expression value : %d\n", i,$8);
	                                                      printf("\n.........................................\n");
                                                              fornum++;
                                                          }
                                                       
                                                    } 

  | WHILE PST NUM LT NUM PEN BST statement BEN {
	                                              int i;
	                                              printf("WHILE Loop execution(Incremental)");
	                                              for(i=$3 ; i<$5 ; i++) 
                                                      {printf("\nvalue of the loop: %d | expression value: %d\n", i,$8);}
	                                              printf("\n.........................................\n");									
				                      whilenum++;
                                                      }

  | WHILE PST NUM GT NUM PEN BST statement BEN {
	                                              int i;
	                                              printf("WHILE Loop execution(Decremental)");
	                                              for(i=$3 ; i>$5 ; i--) 
                                                      {printf("\nvalue of the loop: %d | expression value: %d\n", i,$8);}
	                                              printf("\n.........................................\n");									
				                      whilenum++;
                                                      }

  | SWITCH PST NUM PEN BST SWITCHCASE BEN {
		                                                 printf("\nSWITCH CASE Declaration\n");
	                                                         printf("\nFinally Choose Case number :-> %d\n",$3);
                                                           
		                                                 printf("\n.........................................\n");
		                                                 switchnum++;
	                                                        } 

	| PRINTFUNCTION PST expression PEN SM {printf("\nPrint Expression %d\n",$3);
		                               printnum++;
		                               printf("\n.........................................\n");
                                              }

  | ARRAY TYPE VAR PST NUM PEN SM {
		                         printf("Array Declaration\n");
                                         printf("Size of the Array is : %d\n",$5);
                                         {
                                             int array[8] = {4, 5, 23, 3, 8, 9, 13, 0};
                                               int loop;
                                                  for(loop = 0; loop < 8; loop++)
                                                  printf("%d ", array[loop]);
           
                                     }
  
                                         arr_num++;printf("\n.........................................\n");
                                        } 

	| FACTORIAL PST NUM PEN SM {
		                    printf("\nFACTORIAL declaration\n");
		                    int i;
		                    int f=1;
		                    for(i=1;i<=$3;i++)
		                       {
			                        f=f*i;    
                          }
		                    printf("FACTORIAL of %d is : %d\n",$3,f);
		                    printf("\n.........................................\n");
                                    fun_num++;
                                   }

	| ODDEVEN PST NUM PEN SM {
		                  printf("Odd Even Number detection \n");
                                  if($3 % 2 == 0) {
			                           printf("Number : %d is --- Even\n",$3);
		                                  }
		                  else {
			                 printf("Number is :%d is --- Odd\n",$3);
		                       }
		                  printf("\n.........................................\n");
		                  fun_num++;
		                 }
         
  | PRIME PST NUM PEN SM {  
                                    printf("Prime Number Detection -> \n");    
                                    int i,j,k;
                                    int p = 0;
                                    for(i=2;i<=$3-1;i++)
                                       {
                                          j = $3 % i;
                                          if (j == 0)
                                              {
                                                p=1;
                                                break;
                                              }
                                       }
                                    k=$3;
                                    if( k == 1){
                                                 printf("1 is neither prime nor composite.\n");
                                                } 
                                    else{
                                             if(p == 0){
                                                printf("%d is prime.\n",$3);
                                                }
                                             else{
                                                  printf("%d is Composite, not prime.\n",$3);
		                                  fun_num++;
                                                 }
                                         } 
                                  printf("\n.........................................\n");
		                  fun_num++;
                              }

  | MAX PST NUM ',' NUM PEN SM {
                                      printf("\nTwo Values are : %d & %d\n",$3,$5,fmax($3,$5)); 
                                      $$ = fmax($3,$5);
                                      printf("\nMaximum Value is :  %d\n",$$);
                                      printf("\n.........................................\n");
		                      fun_num++;
                                     }
  | MIN PST NUM ',' NUM PEN SM {
                                      printf("\nTwo Values are : %d & %d\n",$3,$5,fmin($3,$5)); 
                                      $$ = fmin($3,$5);
                                      printf("\nMinimum Value is :  %d\n",$$);
                                      printf("\n.........................................\n");
		                      fun_num++;
                                     }
  | GCD PST NUM ',' NUM PEN SM {
                                       int i, gcd;
                                       printf("\nTwo Values are: %d & %d\n ",$3 ,$5);
                                       for(i=1; i <= $3 && i <= $5; i++)
                                               {
                                                if($3%i==0 && $5%i==0)
                                                    gcd = i;
                                                    $$ =gcd;
                                               }                                                 
                                         printf("\nG.C.D of %d and %d is --> %d\n", $3, $5, $$);
                                         printf("\n.........................................\n"); 
                                          fun_num++; 
                                        }

                                       
  | LCM PST NUM ',' NUM PEN SM {
                                       printf("\nLCM calculation using GCD::\n ");   
                                       int i, gcd,lcm;
                                       printf("\nTwo Values are: %d & %d\n ",$3 ,$5);
                                       for(i=1; i <= $3 && i <= $5; i++)
                                               {
                                                if($3%i==0 && $5%i==0)
                                                    gcd = i;
                                               }  
                                         lcm = ($3 * $5) / gcd;
                                         $$ = lcm; 
                                         printf("\nLCM of  %d and %d is --> %d\n", $3, $5, $$);                                                
                                         printf("\n.........................................\n");  
                                       fun_num++;
                                     }

  | FUNCTION VAR PST argument PEN FNRETURN TYPE ':' BST statement BEN {
		                               printf("FUNCTION found : : \n");
                                               fun[$2]=$10; 
                                               printf("fuction declared successfully\n");
                                             }
  | VAR PST argument PEN  ':' SM  {   if(fun[$1])
                           {
                               printf("function called successfully\n");
                               printf("function value is %d\n",fun[$1]);
                            }
                            printf("\n.........................................\n");
		            fun_num++;                    
                       }





	| FUNCTION VAR ':' BST statement BEN {
		                               printf("FUNCTION found : : \n");
                                               fun[$2]=$5; 
                                               printf("fuction declared successfully\n");
                                             }
  | VAR ':' SM  {   if(fun[$1])
                           {
                               printf("function called successfully\n");
                               printf("function value is %d\n",fun[$1]);
                            }
                            printf("\n.........................................\n");
		            fun_num++;                    
                       }
 
	 
  | INC NUM SM {  printf("Increment -> %d\n", ++$2); $$ = ++$2; }
  | DEC NUM SM {  printf("Decrement -> %d\n", --$2); $$ = --$2 ; }
 
  | PST expression PEN AND PST expression PEN SM {
                                                      if ( ($2) && ($6) ) {
                                                              printf("AND Condition is true\n" );
                                                                         }                         
                                                      else {
                                                             printf("AND Condition is not true\n" );
                                                           }
                                                        printf("\n.........................................\n");
		                                        fun_num++;                    
                                                      }
	| PST expression PEN OR  PST expression PEN SM {
                                                      if ( ($2) || ($6) ) {
                                                              printf("OR Condition is true\n" );
                                                                         }                         
                                                      else {
                                                             printf(" OR Condition is not true\n" );
                                                           }
                                                        printf("\n.........................................\n");
		                                        fun_num++; 
                                                      }

  | CLASS VAR  BST statement BEN {
                                          printf("Class Declaration\n");
		                          printf("Expression : %d\n",$4);
		                          class_num++;
	                               }


	| TRY BST statement BEN CATCH PST expression PEN BST statement BEN {
		                                                             printf("TRY CATCH block found\n");
		                                                             printf("TRY Block operation : %d\n",$3);
		                                                             printf("CATCH Value : %d\n",$7);
		                                                             printf("Catch Block operation :%d\n",$10);
		                                                             printf("\n.........................................\n");
                                                                             trycatch_num++;
	                                                                    }
  | SORT  digits  SM {     
                             
                             int i,j,swap;  
                            for(i=0;i<29-1;i++)
                            {
                                for(j=0;j<29-i;j++)
                                {
                                    if (s[j] > s[j+1]) 
                                    {
                                        swap   = s[j];
                                        s[j]   = s[j+1];
                                        s[j+1] = swap;
                                    }
                                }
                            }
                            printf("sorted values are ");
                            for(i=0;i<30;i++)
                            {
                                if(s[i] != 0)
                                {
                                    printf("%d  ",s[i]);
                                }
                            
                            }
                            printf("\n.........................................\n");
                            fun_num++;
                    }
         ;
	
digits: NUM  {   s[$1]=$1;}
      |digits ',' NUM  { s[$3]=$3;}
      ;

argument: TYPE VAR
        |TYPE VAR ',' argument
        |VAR '=' expression
        |VAR '=' expression ',' argument
        |
        ;

declaration : TYPE ID1   {printf("\nVariable Declaration Complete!\n");
		printf("\n..............................................\n");}
            ;


TYPE : INT   {printf("Interger declaration\n");}
     | FLOAT  {printf("Float declaration\n");}
     | CHAR   {printf("Character declaration\n");}
     ;

ID1 : ID1 ',' VAR 
    |VAR 
    ;


SWITCHCASE: casegrammer
 	    |casegrammer defaultgrammer
 	    ;

 casegrammer: /*empty*/
 	    | casegrammer casenumber
 	    ;

  casenumber: CASE NUM ':' expression SM {printf("Case No : %d & expression value :%d \n",$2,$4);}
 	    ;
  defaultgrammer: DEFAULT ':' expression SM {printf("\nDefault case & expression value : %d",$3); }
 		;


expression: NUM				{ printf("\nNumber :  %d\n",$1 ); $$ = $1;  }

	  | VAR                         { $$ = sym[$1]; }

	  | expression PLUS expression	{printf("\nAddition :%d+%d = %d \n",$1,$3,$1+$3 );  $$ = $1 + $3;}

	  | expression MINUS expression	{printf("\nSubtraction :%d-%d=%d \n ",$1,$3,$1-$3); $$ = $1 - $3; }

	  | expression MUL expression	{printf("\nMultiplication :%d*%d = %d \n ",$1,$3,$1*$3); $$ = $1 * $3; }

	  | expression DIV expression	{ if($3) {
				     		  printf("\nDivision :%d/%d = %d \n ",$1,$3,$1/$3);
				     		  $$ = $1 / $3;
				     		 }
				  	  else {
						$$ = 0;
						printf("\ndivision by zero\n\t");
				  	       } 	
				    	}

	  | expression MOD expression	{ if($3){
				     		 printf("\nMod :%d | %d = %d \n",$1,$3,$1 % $3);
				     		 $$ = $1 % $3;
				     	         }
				  	  else{
						  $$ = 0;
						  printf("\nMOD by zero\n");
				  	      } 	
				    	}

	 
	  | expression LT expression	{printf("\nLess Than :%d < %d \n",$1,$3,$1 < $3); $$ = $1 < $3 ; }
	  | expression GT expression	{printf("\nGreater than :%d > %d \n ",$1,$3,$1 > $3); $$ = $1 > $3; }
    | expression LE expression  {printf("\nLess than Equal To :%d <= %d \n ",$1,$3,$1 <= $3); $$ = $1 <= $3;}
    | expression GE expression  {printf("\nGreater than Equal To :%d >= %d \n ",$1,$3,$1 >= $3); $$ = $1 >= $3;}
    | PST expression PEN		{  $$ = $2;  }
            
    | POW expression '^' expression      {printf("\nPower : %d^%d\n",$2,$4,$2^$4 );  
                                                $$ = pow($2,$4);
                                                printf("\nvalue of Power: %d\n", $$);}
    | EXP expression                     {printf("\nExponential of %d : %lf \n",$2,(exp($2)) );  $$ = (exp($2));} 
    | SQR expression                     {printf("\nSqure of value %d : %d \n",$2,$2*$2);  $$ = $2*$2;}
    | SQRT expression                    {printf("\nSqureRoot of value %d : %lf \n",$2,(sqrt($2))); $$ = sqrt($2);}
           
    | LOG expression    {printf("\nValue of Log(%d) is : %lf\n",$2,(log($2)) ); $$=(log($2));}    
	  | SIN expression 		{printf("\nValue of Sin(%d) is : %lf\n",$2,sin($2*3.1416/180)); $$=sin($2*3.1416/180);}
    | COS expression 		{printf("\nValue of Cos(%d) is : %lf\n",$2,cos($2*3.1416/180)); $$=cos($2*3.1416/180);}
    | TAN expression    {printf("\nValue of Tan(%d) is : %lf\n",$2,tan($2*3.1416/180)); $$=tan($2*3.1416/180);} 

         
	;
%%


int  yyerror(char *s){
	printf( "%s\n", s);
}
int yywrap()
{
	return 1;
}

int main()
{
	freopen("input.txt","r",stdin);
  freopen("output.txt","w",stdout);

	yyparse();
        
	printf("\n**********************************\n");

	printf("All the input parsing is completed !\n");
          
	printf("\n");
	
        printf("Variable declaration Count :%d \n",varnum);
        printf("Expression Count : %d\n",expnum);
        printf("If_else Count : %d\n",ifelsenum);
        printf("For loop Count :  %d\n",fornum);
	      printf("While loop Count : %d\n",whilenum);
	      printf("Switch Case Count : %d\n",switchnum);
        printf("Print function Count : %d\n",printnum);
        printf("Function Count : %d\n",fun_num);
	      printf("Array Count : %d\n",arr_num);
	      printf("Class Count : %d \n",class_num);
	      printf("Try Catch Count : %d \n",trycatch_num);
	      printf("Variable Assignment Count : %d \n",var_assign_num);
        
printf("\n**********************************\n");

  return 0;
}









/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     VOIDMAIN = 258,
     NUM = 259,
     VAR = 260,
     PST = 261,
     PEN = 262,
     BST = 263,
     BEN = 264,
     SM = 265,
     INT = 266,
     FLOAT = 267,
     CHAR = 268,
     ARRAY = 269,
     GCD = 270,
     LCM = 271,
     INC = 272,
     DEC = 273,
     AND = 274,
     OR = 275,
     IF = 276,
     ELSE = 277,
     ELSEIF = 278,
     FOR = 279,
     WHILE = 280,
     CASE = 281,
     SWITCH = 282,
     DEFAULT = 283,
     PRINTFUNCTION = 284,
     PLUS = 285,
     MINUS = 286,
     MUL = 287,
     DIV = 288,
     MOD = 289,
     LT = 290,
     GT = 291,
     LE = 292,
     GE = 293,
     FACTORIAL = 294,
     ODDEVEN = 295,
     PRIME = 296,
     SORT = 297,
     SQR = 298,
     SQRT = 299,
     EXP = 300,
     POW = 301,
     LOG = 302,
     SIN = 303,
     COS = 304,
     TAN = 305,
     TRY = 306,
     CATCH = 307,
     CLASS = 308,
     FUNCTION = 309,
     FUN = 310,
     MAX = 311,
     MIN = 312,
     FNRETURN = 313,
     IFX = 314
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;



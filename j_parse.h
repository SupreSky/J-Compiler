/* A Bison parser, made by GNU Bison 2.4.2.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2006, 2009-2010 Free Software
   Foundation, Inc.
   
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
     CLASS = 258,
     PUB = 259,
     STATIC = 260,
     OR = 261,
     AND = 262,
     EQ = 263,
     LE = 264,
     LT = 265,
     MINUS = 266,
     ADD = 267,
     TIMES = 268,
     LBP = 269,
     RBP = 270,
     LSP = 271,
     RSP = 272,
     LP = 273,
     RP = 274,
     INT = 275,
     NUM = 276,
     BOOLEAN = 277,
     TRUE = 278,
     FALSE = 279,
     NOT = 280,
     IF = 281,
     ELSE = 282,
     WHILE = 283,
     PRINT = 284,
     ASSIGN = 285,
     VOID = 286,
     MAIN = 287,
     STR = 288,
     RETURN = 289,
     SEMI = 290,
     COMMA = 291,
     THIS = 292,
     NEW = 293,
     DOT = 294,
     ID = 295,
     LIT = 296,
     COMMENT = 297
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;



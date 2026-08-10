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
     SELECT = 258,
     FROM = 259,
     WHERE = 260,
     INSERT = 261,
     INTO = 262,
     VALUES = 263,
     UPDATE = 264,
     SET = 265,
     DELETE = 266,
     CREATE = 267,
     TABLE = 268,
     AND = 269,
     OR = 270,
     PRIMARY = 271,
     KEY = 272,
     NOT = 273,
     NULL_T = 274,
     DEFAULT_T = 275,
     UNIQUE = 276,
     INT_T = 277,
     INTEGER_T = 278,
     VARCHAR_T = 279,
     CHAR_T = 280,
     TEXT = 281,
     DATE_T = 282,
     DATETIME_T = 283,
     DECIMAL_T = 284,
     FLOAT_T = 285,
     DOUBLE_T = 286,
     BOOLEAN_T = 287,
     IDENTIFIER = 288,
     NUMBER = 289,
     STRING = 290,
     EQ = 291,
     NE = 292,
     GT = 293,
     LT = 294,
     GE = 295,
     LE = 296,
     UNKNOWN = 297,
     NEWLINE = 298
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;



%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);

extern char *yytext;
%}

%token SELECT
%token FROM
%token WHERE

%token INSERT
%token INTO
%token VALUES

%token UPDATE
%token SET

%token DELETE

%token CREATE
%token TABLE

%token AND
%token OR

%token PRIMARY
%token KEY
%token NOT
%token NULL_T
%token DEFAULT_T
%token UNIQUE

%token INT_T
%token INTEGER_T
%token VARCHAR_T
%token CHAR_T
%token TEXT
%token DATE_T
%token DATETIME_T
%token DECIMAL_T
%token FLOAT_T
%token DOUBLE_T
%token BOOLEAN_T

%token IDENTIFIER
%token NUMBER
%token STRING

%token EQ
%token NE
%token GT
%token LT
%token GE
%token LE

%token UNKNOWN
%token NEWLINE

%left OR
%left AND
%left EQ NE GT LT GE LE

%%

program:
      /* empty */
    | program input
    ;


input:
      statement NEWLINE
      {
          printf("\nSQL is VALID.\n");
      }

    | statement
      {
          printf("\nSQL is VALID.\n");
      }

    | error NEWLINE
      {
          printf("\nSQL is INVALID.\n");
          yyerrok;
      }
    ;


statement:

      select_statement ';'

    | insert_statement ';'

    | update_statement ';'

    | delete_statement ';'

    | create_table_statement ';'

    ;


select_statement:
      SELECT select_list FROM IDENTIFIER optional_where
    ;


select_list:
      '*'
    | identifier_list
    ;


identifier_list:
      IDENTIFIER
    | identifier_list ',' IDENTIFIER
    ;


optional_where:
      /* empty */
    | WHERE condition
    ;


condition:
      condition AND condition
    | condition OR condition
    | IDENTIFIER comparison value
    | '(' condition ')'
    ;


comparison:
      EQ
    | NE
    | GT
    | LT
    | GE
    | LE
    ;


value:
      IDENTIFIER
    | NUMBER
    | STRING
    | NULL_T
    ;


insert_statement:

      INSERT INTO IDENTIFIER
      VALUES '(' value_list ')'

    | INSERT INTO IDENTIFIER
      '(' identifier_list ')'
      VALUES '(' value_list ')'

    ;


value_list:
      value
    | value_list ',' value
    ;


update_statement:

      UPDATE IDENTIFIER
      SET assignment_list
      optional_where

    ;


assignment_list:
      assignment
    | assignment_list ',' assignment
    ;


assignment:
      IDENTIFIER EQ value
    ;


delete_statement:

      DELETE FROM IDENTIFIER optional_where

    ;


create_table_statement:

      CREATE TABLE IDENTIFIER
      '(' column_definition_list ')'

    ;


column_definition_list:

      column_definition

    | column_definition_list ','
      column_definition

    ;


column_definition:

      IDENTIFIER data_type column_constraints

    ;


column_constraints:

      /* empty */

    | column_constraints column_constraint

    ;


column_constraint:

      PRIMARY KEY

    | NOT NULL_T

    | UNIQUE

    | DEFAULT_T value

    ;


data_type:

      INT_T

    | INTEGER_T

    | VARCHAR_T

    | VARCHAR_T '(' NUMBER ')'

    | CHAR_T

    | CHAR_T '(' NUMBER ')'

    | TEXT

    | DATE_T

    | DATETIME_T

    | DECIMAL_T

    | DECIMAL_T '(' NUMBER ',' NUMBER ')'

    | FLOAT_T

    | DOUBLE_T

    | BOOLEAN_T

    ;


%%

int main()
{
    printf("=================================\n");
    printf("       MINI SQL VALIDATOR\n");
    printf("=================================\n");

    printf("\nEnter SQL query.\n");
    printf("Every query must end with ;\n");
    printf("Press Ctrl+Z and Enter to exit.\n\n");

    yyparse();

    return 0;
}


void yyerror(const char *s)
{
    fprintf(stderr, "Syntax Error: %s\n", s);
}
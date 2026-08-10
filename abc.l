%{
#include "abc.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%option noyywrap
%option case-insensitive

%%

SELECT          { return SELECT; }
FROM            { return FROM; }
WHERE           { return WHERE; }

INSERT          { return INSERT; }
INTO            { return INTO; }
VALUES          { return VALUES; }

UPDATE          { return UPDATE; }
SET             { return SET; }

DELETE          { return DELETE; }

CREATE          { return CREATE; }
TABLE           { return TABLE; }

AND             { return AND; }
OR              { return OR; }

PRIMARY         { return PRIMARY; }
KEY             { return KEY; }
NOT             { return NOT; }
NULL            { return NULL_T; }
DEFAULT         { return DEFAULT_T; }
UNIQUE          { return UNIQUE; }

INT             { return INT_T; }
INTEGER         { return INTEGER_T; }
VARCHAR         { return VARCHAR_T; }
CHAR            { return CHAR_T; }
TEXT            { return TEXT; }
DATE            { return DATE_T; }
DATETIME        { return DATETIME_T; }
DECIMAL         { return DECIMAL_T; }
FLOAT           { return FLOAT_T; }
DOUBLE          { return DOUBLE_T; }
BOOLEAN         { return BOOLEAN_T; }


">="            { return GE; }
"<="            { return LE; }
"<>"            { return NE; }
"!="            { return NE; }

"="             { return EQ; }
">"             { return GT; }
"<"             { return LT; }


[0-9]+(\.[0-9]+)? {
    return NUMBER;
}


'([^'\\]|\\.)*' {
    return STRING;
}

\"([^\"\\]|\\.)*\" {
    return STRING;
}


[A-Za-z_][A-Za-z0-9_]* {
    return IDENTIFIER;
}


"--"[^\n]* {
}


\/\*([^*]|\*+[^*/])*\*\/ {
}


[ \t\r]+ {
}


\n {
    return NEWLINE;
}


"("             { return '('; }
")"             { return ')'; }
","             { return ','; }
";"             { return ';'; }

"*"             { return '*'; }


. {
    return UNKNOWN;
}

%%
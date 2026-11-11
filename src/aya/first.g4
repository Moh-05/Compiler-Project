lexer grammar first ;

WS
    : [ \t\r\n]+ -> skip
    ;
SINGLE_LINE_COMMENT
    : '//' ~[\r\n]* -> skip
    ;

MULTI_LINE_COMMENT
    : '/*' .*? '*/' -> skip
    ;
LET         : 'let';
BREAK       : 'break';
CASE        : 'case';
CATCH       : 'catch';
CLASS       : 'class';
CONST       : 'const';
CONTINUE    : 'continue';
DEBUGGER    : 'debugger';
DEFAULT     : 'default';
DELETE      : 'delete';
DO          : 'do';
ELSE        : 'else';
EXPORT      : 'export';
EXTENDS     : 'extends';
FINALLY     : 'finally';
FOR         : 'for';
FUNCTION    : 'function';
IF          : 'if';
IMPORT      : 'import';
IN          : 'in';
INSTANCEOF  : 'instanceof';
NEW         : 'new';
RETURN      : 'return';
SUPER       : 'super';
SWITCH      : 'switch';
THIS        : 'this';
THROW       : 'throw';
TRY         : 'try';
TYPEOF      : 'typeof';
VAR         : 'var';
VOID        : 'void';
WHILE       : 'while';
WITH        : 'with';
YIELD       : 'yield';


TRUE        : 'true';
FALSE       : 'false';
NULL        : 'null';
UNDEFINED   : 'undefined';

BIGINT
    : ( INTEGER | HEX_NUMBER | OCTAL_NUMBER | BINARY_NUMBER ) 'n'
    ;

FLOAT
    : DIGIT_SEQUENCE? '.' DIGIT_SEQUENCE (E [+-]? DIGIT_SEQUENCE)? // ---> Missed DIGIT_SEQUENCE for underscore support
    | DIGIT_SEQUENCE '.' (E [+-]? DIGIT_SEQUENCE)?
    | DIGIT_SEQUENCE E [+-]? DIGIT_SEQUENCE
    ;

HEX_NUMBER
    : '0' [xX] [0-9a-fA-F] ('_'? [0-9a-fA-F])*
    ;

OCTAL_NUMBER
    : '0' [oO] [0-7] ('_'? [0-7])*
    ;
BINARY_NUMBER
    : '0' [bB] [01] ('_'? [01])*
    ;
INTEGER
    : '0'
    | [1-9] ('_'? [0-9])*
    ;

fragment DIGIT_SEQUENCE
    : [0-9] ('_'? [0-9])*
    ;


fragment E
    : [eE]
    ;

STRING
    : '"' ( ~["\\\r\n] | '\\' . | '\\' [\r\n] )* '"'
    | '\'' ( ~['\\\r\n] | '\\' . | '\\' [\r\n] )* '\''
    ;

TEMPLATE_START
    : '`' -> pushMode(TEMPLATE_MODE)
    ;


IDENTIFIER
    : [a-zA-Z_$] [a-zA-Z0-9_$]*
    ;
STREQ           : '===';
NOT_STREQ       : '!==';
EQ              : '==';
NOT_EQ          : '!=';
ARROW           : '=>';
INC             : '++';
DEC             : '--';
EXP             : '**';
ADD_ASSIGN      : '+=';
SUB_ASSIGN      : '-=';
MUL_ASSIGN      : '*=';
DIV_ASSIGN      : '/=';
MOD_ASSIGN      : '%=';
LTE             : '<=';
GTE             : '>=';
AND             : '&&';
OR              : '||';
LSHIFT          : '<<';
RSHIFT          : '>>';
URSHIFT         : '>>>';
ELLIPSIS        : '...';

ASSIGN          : '=';
ADD             : '+';
SUB             : '-';
MUL             : '*';
DIV             : '/';
MOD             : '%';
LT              : '<';
GT              : '>';
NOT             : '!';
BIT_AND         : '&';
BIT_OR          : '|';
BIT_XOR         : '^';
BIT_NOT         : '~';
QUESTION        : '?';
COLON           : ':';

LPAREN          : '(';
RPAREN          : ')';
LBRACE          : '{';
RBRACE          : '}';
LBRACK          : '[';
RBRACK          : ']';
COMMA           : ',';
SEMI            : ';';
DOT             : '.';

LEXICAL_ERROR
    : .
    ;
mode TEMPLATE_MODE;

TEMPLATE_END
    : '`' -> popMode
    ;

TEMPLATE_INTERP_START
    : '${' -> pushMode(DEFAULT_MODE)
    ;

TEMPLATE_CHARS
    : ~[`$\\\r\n]+
    | [\r\n]
    | '$' ~[`{]
    | '\\' .
    ;
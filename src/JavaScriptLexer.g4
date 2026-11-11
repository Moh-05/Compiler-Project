lexer grammar JavaScriptLexer;

// ============================================================================
// 1. Comments & Whitespace
// ============================================================================

LINE_COMMENT  : '//' ~[\r\n]* -> skip ;
BLOCK_COMMENT : '/*' .*? '*/' -> skip ;
WS            : [ \t\r\n]+ -> skip ;

// ============================================================================
// 2. Reserved Keywords (ECMAScript 2025)
// ============================================================================

AWAIT       : 'await' ;
BREAK       : 'break' ;
CASE        : 'case' ;
CATCH       : 'catch' ;
CLASS       : 'class' ;
CONST       : 'const' ;
CONTINUE    : 'continue' ;
DEBUGGER    : 'debugger' ;
DEFAULT     : 'default' ;
DELETE      : 'delete' ;
DO          : 'do' ;
ELSE        : 'else' ;
EXPORT      : 'export' ;
EXTENDS     : 'extends' ;
FINALLY     : 'finally' ;
FOR         : 'for' ;
FUNCTION    : 'function' ;
IF          : 'if' ;
IMPORT      : 'import' ;
IN          : 'in' ;
OF          : 'of' ;
INSTANCEOF  : 'instanceof' ;
NEW         : 'new' ;
RETURN      : 'return' ;
SUPER       : 'super' ;
SWITCH      : 'switch' ;
THIS        : 'this' ;
THROW       : 'throw' ;
TRY         : 'try' ;
TYPEOF      : 'typeof' ;
VAR         : 'var' ;
VOID        : 'void' ;
WHILE       : 'while' ;
WITH        : 'with' ;
YIELD       : 'yield' ;

// Strict Mode Keywords
LET         : 'let' ;
STATIC      : 'static' ;
IMPLEMENTS  : 'implements' ;
INTERFACE   : 'interface' ;
PACKAGE     : 'package' ;
PRIVATE     : 'private' ;
PROTECTED   : 'protected' ;
PUBLIC      : 'public' ;

// Contextual Keywords & Literals
ASYNC       : 'async' ;
NULL_LITERAL: 'null' ;
UNDEFINED   : 'undefined' ;
TRUE        : 'true' ;
FALSE       : 'false' ;

// ============================================================================
// 3. Numeric Literals (Hex, Octal, Binary, Floats, Integers)
// ============================================================================

HEX_NUMBER
    : '0' [xX] [0-9a-fA-F] ('_'? [0-9a-fA-F])*
    ;

OCTAL_NUMBER
    : '0' [oO] [0-7] ('_'? [0-7])*
    ;

BINARY_NUMBER
    : '0' [bB] [01] ('_'? [01])*
    ;

FLOAT
    : DIGIT_SEQUENCE? '.' DIGIT_SEQUENCE (E [+-]? DIGIT_SEQUENCE)?
    | DIGIT_SEQUENCE '.' (E [+-]? DIGIT_SEQUENCE)?
    | DIGIT_SEQUENCE E [+-]? DIGIT_SEQUENCE
    ;

INTEGER
    : '0'
    | [1-9] ('_'? [0-9])*
    | [0-9]+
    ;

fragment DIGIT_SEQUENCE
    : [0-9] ('_'? [0-9])*
    ;

fragment E
    : [eE]
    ;

// ============================================================================
// 4. String Literals (Escape Sequences & Line Continuation)
// ============================================================================

STRING
    : '"' ( ~["\\\r\n] | '\\' ('\r\n' | '\r' | '\n') | '\\' . )* '"'
    | '\'' ( ~['\\\r\n] | '\\' ('\r\n' | '\r' | '\n') | '\\' . )* '\''
    ;

// Template Literal Entry (Triggers TEMPLATE_MODE)
TEMPLATE_START
    : '`' -> pushMode(TEMPLATE_MODE)
    ;

// ============================================================================
// 5. Identifiers (Must be placed AFTER Keywords)
// ============================================================================

IDENTIFIER
    : [a-zA-Z_$] [a-zA-Z0-9_$]*
    ;

// ============================================================================
// 6. Operators & Punctuators (Ordered by Longest Match First)
// ============================================================================

ARROW       : '=>' ;
STRICT_EQ   : '===' ;
STRICT_NEQ  : '!==' ;
EQ          : '==' ;
NEQ         : '!=' ;
GTE         : '>=' ;
LTE         : '<=' ;

// Shift operators (before GT / LT)
URSHIFT     : '>>>' ;
RSHIFT      : '>>' ;
LSHIFT      : '<<' ;

GT          : '>' ;
LT          : '<' ;

NULLISH     : '??' ;
AND         : '&&' ;
OR          : '||' ;
NOT         : '!' ;

INCREMENT   : '++' ;
DECREMENT   : '--' ;
EXP         : '**' ;
PLUS_ASSIGN : '+=' ;
MINUS_ASSIGN: '-=' ;
MULT_ASSIGN : '*=' ;
DIV_ASSIGN  : '/=' ;
MOD_ASSIGN  : '%=' ;
ASSIGN      : '=' ;

PLUS        : '+' ;
MINUS       : '-' ;
MULT        : '*' ;
DIV         : '/' ;
MOD         : '%' ;

BIT_AND     : '&' ;
BIT_OR      : '|' ;
BIT_XOR     : '^' ;
BIT_NOT     : '~' ;
QUESTION    : '?' ;
ELLIPSIS    : '...' ;

SEMI        : ';' ;
COMMA       : ',' ;
DOT         : '.' ;
COLON       : ':' ;

LPAREN      : '(' ;
RPAREN      : ')' ;
LBRACE      : '{' ;
RBRACE      : '}' ;
LBRACK      : '[' ;
RBRACK      : ']' ;

// ============================================================================
// 7. Lexical Error Catchers (Fallback for invalid syntax)
// ============================================================================

UNCLOSED_STRING
    : '"' ( ~["\\\r\n] | '\\' . )*
    | '\'' ( ~['\\\r\n] | '\\' . )*
    ;

UNCLOSED_BLOCK_COMMENT
    : '/*' ( ~[*] | '*' ~[/] )* EOF
    ;

UNEXPECTED_CHAR
    : .
    ;

// ============================================================================
// 8. TEMPLATE_MODE (Lexer Mode for Template Literals `... ${expr} ...`)
// ============================================================================

mode TEMPLATE_MODE;

TEMPLATE_END
    : '`' -> popMode
    ;

TEMPLATE_INTERP
    : '${' .*? '}'
    ;

TEMPLATE_CHARS
    : ~[`$\\\r\n]+
    | [\r\n]
    | '$' ~[`{]
    | '\\' .
    ;

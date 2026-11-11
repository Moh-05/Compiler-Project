grammar JavaScript;

// ============================================================================ 1. Parser Rules
// ============================================================================

program: statement* EOF;

statement: varDecl | ifStmt | returnStmt | exprStmt | blockStmt;

// Variable Declaration: let x = 3; or const total = 100;
varDecl: (LET | CONST | VAR) IDENTIFIER (ASSIGN expr)? SEMI;

// If Statement: if (x > 5) ...
ifStmt: IF LPAREN expr RPAREN statement (ELSE statement)?;

// Return Statement: return x;
returnStmt: RETURN expr? SEMI;

// Expression Statement: x = 10; or fn();
exprStmt: expr SEMI;

// Block Statement: { ... }
blockStmt: LBRACE statement* RBRACE;

// Expressions with Precedence (from lowest to highest)
expr:
	IDENTIFIER ASSIGN expr									# AssignExpr
	| expr op = (AND | OR | NULLISH) expr					# LogicalExpr
	| expr op = (STRICT_EQ | STRICT_NEQ | EQ | NEQ) expr	# EqualityExpr
	| expr op = (GTE | LTE | GT | LT) expr					# RelationalExpr
	| expr op = ('+' | '-') expr							# AddSubExpr
	| expr op = ('*' | '/' | '%') expr						# MulDivExpr
	| op = ('!' | '-' | '+') expr							# UnaryExpr
	| LPAREN expr RPAREN									# ParenExpr
	| IDENTIFIER											# IdExpr
	| number												# NumExpr
	| STRING												# StringExpr
	| TEMPLATE_LITERAL										# TemplateExpr
	| TRUE													# TrueExpr
	| FALSE													# FalseExpr
	| NULL_LITERAL											# NullExpr;

// Helper parser rule for numbers
number: INTEGER | FLOAT | HEX_NUMBER | OCTAL_NUMBER | BINARY_NUMBER;


// ============================================================================ 2. Reserved Keywords
// (ECMAScript 2025) ============================================================================

AWAIT: 'await';
BREAK: 'break';
CASE: 'case';
CATCH: 'catch';
CLASS: 'class';
CONST: 'const';
CONTINUE: 'continue';
DEBUGGER: 'debugger';
DEFAULT: 'default';
DELETE: 'delete';
DO: 'do';
ELSE: 'else';
EXPORT: 'export';
EXTENDS: 'extends';
FINALLY: 'finally';
FOR: 'for';
FUNCTION: 'function';
IF: 'if';
IMPORT: 'import';
IN: 'in';
OF: 'of';
INSTANCEOF: 'instanceof';
NEW: 'new';
RETURN: 'return';
SUPER: 'super';
SWITCH: 'switch';
THIS: 'this';
THROW: 'throw';
TRY: 'try';
TYPEOF: 'typeof';
VAR: 'var';
VOID: 'void';
WHILE: 'while';
WITH: 'with';
YIELD: 'yield';

// Strict mode keywords
LET: 'let';
STATIC: 'static';
IMPLEMENTS: 'implements';
INTERFACE: 'interface';
PACKAGE: 'package';
PRIVATE: 'private';
PROTECTED: 'protected';
PUBLIC: 'public';

// Contextual & literals
ASYNC: 'async';
NULL_LITERAL: 'null';
TRUE: 'true';
FALSE: 'false';

// ============================================================================ 3. Identifiers
// ============================================================================

IDENTIFIER: [a-zA-Z_$] [a-zA-Z0-9_$]*;

// ============================================================================ 4. Numbers (Integer,
// Float, Hex, Octal, Binary - NO BigInt)
// ============================================================================

HEX_NUMBER: '0' [xX] [0-9a-fA-F] ('_'? [0-9a-fA-F])*;

OCTAL_NUMBER: '0' [oO] [0-7] ('_'? [0-7])*;

BINARY_NUMBER: '0' [bB] [01] ('_'? [01])*;

FLOAT:
	[0-9] ('_'? [0-9])* '.' [0-9] ('_'? [0-9])* [eE] [+-]? [0-9] (
		'_'? [0-9]
	)*
	| [0-9] ('_'? [0-9])* '.' [0-9] ('_'? [0-9])*
	| [0-9] ('_'? [0-9])* '.' [eE] [+-]? [0-9] ('_'? [0-9])*
	| [0-9] ('_'? [0-9])* '.'
	| '.' [0-9] ('_'? [0-9])* [eE] [+-]? [0-9] ('_'? [0-9])*
	| '.' [0-9] ('_'? [0-9])*
	| [0-9] ('_'? [0-9])* [eE] [+-]? [0-9] ('_'? [0-9])*;

INTEGER: '0' | [1-9] ('_'? [0-9])* | [0-9]+;

// ============================================================================ 5. Strings &
// Template Literals (with line continuation)
// ============================================================================

STRING:
	'"' (~["\\\r\n] | '\\' ('\r\n' | '\r' | '\n') | '\\' .)* '"'
	| '\'' (~['\\\r\n] | '\\' ('\r\n' | '\r' | '\n') | '\\' .)* '\'';

TEMPLATE_LITERAL: '`' ( '\\' . | ~[`\\])* '`';

// ============================================================================ 6. Operators and
// Punctuators ============================================================================

ARROW: '=>';
STRICT_EQ: '===';
STRICT_NEQ: '!==';
EQ: '==';
NEQ: '!=';
GTE: '>=';
LTE: '<=';
GT: '>';
LT: '<';

NULLISH: '??';
AND: '&&';
OR: '||';
NOT: '!';

INCREMENT: '++';
DECREMENT: '--';
PLUS_ASSIGN: '+=';
MINUS_ASSIGN: '-=';
MULT_ASSIGN: '*=';
DIV_ASSIGN: '/=';
MOD_ASSIGN: '%=';
ASSIGN: '=';

PLUS: '+';
MINUS: '-';
MULT: '*';
DIV: '/';
MOD: '%';

SEMI: ';';
COMMA: ',';
DOT: '.';
COLON: ':';

LPAREN: '(';
RPAREN: ')';
LBRACE: '{';
RBRACE: '}';
LBRACK: '[';
RBRACK: ']';

// ============================================================================ 7. Comments &
// Whitespace ============================================================================

LINE_COMMENT: '//' ~[\r\n]* -> skip;
BLOCK_COMMENT: '/*' .*? '*/' -> skip;
WS: [ \t\r\n]+ -> skip;
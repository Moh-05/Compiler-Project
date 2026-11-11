lexer grammar SimpleLexer;


tokens { STRING, TEMPLATE_LITERAL }


// 1. القواعد العامة (الطور الافتراضي DEFAULT_MODE)



SingleLineComment : '//' ~[\r\n]* ;
MultiLineComment  : '/*' .*? '*/' ;


Break      : 'break' ;      Case       : 'case' ;       Catch      : 'catch' ;
Class      : 'class' ;      Const      : 'const' ;      Continue   : 'continue' ;
Default    : 'default' ;    Delete     : 'delete' ;     Do         : 'do' ;
Else       : 'else' ;       Export     : 'export' ;     Extends    : 'extends' ;
Finally    : 'finally' ;    For        : 'for' ;        Function   : 'function' ;
If         : 'if' ;         Import     : 'import' ;     In         : 'in' ;
Instanceof : 'instanceof' ; New        : 'new' ;        Return     : 'return' ;
Super      : 'super' ;      Switch     : 'switch' ;     This       : 'this' ;
Throw      : 'throw' ;      Try        : 'try' ;        Typeof     : 'typeof' ;
Var        : 'var' ;        Void       : 'void' ;       While      : 'while' ;
Let        : 'let' ;        Async      : 'async' ;      Await      : 'await' ;
Yield      : 'yield' ;      Null       : 'null' ;       Undefined  : 'undefined' ;


BooleanLiteral : 'true' | 'false' ;

// ---- الأرقام (Numbers: BIGINT, HEX_NUMBER, OCTAL_NUMBER, FLOAT, INTEGER)
BIGINT       : ( [0-9]+ | '0' [xX] [0-9a-fA-F]+ | '0' [oO]? [0-7]+ ) 'n' ;
HEX_NUMBER   : '0' [xX] [0-9a-fA-F]+ ;
OCTAL_NUMBER : '0' [oO]? [0-7]+ ;
FLOAT        : [0-9]+ '.' [0-9]* ([eE] [+-]? [0-9]+)?
             | '.' [0-9]+ ([eE] [+-]? [0-9]+)?
             | [0-9]+ [eE] [+-]? [0-9]+ ;
INTEGER      : '0' | [1-9] [0-9]* ;


Identifier : [a-zA-Z_$][a-zA-Z0-9_$]* ;


Assign : '=' ;          Equals : '==' ;         StrictEquals : '===' ;
Not : '!' ;             NotEquals : '!=' ;      StrictNotEquals : '!==' ;
Lt : '<' ;              Gt : '>' ;              Le : '<=' ;             Ge : '>=' ;
Plus : '+' ;            Minus : '-' ;           Multiply : '*' ;        Divide : '/' ;
Modulus : '%' ;         Increment : '++' ;      Decrement : '--' ;
And : '&&' ;            Or : '||' ;             Arrow : '=>' ;


OpenParen : '(' ;       CloseParen : ')' ;      OpenBracket : '[' ;     CloseBracket : ']' ;
OpenBrace : '{' ;       CloseBrace : '}' ;      SemiColon : ';' ;       Comma : ',' ;
Dot : '.' ;             Colon : ':' ;           QuestionMark : '?' ;    Ellipsis : '...' ;


DBL_STRING_START : '"'  -> more, mode(DBL_STR_MODE) ;
SGL_STRING_START : '\'' -> more, mode(SGL_STR_MODE) ;
TEMPLATE_START   : '`'  -> more, mode(TEMPLATE_MODE) ;


WS : [ \t\r\n]+ -> skip ;



// 2. طور النصوص المزدوجة "..." (DBL_STR_MODE)
// يقبل علامة ' بداخله دون هروب، ويعالج محارف الهروب واستمرار السطر

mode DBL_STR_MODE;

    DBL_LINE_CONT : '\\' '\r'? '\n' -> more ;

    DBL_ESCAPE    : '\\' ~[\r\n]    -> more ;

    DBL_TEXT      : ~["\\\r\n]+     -> more ;

    DBL_STRING_END : '"' -> type(STRING), mode(DEFAULT_MODE) ;


// 3. طور النصوص المفردة '...' (SGL_STR_MODE)
// يقبل علامة " بداخله دون هروب، ويعالج محارف الهروب واستمرار السطر

mode SGL_STR_MODE;

    SGL_LINE_CONT : '\\' '\r'? '\n' -> more ;

    SGL_ESCAPE    : '\\' ~[\r\n]    -> more ;

    SGL_TEXT      : ~['\\\r\n]+     -> more ;

    SGL_STRING_END : '\'' -> type(STRING), mode(DEFAULT_MODE) ;



// 4. طور النصوص متعددة الأسطر `...` (TEMPLATE_MODE)

mode TEMPLATE_MODE;

    TMPL_ESCAPE : '\\' .  -> more ;

    TMPL_TEXT   : ~[`\\]+ -> more ;

    TEMPLATE_END : '`' -> type(TEMPLATE_LITERAL), mode(DEFAULT_MODE) ;
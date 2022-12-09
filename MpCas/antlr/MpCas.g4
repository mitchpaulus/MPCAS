grammar MpCas;

INTEGER : [0-9]+;

SYMBOL : [a-zA-Z0-9_]+;

PLUS : '+';
MINUS : '-';

TIMES : '*';
DIVIDE : '/';

LPAREN : '(';
RPAREN : ')';
COLON : ':';

EQUALS : '=';

CARET : '^';

WS : [ ]+ -> skip;

namedEquation : SYMBOL COLON expression;

equation : expression EQUALS expression;

expression
    : expression CARET INTEGER # Exponent
    | expression (TIMES|DIVIDE) expression # Term
    | expression (PLUS|MINUS) expression # Sum
    | LPAREN expression RPAREN # Parens
    | SYMBOL # Symbol
    ;

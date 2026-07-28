grammar Shared;

attrPath: ATTR_NAME attrPathSfx?;

attrPathSfx: LSQB NUM RSQB attrPathSfx? | DOT attrPath;

AND: 'AND';
OR: 'OR';
NOT: 'NOT';
CMP_OP: '=' | '<>' | '<' | '<=' | '>' | '>=';
LPAREN: '(';
RPAREN: ')';
LSQB: '[';
RSQB: ']';
DOT: '.';
COMMA: ',';
HASH: '#';
COLON: ':';

ATTR_NAME:
    [a-zA-Z] ([a-zA-Z0-9] [a-zA-Z0-9_]*)?
    | HASH [a-zA-Z0-9_]+;

ATTR_VAL: COLON [a-zA-Z0-9_]+;

NUM: [0-9]+;

WS: [\u0020\t]+ -> skip;
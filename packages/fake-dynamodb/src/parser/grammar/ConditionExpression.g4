grammar ConditionExpression;

import Shared;

condExpr: orExpr EOF;

orExpr: andExpr (OR orExpr)*;

andExpr: notExpr (AND andExpr)*;

notExpr: NOT notExpr | atomBoolExpr;

atomBoolExpr:
    LPAREN orExpr RPAREN
    | boolFunc
    | betweenExpr
    | inExpr
    | cmpExpr;

boolFunc:
    'attribute_exists' LPAREN attrPath RPAREN
    | 'attribute_not_exists' LPAREN attrPath RPAREN
    | 'attribute_type' LPAREN attrPath COMMA ATTR_VAL RPAREN
    | 'begins_with' LPAREN attrPath COMMA ATTR_VAL RPAREN
    | 'contains' LPAREN attrPath COMMA ATTR_VAL RPAREN;

betweenExpr: numVal 'BETWEEN' numVal 'AND' numVal;

inExpr: numVal 'IN' LPAREN numVal (COMMA numVal)* RPAREN;

cmpExpr: numExpr CMP_OP numExpr;

numExpr: numFunc | numVal;

numFunc: 'size' LPAREN attrPath RPAREN;

numVal: attrPath | ATTR_VAL;
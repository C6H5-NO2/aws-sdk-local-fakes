grammar UpdateExpression;

import Shared;

updateExpr: updateAction+ EOF;

updateAction:
    'SET' setAction (COMMA setAction)*
    | 'REMOVE' removeAction (COMMA removeAction)*
    | 'ADD' addAction (COMMA addAction)*
    | 'DELETE' deleteAction (COMMA deleteAction)*;

setAction: attrPath '=' setExpr;

setExpr:
    'list_append' LPAREN setOprand COMMA setOprand RPAREN
    | setOprand
    | setOprand '+' setOprand
    | setOprand '-' setOprand;

setOprand:
    'if_not_exists' LPAREN attrPath COMMA ATTR_VAL RPAREN
    | attrPath
    | ATTR_VAL;

removeAction: attrPath;

addAction: attrPath ATTR_VAL;

deleteAction: attrPath ATTR_VAL;
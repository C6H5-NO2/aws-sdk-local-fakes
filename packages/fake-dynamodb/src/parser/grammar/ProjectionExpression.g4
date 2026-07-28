grammar ProjectionExpression;

import Shared;

projExpr: attrPath (COMMA attrPath)* EOF;
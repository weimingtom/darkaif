lexer grammar Internalactionscript3;
@header {
package org.xtext.actionscript.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

T11 : 'import' ;
T12 : ';' ;
T13 : 'public' ;
T14 : 'private' ;
T15 : 'class' ;
T16 : 'extends' ;
T17 : '{' ;
T18 : '}' ;
T19 : 'function' ;
T20 : '(' ;
T21 : ')' ;
T22 : 'var' ;
T23 : ':' ;
T24 : 'unit' ;
T25 : '=' ;
T26 : '0x000000' ;
T27 : 'String' ;
T28 : '' ;
T29 : 'int' ;
T30 : '0' ;
T31 : 'Number' ;

// $ANTLR src "../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g" 930
RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

// $ANTLR src "../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g" 932
RULE_INT : ('0'..'9')+;

// $ANTLR src "../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g" 934
RULE_STRING : ('"' ('\\' ('b'|'t'|'n'|'f'|'r'|'"'|'\''|'\\')|~(('\\'|'"')))* '"'|'\'' ('\\' ('b'|'t'|'n'|'f'|'r'|'"'|'\''|'\\')|~(('\\'|'\'')))* '\'');

// $ANTLR src "../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g" 936
RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

// $ANTLR src "../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g" 938
RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

// $ANTLR src "../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g" 940
RULE_WS : (' '|'\t'|'\r'|'\n')+;

// $ANTLR src "../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g" 942
RULE_ANY_OTHER : .;



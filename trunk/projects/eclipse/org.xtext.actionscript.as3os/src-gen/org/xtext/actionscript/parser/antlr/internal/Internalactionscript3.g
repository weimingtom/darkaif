/*
* generated by Xtext
*/
grammar Internalactionscript3;

options {
	superClass=AbstractInternalAntlrParser;
	
}

@lexer::header {
package org.xtext.actionscript.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

@parser::header {
package org.xtext.actionscript.parser.antlr.internal; 

import java.io.InputStream;
import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.xtext.parsetree.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.AbstractInternalAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.antlr.AntlrDatatypeRuleToken;
import org.eclipse.xtext.conversion.ValueConverterException;
import org.xtext.actionscript.services.actionscript3GrammarAccess;

}

@parser::members {
 
 	private actionscript3GrammarAccess grammarAccess;
 	
    public Internalactionscript3Parser(TokenStream input, IAstFactory factory, actionscript3GrammarAccess grammarAccess) {
        this(input);
        this.factory = factory;
        registerRules(grammarAccess.getGrammar());
        this.grammarAccess = grammarAccess;
    }
    
    @Override
    protected InputStream getTokenFile() {
    	ClassLoader classLoader = getClass().getClassLoader();
    	return classLoader.getResourceAsStream("org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.tokens");
    }
    
    @Override
    protected String getFirstRuleName() {
    	return "Model";	
   	} 
}

@rulecatch { 
    catch (RecognitionException re) { 
        recover(input,re); 
        appendSkippedTokens();
    } 
}




// Entry rule entryRuleModel
entryRuleModel returns [EObject current=null] :
	{ currentNode = createCompositeNode(grammarAccess.getModelRule(), currentNode); }
	 iv_ruleModel=ruleModel 
	 { $current=$iv_ruleModel.current; } 
	 EOF 
;

// Rule Model
ruleModel returns [EObject current=null] 
    @init { EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
((	
	
	    
	    { 
	        currentNode=createCompositeNode(grammarAccess.getModelAccess().getImportsImportParserRuleCall_0_0(), currentNode); 
	    }
	    lv_imports_0=ruleImport 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getModelRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode.getParent(), $current);
	        }
	        
	        try {
	       		add($current, "imports", lv_imports_0, "Import", currentNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	        currentNode = currentNode.getParent();
	    }
	
)*(	
	
	    
	    { 
	        currentNode=createCompositeNode(grammarAccess.getModelAccess().getElementsTypeParserRuleCall_1_0(), currentNode); 
	    }
	    lv_elements_1=ruleType 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getModelRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode.getParent(), $current);
	        }
	        
	        try {
	       		add($current, "elements", lv_elements_1, "Type", currentNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	        currentNode = currentNode.getParent();
	    }
	
)*);





// Entry rule entryRuleImport
entryRuleImport returns [EObject current=null] :
	{ currentNode = createCompositeNode(grammarAccess.getImportRule(), currentNode); }
	 iv_ruleImport=ruleImport 
	 { $current=$iv_ruleImport.current; } 
	 EOF 
;

// Rule Import
ruleImport returns [EObject current=null] 
    @init { EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
('import' 
    {
        createLeafNode(grammarAccess.getImportAccess().getImportKeyword_0(), null); 
    }
(	
	
	    lv_importURI_1=	RULE_STRING
	{
		createLeafNode(grammarAccess.getImportAccess().getImportURISTRINGTerminalRuleCall_1_0(), "importURI"); 
	}
 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getImportRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
	        
	        try {
	       		set($current, "importURI", lv_importURI_1, "STRING", lastConsumedNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	    }
	
)';' 
    {
        createLeafNode(grammarAccess.getImportAccess().getSemicolonKeyword_2(), null); 
    }
);





// Entry rule entryRuleType
entryRuleType returns [EObject current=null] :
	{ currentNode = createCompositeNode(grammarAccess.getTypeRule(), currentNode); }
	 iv_ruleType=ruleType 
	 { $current=$iv_ruleType.current; } 
	 EOF 
;

// Rule Type
ruleType returns [EObject current=null] 
    @init { EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
(
    { 
        currentNode=createCompositeNode(grammarAccess.getTypeAccess().getPublicParserRuleCall_0(), currentNode); 
    }
    this_Public_0=rulePublic
    { 
        $current = $this_Public_0.current; 
        currentNode = currentNode.getParent();
    }

    |
    { 
        currentNode=createCompositeNode(grammarAccess.getTypeAccess().getPrivateParserRuleCall_1(), currentNode); 
    }
    this_Private_1=rulePrivate
    { 
        $current = $this_Private_1.current; 
        currentNode = currentNode.getParent();
    }
);





// Entry rule entryRuleProperty
entryRuleProperty returns [EObject current=null] :
	{ currentNode = createCompositeNode(grammarAccess.getPropertyRule(), currentNode); }
	 iv_ruleProperty=ruleProperty 
	 { $current=$iv_ruleProperty.current; } 
	 EOF 
;

// Rule Property
ruleProperty returns [EObject current=null] 
    @init { EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
(
    { 
        currentNode=createCompositeNode(grammarAccess.getPropertyAccess().getVariablesParserRuleCall_0(), currentNode); 
    }
    this_Variables_0=ruleVariables
    { 
        $current = $this_Variables_0.current; 
        currentNode = currentNode.getParent();
    }

    |
    { 
        currentNode=createCompositeNode(grammarAccess.getPropertyAccess().getFunctionParserRuleCall_1(), currentNode); 
    }
    this_Function_1=ruleFunction
    { 
        $current = $this_Function_1.current; 
        currentNode = currentNode.getParent();
    }
);





// Entry rule entryRulePublic
entryRulePublic returns [EObject current=null] :
	{ currentNode = createCompositeNode(grammarAccess.getPublicRule(), currentNode); }
	 iv_rulePublic=rulePublic 
	 { $current=$iv_rulePublic.current; } 
	 EOF 
;

// Rule Public
rulePublic returns [EObject current=null] 
    @init { EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
(('public' 
    {
        createLeafNode(grammarAccess.getPublicAccess().getPublicKeyword_0_0(), null); 
    }

    { 
        currentNode=createCompositeNode(grammarAccess.getPublicAccess().getClassParserRuleCall_0_1(), currentNode); 
    }
    this_Class_1=ruleClass
    { 
        $current = $this_Class_1.current; 
        currentNode = currentNode.getParent();
    }
)
    |('public' 
    {
        createLeafNode(grammarAccess.getPublicAccess().getPublicKeyword_1_0(), null); 
    }

    { 
        currentNode=createCompositeNode(grammarAccess.getPublicAccess().getFunctionParserRuleCall_1_1(), currentNode); 
    }
    this_Function_3=ruleFunction
    { 
        $current = $this_Function_3.current; 
        currentNode = currentNode.getParent();
    }
)
    |('public' 
    {
        createLeafNode(grammarAccess.getPublicAccess().getPublicKeyword_2_0(), null); 
    }

    { 
        currentNode=createCompositeNode(grammarAccess.getPublicAccess().getVariablesParserRuleCall_2_1(), currentNode); 
    }
    this_Variables_5=ruleVariables
    { 
        $current = $this_Variables_5.current; 
        currentNode = currentNode.getParent();
    }
));





// Entry rule entryRulePrivate
entryRulePrivate returns [EObject current=null] :
	{ currentNode = createCompositeNode(grammarAccess.getPrivateRule(), currentNode); }
	 iv_rulePrivate=rulePrivate 
	 { $current=$iv_rulePrivate.current; } 
	 EOF 
;

// Rule Private
rulePrivate returns [EObject current=null] 
    @init { EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
(('private' 
    {
        createLeafNode(grammarAccess.getPrivateAccess().getPrivateKeyword_0_0(), null); 
    }

    { 
        currentNode=createCompositeNode(grammarAccess.getPrivateAccess().getClassParserRuleCall_0_1(), currentNode); 
    }
    this_Class_1=ruleClass
    { 
        $current = $this_Class_1.current; 
        currentNode = currentNode.getParent();
    }
)
    |('private' 
    {
        createLeafNode(grammarAccess.getPrivateAccess().getPrivateKeyword_1_0(), null); 
    }

    { 
        currentNode=createCompositeNode(grammarAccess.getPrivateAccess().getFunctionParserRuleCall_1_1(), currentNode); 
    }
    this_Function_3=ruleFunction
    { 
        $current = $this_Function_3.current; 
        currentNode = currentNode.getParent();
    }
)
    |('private' 
    {
        createLeafNode(grammarAccess.getPrivateAccess().getPrivateKeyword_2_0(), null); 
    }

    { 
        currentNode=createCompositeNode(grammarAccess.getPrivateAccess().getVariablesParserRuleCall_2_1(), currentNode); 
    }
    this_Variables_5=ruleVariables
    { 
        $current = $this_Variables_5.current; 
        currentNode = currentNode.getParent();
    }
));





// Entry rule entryRuleClass
entryRuleClass returns [EObject current=null] :
	{ currentNode = createCompositeNode(grammarAccess.getClassRule(), currentNode); }
	 iv_ruleClass=ruleClass 
	 { $current=$iv_ruleClass.current; } 
	 EOF 
;

// Rule Class
ruleClass returns [EObject current=null] 
    @init { EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
('class' 
    {
        createLeafNode(grammarAccess.getClassAccess().getClassKeyword_0(), null); 
    }
(	
	
	    lv_name_1=	RULE_ID
	{
		createLeafNode(grammarAccess.getClassAccess().getNameIDTerminalRuleCall_1_0(), "name"); 
	}
 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getClassRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
	        
	        try {
	       		set($current, "name", lv_name_1, "ID", lastConsumedNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	    }
	
)('extends' 
    {
        createLeafNode(grammarAccess.getClassAccess().getExtendsKeyword_2_0(), null); 
    }
(	
	
		
		{
			if ($current==null) {
	            $current = factory.create(grammarAccess.getClassRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
        }
	RULE_ID
	{
		createLeafNode(grammarAccess.getClassAccess().getSuperClassClassCrossReference_2_1_0(), "superClass"); 
	}

		// TODO assign feature to currentNode
	
))?'{' 
    {
        createLeafNode(grammarAccess.getClassAccess().getLeftCurlyBracketKeyword_3(), null); 
    }
(	
	
	    
	    { 
	        currentNode=createCompositeNode(grammarAccess.getClassAccess().getPropertiesPropertyParserRuleCall_4_0(), currentNode); 
	    }
	    lv_properties_5=ruleProperty 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getClassRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode.getParent(), $current);
	        }
	        
	        try {
	       		add($current, "properties", lv_properties_5, "Property", currentNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	        currentNode = currentNode.getParent();
	    }
	
)*'}' 
    {
        createLeafNode(grammarAccess.getClassAccess().getRightCurlyBracketKeyword_5(), null); 
    }
);





// Entry rule entryRuleFunction
entryRuleFunction returns [EObject current=null] :
	{ currentNode = createCompositeNode(grammarAccess.getFunctionRule(), currentNode); }
	 iv_ruleFunction=ruleFunction 
	 { $current=$iv_ruleFunction.current; } 
	 EOF 
;

// Rule Function
ruleFunction returns [EObject current=null] 
    @init { EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
('function' 
    {
        createLeafNode(grammarAccess.getFunctionAccess().getFunctionKeyword_0(), null); 
    }
(	
	
	    lv_name_1=	RULE_ID
	{
		createLeafNode(grammarAccess.getFunctionAccess().getNameIDTerminalRuleCall_1_0(), "name"); 
	}
 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getFunctionRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
	        
	        try {
	       		set($current, "name", lv_name_1, "ID", lastConsumedNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	    }
	
)'(' 
    {
        createLeafNode(grammarAccess.getFunctionAccess().getLeftParenthesisKeyword_2(), null); 
    }
')' 
    {
        createLeafNode(grammarAccess.getFunctionAccess().getRightParenthesisKeyword_3(), null); 
    }
'{' 
    {
        createLeafNode(grammarAccess.getFunctionAccess().getLeftCurlyBracketKeyword_4(), null); 
    }
'}' 
    {
        createLeafNode(grammarAccess.getFunctionAccess().getRightCurlyBracketKeyword_5(), null); 
    }
);





// Entry rule entryRuleVariables
entryRuleVariables returns [EObject current=null] :
	{ currentNode = createCompositeNode(grammarAccess.getVariablesRule(), currentNode); }
	 iv_ruleVariables=ruleVariables 
	 { $current=$iv_ruleVariables.current; } 
	 EOF 
;

// Rule Variables
ruleVariables returns [EObject current=null] 
    @init { EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
(('var' 
    {
        createLeafNode(grammarAccess.getVariablesAccess().getVarKeyword_0_0(), null); 
    }

    { 
        currentNode=createCompositeNode(grammarAccess.getVariablesAccess().getUNITParserRuleCall_0_1(), currentNode); 
    }
    this_UNIT_1=ruleUNIT
    { 
        $current = $this_UNIT_1.current; 
        currentNode = currentNode.getParent();
    }
)
    |('var' 
    {
        createLeafNode(grammarAccess.getVariablesAccess().getVarKeyword_1_0(), null); 
    }

    { 
        currentNode=createCompositeNode(grammarAccess.getVariablesAccess().get_StringParserRuleCall_1_1(), currentNode); 
    }
    this__String_3=rule_String
    { 
        $current = $this__String_3.current; 
        currentNode = currentNode.getParent();
    }
)
    |('var' 
    {
        createLeafNode(grammarAccess.getVariablesAccess().getVarKeyword_2_0(), null); 
    }

    { 
        currentNode=createCompositeNode(grammarAccess.getVariablesAccess().get_intParserRuleCall_2_1(), currentNode); 
    }
    this__int_5=rule_int
    { 
        $current = $this__int_5.current; 
        currentNode = currentNode.getParent();
    }
)
    |('var' 
    {
        createLeafNode(grammarAccess.getVariablesAccess().getVarKeyword_3_0(), null); 
    }

    { 
        currentNode=createCompositeNode(grammarAccess.getVariablesAccess().getNumberParserRuleCall_3_1(), currentNode); 
    }
    this_number_7=rulenumber
    { 
        $current = $this_number_7.current; 
        currentNode = currentNode.getParent();
    }
));





// Entry rule entryRuleUNIT
entryRuleUNIT returns [EObject current=null] :
	{ currentNode = createCompositeNode(grammarAccess.getUNITRule(), currentNode); }
	 iv_ruleUNIT=ruleUNIT 
	 { $current=$iv_ruleUNIT.current; } 
	 EOF 
;

// Rule UNIT
ruleUNIT returns [EObject current=null] 
    @init { EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
((	
	
	    lv_Name_0=	RULE_ID
	{
		createLeafNode(grammarAccess.getUNITAccess().getNameIDTerminalRuleCall_0_0(), "Name"); 
	}
 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getUNITRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
	        
	        try {
	       		set($current, "Name", lv_Name_0, "ID", lastConsumedNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	    }
	
)':' 
    {
        createLeafNode(grammarAccess.getUNITAccess().getColonKeyword_1(), null); 
    }
'unit' 
    {
        createLeafNode(grammarAccess.getUNITAccess().getUnitKeyword_2(), null); 
    }
('=' 
    {
        createLeafNode(grammarAccess.getUNITAccess().getEqualsSignKeyword_3_0(), null); 
    }
(	
	
	    lv_String_4='0x000000' 
    {
        createLeafNode(grammarAccess.getUNITAccess().getString0x000000Keyword_3_1_0(), "String"); 
    }

 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getUNITRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
	        
	        try {
	       		set($current, "String", /* lv_String_4 */ input.LT(-1), "0x000000", lastConsumedNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	    }
	
))?';' 
    {
        createLeafNode(grammarAccess.getUNITAccess().getSemicolonKeyword_4(), null); 
    }
);





// Entry rule entryRule_String
entryRule_String returns [EObject current=null] :
	{ currentNode = createCompositeNode(grammarAccess.get_StringRule(), currentNode); }
	 iv_rule_String=rule_String 
	 { $current=$iv_rule_String.current; } 
	 EOF 
;

// Rule _String
rule_String returns [EObject current=null] 
    @init { EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
((	
	
	    lv_Name_0=	RULE_ID
	{
		createLeafNode(grammarAccess.get_StringAccess().getNameIDTerminalRuleCall_0_0(), "Name"); 
	}
 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.get_StringRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
	        
	        try {
	       		set($current, "Name", lv_Name_0, "ID", lastConsumedNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	    }
	
)':' 
    {
        createLeafNode(grammarAccess.get_StringAccess().getColonKeyword_1(), null); 
    }
'String' 
    {
        createLeafNode(grammarAccess.get_StringAccess().getStringKeyword_2(), null); 
    }
('=' 
    {
        createLeafNode(grammarAccess.get_StringAccess().getEqualsSignKeyword_3_0(), null); 
    }
(	
	
	    lv_String_4='' 
    {
        createLeafNode(grammarAccess.get_StringAccess().getStringKeyword_3_1_0(), "String"); 
    }

 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.get_StringRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
	        
	        try {
	       		set($current, "String", /* lv_String_4 */ input.LT(-1), "", lastConsumedNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	    }
	
)?)?';' 
    {
        createLeafNode(grammarAccess.get_StringAccess().getSemicolonKeyword_4(), null); 
    }
);





// Entry rule entryRule_int
entryRule_int returns [EObject current=null] :
	{ currentNode = createCompositeNode(grammarAccess.get_intRule(), currentNode); }
	 iv_rule_int=rule_int 
	 { $current=$iv_rule_int.current; } 
	 EOF 
;

// Rule _int
rule_int returns [EObject current=null] 
    @init { EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
((	
	
	    lv_Name_0=	RULE_ID
	{
		createLeafNode(grammarAccess.get_intAccess().getNameIDTerminalRuleCall_0_0(), "Name"); 
	}
 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.get_intRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
	        
	        try {
	       		set($current, "Name", lv_Name_0, "ID", lastConsumedNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	    }
	
)':' 
    {
        createLeafNode(grammarAccess.get_intAccess().getColonKeyword_1(), null); 
    }
'int' 
    {
        createLeafNode(grammarAccess.get_intAccess().getIntKeyword_2(), null); 
    }
('=' 
    {
        createLeafNode(grammarAccess.get_intAccess().getEqualsSignKeyword_3_0(), null); 
    }
(	
	
	    lv_int_4='0' 
    {
        createLeafNode(grammarAccess.get_intAccess().getInt0Keyword_3_1_0(), "int"); 
    }

 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.get_intRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
	        
	        try {
	       		set($current, "int", /* lv_int_4 */ input.LT(-1), "0", lastConsumedNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	    }
	
))?';' 
    {
        createLeafNode(grammarAccess.get_intAccess().getSemicolonKeyword_4(), null); 
    }
);





// Entry rule entryRulenumber
entryRulenumber returns [EObject current=null] :
	{ currentNode = createCompositeNode(grammarAccess.getNumberRule(), currentNode); }
	 iv_rulenumber=rulenumber 
	 { $current=$iv_rulenumber.current; } 
	 EOF 
;

// Rule number
rulenumber returns [EObject current=null] 
    @init { EObject temp=null; setCurrentLookahead(); resetLookahead(); 
    }
    @after { resetLookahead(); 
    	lastConsumedNode = currentNode;
    }:
((	
	
	    lv_Name_0=	RULE_ID
	{
		createLeafNode(grammarAccess.getNumberAccess().getNameIDTerminalRuleCall_0_0(), "Name"); 
	}
 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getNumberRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
	        
	        try {
	       		set($current, "Name", lv_Name_0, "ID", lastConsumedNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	    }
	
)':' 
    {
        createLeafNode(grammarAccess.getNumberAccess().getColonKeyword_1(), null); 
    }
'Number' 
    {
        createLeafNode(grammarAccess.getNumberAccess().getNumberKeyword_2(), null); 
    }
('=' 
    {
        createLeafNode(grammarAccess.getNumberAccess().getEqualsSignKeyword_3_0(), null); 
    }
(	
	
	    lv_double_4='0' 
    {
        createLeafNode(grammarAccess.getNumberAccess().getDouble0Keyword_3_1_0(), "double"); 
    }

 
	    {
	        if ($current==null) {
	            $current = factory.create(grammarAccess.getNumberRule().getType().getClassifier());
	            associateNodeWithAstElement(currentNode, $current);
	        }
	        
	        try {
	       		set($current, "double", /* lv_double_4 */ input.LT(-1), "0", lastConsumedNode);
	        } catch (ValueConverterException vce) {
				handleValueConverterException(vce);
	        }
	    }
	
))?';' 
    {
        createLeafNode(grammarAccess.getNumberAccess().getSemicolonKeyword_4(), null); 
    }
);





RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' ('b'|'t'|'n'|'f'|'r'|'"'|'\''|'\\')|~(('\\'|'"')))* '"'|'\'' ('\\' ('b'|'t'|'n'|'f'|'r'|'"'|'\''|'\\')|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;


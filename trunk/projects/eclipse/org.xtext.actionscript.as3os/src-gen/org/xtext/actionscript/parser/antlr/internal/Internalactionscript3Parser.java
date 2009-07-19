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



import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class Internalactionscript3Parser extends AbstractInternalAntlrParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "RULE_STRING", "RULE_ID", "RULE_INT", "RULE_ML_COMMENT", "RULE_SL_COMMENT", "RULE_WS", "RULE_ANY_OTHER", "'import'", "';'", "'public'", "'private'", "'class'", "'extends'", "'{'", "'}'", "'function'", "'('", "')'", "'var'", "':'", "'unit'", "'='", "'0x000000'", "'String'", "''", "'int'", "'0'", "'Number'"
    };
    public static final int RULE_ID=5;
    public static final int RULE_STRING=4;
    public static final int RULE_ANY_OTHER=10;
    public static final int RULE_INT=6;
    public static final int RULE_WS=9;
    public static final int RULE_SL_COMMENT=8;
    public static final int EOF=-1;
    public static final int RULE_ML_COMMENT=7;

        public Internalactionscript3Parser(TokenStream input) {
            super(input);
        }
        

    public String[] getTokenNames() { return tokenNames; }
    public String getGrammarFileName() { return "../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g"; }


     
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



    // $ANTLR start entryRuleModel
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:72:1: entryRuleModel returns [EObject current=null] : iv_ruleModel= ruleModel EOF ;
    public final EObject entryRuleModel() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleModel = null;


        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:72:47: (iv_ruleModel= ruleModel EOF )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:73:2: iv_ruleModel= ruleModel EOF
            {
             currentNode = createCompositeNode(grammarAccess.getModelRule(), currentNode); 
            pushFollow(FOLLOW_ruleModel_in_entryRuleModel73);
            iv_ruleModel=ruleModel();
            _fsp--;

             current =iv_ruleModel; 
            match(input,EOF,FOLLOW_EOF_in_entryRuleModel83); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end entryRuleModel


    // $ANTLR start ruleModel
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:80:1: ruleModel returns [EObject current=null] : ( (lv_imports_0= ruleImport )* (lv_elements_1= ruleType )* ) ;
    public final EObject ruleModel() throws RecognitionException {
        EObject current = null;

        EObject lv_imports_0 = null;

        EObject lv_elements_1 = null;


         EObject temp=null; setCurrentLookahead(); resetLookahead(); 
            
        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:85:6: ( ( (lv_imports_0= ruleImport )* (lv_elements_1= ruleType )* ) )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:86:1: ( (lv_imports_0= ruleImport )* (lv_elements_1= ruleType )* )
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:86:1: ( (lv_imports_0= ruleImport )* (lv_elements_1= ruleType )* )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:86:2: (lv_imports_0= ruleImport )* (lv_elements_1= ruleType )*
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:86:2: (lv_imports_0= ruleImport )*
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);

                if ( (LA1_0==11) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:89:6: lv_imports_0= ruleImport
            	    {
            	     
            	    	        currentNode=createCompositeNode(grammarAccess.getModelAccess().getImportsImportParserRuleCall_0_0(), currentNode); 
            	    	    
            	    pushFollow(FOLLOW_ruleImport_in_ruleModel142);
            	    lv_imports_0=ruleImport();
            	    _fsp--;


            	    	        if (current==null) {
            	    	            current = factory.create(grammarAccess.getModelRule().getType().getClassifier());
            	    	            associateNodeWithAstElement(currentNode.getParent(), current);
            	    	        }
            	    	        
            	    	        try {
            	    	       		add(current, "imports", lv_imports_0, "Import", currentNode);
            	    	        } catch (ValueConverterException vce) {
            	    				handleValueConverterException(vce);
            	    	        }
            	    	        currentNode = currentNode.getParent();
            	    	    

            	    }
            	    break;

            	default :
            	    break loop1;
                }
            } while (true);

            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:107:3: (lv_elements_1= ruleType )*
            loop2:
            do {
                int alt2=2;
                int LA2_0 = input.LA(1);

                if ( ((LA2_0>=13 && LA2_0<=14)) ) {
                    alt2=1;
                }


                switch (alt2) {
            	case 1 :
            	    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:110:6: lv_elements_1= ruleType
            	    {
            	     
            	    	        currentNode=createCompositeNode(grammarAccess.getModelAccess().getElementsTypeParserRuleCall_1_0(), currentNode); 
            	    	    
            	    pushFollow(FOLLOW_ruleType_in_ruleModel181);
            	    lv_elements_1=ruleType();
            	    _fsp--;


            	    	        if (current==null) {
            	    	            current = factory.create(grammarAccess.getModelRule().getType().getClassifier());
            	    	            associateNodeWithAstElement(currentNode.getParent(), current);
            	    	        }
            	    	        
            	    	        try {
            	    	       		add(current, "elements", lv_elements_1, "Type", currentNode);
            	    	        } catch (ValueConverterException vce) {
            	    				handleValueConverterException(vce);
            	    	        }
            	    	        currentNode = currentNode.getParent();
            	    	    

            	    }
            	    break;

            	default :
            	    break loop2;
                }
            } while (true);


            }


            }

             resetLookahead(); 
                	lastConsumedNode = currentNode;
                
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end ruleModel


    // $ANTLR start entryRuleImport
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:135:1: entryRuleImport returns [EObject current=null] : iv_ruleImport= ruleImport EOF ;
    public final EObject entryRuleImport() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleImport = null;


        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:135:48: (iv_ruleImport= ruleImport EOF )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:136:2: iv_ruleImport= ruleImport EOF
            {
             currentNode = createCompositeNode(grammarAccess.getImportRule(), currentNode); 
            pushFollow(FOLLOW_ruleImport_in_entryRuleImport219);
            iv_ruleImport=ruleImport();
            _fsp--;

             current =iv_ruleImport; 
            match(input,EOF,FOLLOW_EOF_in_entryRuleImport229); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end entryRuleImport


    // $ANTLR start ruleImport
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:143:1: ruleImport returns [EObject current=null] : ( 'import' (lv_importURI_1= RULE_STRING ) ';' ) ;
    public final EObject ruleImport() throws RecognitionException {
        EObject current = null;

        Token lv_importURI_1=null;

         EObject temp=null; setCurrentLookahead(); resetLookahead(); 
            
        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:148:6: ( ( 'import' (lv_importURI_1= RULE_STRING ) ';' ) )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:149:1: ( 'import' (lv_importURI_1= RULE_STRING ) ';' )
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:149:1: ( 'import' (lv_importURI_1= RULE_STRING ) ';' )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:149:2: 'import' (lv_importURI_1= RULE_STRING ) ';'
            {
            match(input,11,FOLLOW_11_in_ruleImport263); 

                    createLeafNode(grammarAccess.getImportAccess().getImportKeyword_0(), null); 
                
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:153:1: (lv_importURI_1= RULE_STRING )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:155:6: lv_importURI_1= RULE_STRING
            {
            lv_importURI_1=(Token)input.LT(1);
            match(input,RULE_STRING,FOLLOW_RULE_STRING_in_ruleImport285); 

            		createLeafNode(grammarAccess.getImportAccess().getImportURISTRINGTerminalRuleCall_1_0(), "importURI"); 
            	

            	        if (current==null) {
            	            current = factory.create(grammarAccess.getImportRule().getType().getClassifier());
            	            associateNodeWithAstElement(currentNode, current);
            	        }
            	        
            	        try {
            	       		set(current, "importURI", lv_importURI_1, "STRING", lastConsumedNode);
            	        } catch (ValueConverterException vce) {
            				handleValueConverterException(vce);
            	        }
            	    

            }

            match(input,12,FOLLOW_12_in_ruleImport302); 

                    createLeafNode(grammarAccess.getImportAccess().getSemicolonKeyword_2(), null); 
                

            }


            }

             resetLookahead(); 
                	lastConsumedNode = currentNode;
                
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end ruleImport


    // $ANTLR start entryRuleType
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:184:1: entryRuleType returns [EObject current=null] : iv_ruleType= ruleType EOF ;
    public final EObject entryRuleType() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleType = null;


        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:184:46: (iv_ruleType= ruleType EOF )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:185:2: iv_ruleType= ruleType EOF
            {
             currentNode = createCompositeNode(grammarAccess.getTypeRule(), currentNode); 
            pushFollow(FOLLOW_ruleType_in_entryRuleType335);
            iv_ruleType=ruleType();
            _fsp--;

             current =iv_ruleType; 
            match(input,EOF,FOLLOW_EOF_in_entryRuleType345); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end entryRuleType


    // $ANTLR start ruleType
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:192:1: ruleType returns [EObject current=null] : (this_Public_0= rulePublic | this_Private_1= rulePrivate ) ;
    public final EObject ruleType() throws RecognitionException {
        EObject current = null;

        EObject this_Public_0 = null;

        EObject this_Private_1 = null;


         EObject temp=null; setCurrentLookahead(); resetLookahead(); 
            
        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:197:6: ( (this_Public_0= rulePublic | this_Private_1= rulePrivate ) )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:198:1: (this_Public_0= rulePublic | this_Private_1= rulePrivate )
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:198:1: (this_Public_0= rulePublic | this_Private_1= rulePrivate )
            int alt3=2;
            int LA3_0 = input.LA(1);

            if ( (LA3_0==13) ) {
                alt3=1;
            }
            else if ( (LA3_0==14) ) {
                alt3=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("198:1: (this_Public_0= rulePublic | this_Private_1= rulePrivate )", 3, 0, input);

                throw nvae;
            }
            switch (alt3) {
                case 1 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:199:5: this_Public_0= rulePublic
                    {
                     
                            currentNode=createCompositeNode(grammarAccess.getTypeAccess().getPublicParserRuleCall_0(), currentNode); 
                        
                    pushFollow(FOLLOW_rulePublic_in_ruleType392);
                    this_Public_0=rulePublic();
                    _fsp--;

                     
                            current = this_Public_0; 
                            currentNode = currentNode.getParent();
                        

                    }
                    break;
                case 2 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:209:5: this_Private_1= rulePrivate
                    {
                     
                            currentNode=createCompositeNode(grammarAccess.getTypeAccess().getPrivateParserRuleCall_1(), currentNode); 
                        
                    pushFollow(FOLLOW_rulePrivate_in_ruleType419);
                    this_Private_1=rulePrivate();
                    _fsp--;

                     
                            current = this_Private_1; 
                            currentNode = currentNode.getParent();
                        

                    }
                    break;

            }


            }

             resetLookahead(); 
                	lastConsumedNode = currentNode;
                
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end ruleType


    // $ANTLR start entryRuleProperty
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:224:1: entryRuleProperty returns [EObject current=null] : iv_ruleProperty= ruleProperty EOF ;
    public final EObject entryRuleProperty() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleProperty = null;


        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:224:50: (iv_ruleProperty= ruleProperty EOF )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:225:2: iv_ruleProperty= ruleProperty EOF
            {
             currentNode = createCompositeNode(grammarAccess.getPropertyRule(), currentNode); 
            pushFollow(FOLLOW_ruleProperty_in_entryRuleProperty451);
            iv_ruleProperty=ruleProperty();
            _fsp--;

             current =iv_ruleProperty; 
            match(input,EOF,FOLLOW_EOF_in_entryRuleProperty461); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end entryRuleProperty


    // $ANTLR start ruleProperty
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:232:1: ruleProperty returns [EObject current=null] : (this_Variables_0= ruleVariables | this_Function_1= ruleFunction ) ;
    public final EObject ruleProperty() throws RecognitionException {
        EObject current = null;

        EObject this_Variables_0 = null;

        EObject this_Function_1 = null;


         EObject temp=null; setCurrentLookahead(); resetLookahead(); 
            
        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:237:6: ( (this_Variables_0= ruleVariables | this_Function_1= ruleFunction ) )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:238:1: (this_Variables_0= ruleVariables | this_Function_1= ruleFunction )
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:238:1: (this_Variables_0= ruleVariables | this_Function_1= ruleFunction )
            int alt4=2;
            int LA4_0 = input.LA(1);

            if ( (LA4_0==22) ) {
                alt4=1;
            }
            else if ( (LA4_0==19) ) {
                alt4=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("238:1: (this_Variables_0= ruleVariables | this_Function_1= ruleFunction )", 4, 0, input);

                throw nvae;
            }
            switch (alt4) {
                case 1 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:239:5: this_Variables_0= ruleVariables
                    {
                     
                            currentNode=createCompositeNode(grammarAccess.getPropertyAccess().getVariablesParserRuleCall_0(), currentNode); 
                        
                    pushFollow(FOLLOW_ruleVariables_in_ruleProperty508);
                    this_Variables_0=ruleVariables();
                    _fsp--;

                     
                            current = this_Variables_0; 
                            currentNode = currentNode.getParent();
                        

                    }
                    break;
                case 2 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:249:5: this_Function_1= ruleFunction
                    {
                     
                            currentNode=createCompositeNode(grammarAccess.getPropertyAccess().getFunctionParserRuleCall_1(), currentNode); 
                        
                    pushFollow(FOLLOW_ruleFunction_in_ruleProperty535);
                    this_Function_1=ruleFunction();
                    _fsp--;

                     
                            current = this_Function_1; 
                            currentNode = currentNode.getParent();
                        

                    }
                    break;

            }


            }

             resetLookahead(); 
                	lastConsumedNode = currentNode;
                
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end ruleProperty


    // $ANTLR start entryRulePublic
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:264:1: entryRulePublic returns [EObject current=null] : iv_rulePublic= rulePublic EOF ;
    public final EObject entryRulePublic() throws RecognitionException {
        EObject current = null;

        EObject iv_rulePublic = null;


        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:264:48: (iv_rulePublic= rulePublic EOF )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:265:2: iv_rulePublic= rulePublic EOF
            {
             currentNode = createCompositeNode(grammarAccess.getPublicRule(), currentNode); 
            pushFollow(FOLLOW_rulePublic_in_entryRulePublic567);
            iv_rulePublic=rulePublic();
            _fsp--;

             current =iv_rulePublic; 
            match(input,EOF,FOLLOW_EOF_in_entryRulePublic577); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end entryRulePublic


    // $ANTLR start rulePublic
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:272:1: rulePublic returns [EObject current=null] : ( ( 'public' this_Class_1= ruleClass ) | ( 'public' this_Function_3= ruleFunction ) | ( 'public' this_Variables_5= ruleVariables ) ) ;
    public final EObject rulePublic() throws RecognitionException {
        EObject current = null;

        EObject this_Class_1 = null;

        EObject this_Function_3 = null;

        EObject this_Variables_5 = null;


         EObject temp=null; setCurrentLookahead(); resetLookahead(); 
            
        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:277:6: ( ( ( 'public' this_Class_1= ruleClass ) | ( 'public' this_Function_3= ruleFunction ) | ( 'public' this_Variables_5= ruleVariables ) ) )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:278:1: ( ( 'public' this_Class_1= ruleClass ) | ( 'public' this_Function_3= ruleFunction ) | ( 'public' this_Variables_5= ruleVariables ) )
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:278:1: ( ( 'public' this_Class_1= ruleClass ) | ( 'public' this_Function_3= ruleFunction ) | ( 'public' this_Variables_5= ruleVariables ) )
            int alt5=3;
            int LA5_0 = input.LA(1);

            if ( (LA5_0==13) ) {
                switch ( input.LA(2) ) {
                case 19:
                    {
                    alt5=2;
                    }
                    break;
                case 15:
                    {
                    alt5=1;
                    }
                    break;
                case 22:
                    {
                    alt5=3;
                    }
                    break;
                default:
                    NoViableAltException nvae =
                        new NoViableAltException("278:1: ( ( 'public' this_Class_1= ruleClass ) | ( 'public' this_Function_3= ruleFunction ) | ( 'public' this_Variables_5= ruleVariables ) )", 5, 1, input);

                    throw nvae;
                }

            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("278:1: ( ( 'public' this_Class_1= ruleClass ) | ( 'public' this_Function_3= ruleFunction ) | ( 'public' this_Variables_5= ruleVariables ) )", 5, 0, input);

                throw nvae;
            }
            switch (alt5) {
                case 1 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:278:2: ( 'public' this_Class_1= ruleClass )
                    {
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:278:2: ( 'public' this_Class_1= ruleClass )
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:278:3: 'public' this_Class_1= ruleClass
                    {
                    match(input,13,FOLLOW_13_in_rulePublic612); 

                            createLeafNode(grammarAccess.getPublicAccess().getPublicKeyword_0_0(), null); 
                        
                     
                            currentNode=createCompositeNode(grammarAccess.getPublicAccess().getClassParserRuleCall_0_1(), currentNode); 
                        
                    pushFollow(FOLLOW_ruleClass_in_rulePublic634);
                    this_Class_1=ruleClass();
                    _fsp--;

                     
                            current = this_Class_1; 
                            currentNode = currentNode.getParent();
                        

                    }


                    }
                    break;
                case 2 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:292:6: ( 'public' this_Function_3= ruleFunction )
                    {
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:292:6: ( 'public' this_Function_3= ruleFunction )
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:292:7: 'public' this_Function_3= ruleFunction
                    {
                    match(input,13,FOLLOW_13_in_rulePublic650); 

                            createLeafNode(grammarAccess.getPublicAccess().getPublicKeyword_1_0(), null); 
                        
                     
                            currentNode=createCompositeNode(grammarAccess.getPublicAccess().getFunctionParserRuleCall_1_1(), currentNode); 
                        
                    pushFollow(FOLLOW_ruleFunction_in_rulePublic672);
                    this_Function_3=ruleFunction();
                    _fsp--;

                     
                            current = this_Function_3; 
                            currentNode = currentNode.getParent();
                        

                    }


                    }
                    break;
                case 3 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:306:6: ( 'public' this_Variables_5= ruleVariables )
                    {
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:306:6: ( 'public' this_Variables_5= ruleVariables )
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:306:7: 'public' this_Variables_5= ruleVariables
                    {
                    match(input,13,FOLLOW_13_in_rulePublic688); 

                            createLeafNode(grammarAccess.getPublicAccess().getPublicKeyword_2_0(), null); 
                        
                     
                            currentNode=createCompositeNode(grammarAccess.getPublicAccess().getVariablesParserRuleCall_2_1(), currentNode); 
                        
                    pushFollow(FOLLOW_ruleVariables_in_rulePublic710);
                    this_Variables_5=ruleVariables();
                    _fsp--;

                     
                            current = this_Variables_5; 
                            currentNode = currentNode.getParent();
                        

                    }


                    }
                    break;

            }


            }

             resetLookahead(); 
                	lastConsumedNode = currentNode;
                
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end rulePublic


    // $ANTLR start entryRulePrivate
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:326:1: entryRulePrivate returns [EObject current=null] : iv_rulePrivate= rulePrivate EOF ;
    public final EObject entryRulePrivate() throws RecognitionException {
        EObject current = null;

        EObject iv_rulePrivate = null;


        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:326:49: (iv_rulePrivate= rulePrivate EOF )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:327:2: iv_rulePrivate= rulePrivate EOF
            {
             currentNode = createCompositeNode(grammarAccess.getPrivateRule(), currentNode); 
            pushFollow(FOLLOW_rulePrivate_in_entryRulePrivate743);
            iv_rulePrivate=rulePrivate();
            _fsp--;

             current =iv_rulePrivate; 
            match(input,EOF,FOLLOW_EOF_in_entryRulePrivate753); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end entryRulePrivate


    // $ANTLR start rulePrivate
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:334:1: rulePrivate returns [EObject current=null] : ( ( 'private' this_Class_1= ruleClass ) | ( 'private' this_Function_3= ruleFunction ) | ( 'private' this_Variables_5= ruleVariables ) ) ;
    public final EObject rulePrivate() throws RecognitionException {
        EObject current = null;

        EObject this_Class_1 = null;

        EObject this_Function_3 = null;

        EObject this_Variables_5 = null;


         EObject temp=null; setCurrentLookahead(); resetLookahead(); 
            
        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:339:6: ( ( ( 'private' this_Class_1= ruleClass ) | ( 'private' this_Function_3= ruleFunction ) | ( 'private' this_Variables_5= ruleVariables ) ) )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:340:1: ( ( 'private' this_Class_1= ruleClass ) | ( 'private' this_Function_3= ruleFunction ) | ( 'private' this_Variables_5= ruleVariables ) )
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:340:1: ( ( 'private' this_Class_1= ruleClass ) | ( 'private' this_Function_3= ruleFunction ) | ( 'private' this_Variables_5= ruleVariables ) )
            int alt6=3;
            int LA6_0 = input.LA(1);

            if ( (LA6_0==14) ) {
                switch ( input.LA(2) ) {
                case 19:
                    {
                    alt6=2;
                    }
                    break;
                case 22:
                    {
                    alt6=3;
                    }
                    break;
                case 15:
                    {
                    alt6=1;
                    }
                    break;
                default:
                    NoViableAltException nvae =
                        new NoViableAltException("340:1: ( ( 'private' this_Class_1= ruleClass ) | ( 'private' this_Function_3= ruleFunction ) | ( 'private' this_Variables_5= ruleVariables ) )", 6, 1, input);

                    throw nvae;
                }

            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("340:1: ( ( 'private' this_Class_1= ruleClass ) | ( 'private' this_Function_3= ruleFunction ) | ( 'private' this_Variables_5= ruleVariables ) )", 6, 0, input);

                throw nvae;
            }
            switch (alt6) {
                case 1 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:340:2: ( 'private' this_Class_1= ruleClass )
                    {
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:340:2: ( 'private' this_Class_1= ruleClass )
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:340:3: 'private' this_Class_1= ruleClass
                    {
                    match(input,14,FOLLOW_14_in_rulePrivate788); 

                            createLeafNode(grammarAccess.getPrivateAccess().getPrivateKeyword_0_0(), null); 
                        
                     
                            currentNode=createCompositeNode(grammarAccess.getPrivateAccess().getClassParserRuleCall_0_1(), currentNode); 
                        
                    pushFollow(FOLLOW_ruleClass_in_rulePrivate810);
                    this_Class_1=ruleClass();
                    _fsp--;

                     
                            current = this_Class_1; 
                            currentNode = currentNode.getParent();
                        

                    }


                    }
                    break;
                case 2 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:354:6: ( 'private' this_Function_3= ruleFunction )
                    {
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:354:6: ( 'private' this_Function_3= ruleFunction )
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:354:7: 'private' this_Function_3= ruleFunction
                    {
                    match(input,14,FOLLOW_14_in_rulePrivate826); 

                            createLeafNode(grammarAccess.getPrivateAccess().getPrivateKeyword_1_0(), null); 
                        
                     
                            currentNode=createCompositeNode(grammarAccess.getPrivateAccess().getFunctionParserRuleCall_1_1(), currentNode); 
                        
                    pushFollow(FOLLOW_ruleFunction_in_rulePrivate848);
                    this_Function_3=ruleFunction();
                    _fsp--;

                     
                            current = this_Function_3; 
                            currentNode = currentNode.getParent();
                        

                    }


                    }
                    break;
                case 3 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:368:6: ( 'private' this_Variables_5= ruleVariables )
                    {
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:368:6: ( 'private' this_Variables_5= ruleVariables )
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:368:7: 'private' this_Variables_5= ruleVariables
                    {
                    match(input,14,FOLLOW_14_in_rulePrivate864); 

                            createLeafNode(grammarAccess.getPrivateAccess().getPrivateKeyword_2_0(), null); 
                        
                     
                            currentNode=createCompositeNode(grammarAccess.getPrivateAccess().getVariablesParserRuleCall_2_1(), currentNode); 
                        
                    pushFollow(FOLLOW_ruleVariables_in_rulePrivate886);
                    this_Variables_5=ruleVariables();
                    _fsp--;

                     
                            current = this_Variables_5; 
                            currentNode = currentNode.getParent();
                        

                    }


                    }
                    break;

            }


            }

             resetLookahead(); 
                	lastConsumedNode = currentNode;
                
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end rulePrivate


    // $ANTLR start entryRuleClass
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:388:1: entryRuleClass returns [EObject current=null] : iv_ruleClass= ruleClass EOF ;
    public final EObject entryRuleClass() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleClass = null;


        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:388:47: (iv_ruleClass= ruleClass EOF )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:389:2: iv_ruleClass= ruleClass EOF
            {
             currentNode = createCompositeNode(grammarAccess.getClassRule(), currentNode); 
            pushFollow(FOLLOW_ruleClass_in_entryRuleClass919);
            iv_ruleClass=ruleClass();
            _fsp--;

             current =iv_ruleClass; 
            match(input,EOF,FOLLOW_EOF_in_entryRuleClass929); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end entryRuleClass


    // $ANTLR start ruleClass
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:396:1: ruleClass returns [EObject current=null] : ( 'class' (lv_name_1= RULE_ID ) ( 'extends' ( RULE_ID ) )? '{' (lv_properties_5= ruleProperty )* '}' ) ;
    public final EObject ruleClass() throws RecognitionException {
        EObject current = null;

        Token lv_name_1=null;
        EObject lv_properties_5 = null;


         EObject temp=null; setCurrentLookahead(); resetLookahead(); 
            
        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:401:6: ( ( 'class' (lv_name_1= RULE_ID ) ( 'extends' ( RULE_ID ) )? '{' (lv_properties_5= ruleProperty )* '}' ) )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:402:1: ( 'class' (lv_name_1= RULE_ID ) ( 'extends' ( RULE_ID ) )? '{' (lv_properties_5= ruleProperty )* '}' )
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:402:1: ( 'class' (lv_name_1= RULE_ID ) ( 'extends' ( RULE_ID ) )? '{' (lv_properties_5= ruleProperty )* '}' )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:402:2: 'class' (lv_name_1= RULE_ID ) ( 'extends' ( RULE_ID ) )? '{' (lv_properties_5= ruleProperty )* '}'
            {
            match(input,15,FOLLOW_15_in_ruleClass963); 

                    createLeafNode(grammarAccess.getClassAccess().getClassKeyword_0(), null); 
                
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:406:1: (lv_name_1= RULE_ID )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:408:6: lv_name_1= RULE_ID
            {
            lv_name_1=(Token)input.LT(1);
            match(input,RULE_ID,FOLLOW_RULE_ID_in_ruleClass985); 

            		createLeafNode(grammarAccess.getClassAccess().getNameIDTerminalRuleCall_1_0(), "name"); 
            	

            	        if (current==null) {
            	            current = factory.create(grammarAccess.getClassRule().getType().getClassifier());
            	            associateNodeWithAstElement(currentNode, current);
            	        }
            	        
            	        try {
            	       		set(current, "name", lv_name_1, "ID", lastConsumedNode);
            	        } catch (ValueConverterException vce) {
            				handleValueConverterException(vce);
            	        }
            	    

            }

            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:426:2: ( 'extends' ( RULE_ID ) )?
            int alt7=2;
            int LA7_0 = input.LA(1);

            if ( (LA7_0==16) ) {
                alt7=1;
            }
            switch (alt7) {
                case 1 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:426:3: 'extends' ( RULE_ID )
                    {
                    match(input,16,FOLLOW_16_in_ruleClass1003); 

                            createLeafNode(grammarAccess.getClassAccess().getExtendsKeyword_2_0(), null); 
                        
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:430:1: ( RULE_ID )
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:433:3: RULE_ID
                    {

                    			if (current==null) {
                    	            current = factory.create(grammarAccess.getClassRule().getType().getClassifier());
                    	            associateNodeWithAstElement(currentNode, current);
                    	        }
                            
                    match(input,RULE_ID,FOLLOW_RULE_ID_in_ruleClass1025); 

                    		createLeafNode(grammarAccess.getClassAccess().getSuperClassClassCrossReference_2_1_0(), "superClass"); 
                    	

                    }


                    }
                    break;

            }

            match(input,17,FOLLOW_17_in_ruleClass1039); 

                    createLeafNode(grammarAccess.getClassAccess().getLeftCurlyBracketKeyword_3(), null); 
                
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:450:1: (lv_properties_5= ruleProperty )*
            loop8:
            do {
                int alt8=2;
                int LA8_0 = input.LA(1);

                if ( (LA8_0==19||LA8_0==22) ) {
                    alt8=1;
                }


                switch (alt8) {
            	case 1 :
            	    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:453:6: lv_properties_5= ruleProperty
            	    {
            	     
            	    	        currentNode=createCompositeNode(grammarAccess.getClassAccess().getPropertiesPropertyParserRuleCall_4_0(), currentNode); 
            	    	    
            	    pushFollow(FOLLOW_ruleProperty_in_ruleClass1073);
            	    lv_properties_5=ruleProperty();
            	    _fsp--;


            	    	        if (current==null) {
            	    	            current = factory.create(grammarAccess.getClassRule().getType().getClassifier());
            	    	            associateNodeWithAstElement(currentNode.getParent(), current);
            	    	        }
            	    	        
            	    	        try {
            	    	       		add(current, "properties", lv_properties_5, "Property", currentNode);
            	    	        } catch (ValueConverterException vce) {
            	    				handleValueConverterException(vce);
            	    	        }
            	    	        currentNode = currentNode.getParent();
            	    	    

            	    }
            	    break;

            	default :
            	    break loop8;
                }
            } while (true);

            match(input,18,FOLLOW_18_in_ruleClass1087); 

                    createLeafNode(grammarAccess.getClassAccess().getRightCurlyBracketKeyword_5(), null); 
                

            }


            }

             resetLookahead(); 
                	lastConsumedNode = currentNode;
                
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end ruleClass


    // $ANTLR start entryRuleFunction
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:482:1: entryRuleFunction returns [EObject current=null] : iv_ruleFunction= ruleFunction EOF ;
    public final EObject entryRuleFunction() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleFunction = null;


        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:482:50: (iv_ruleFunction= ruleFunction EOF )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:483:2: iv_ruleFunction= ruleFunction EOF
            {
             currentNode = createCompositeNode(grammarAccess.getFunctionRule(), currentNode); 
            pushFollow(FOLLOW_ruleFunction_in_entryRuleFunction1120);
            iv_ruleFunction=ruleFunction();
            _fsp--;

             current =iv_ruleFunction; 
            match(input,EOF,FOLLOW_EOF_in_entryRuleFunction1130); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end entryRuleFunction


    // $ANTLR start ruleFunction
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:490:1: ruleFunction returns [EObject current=null] : ( 'function' (lv_name_1= RULE_ID ) '(' ')' '{' '}' ) ;
    public final EObject ruleFunction() throws RecognitionException {
        EObject current = null;

        Token lv_name_1=null;

         EObject temp=null; setCurrentLookahead(); resetLookahead(); 
            
        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:495:6: ( ( 'function' (lv_name_1= RULE_ID ) '(' ')' '{' '}' ) )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:496:1: ( 'function' (lv_name_1= RULE_ID ) '(' ')' '{' '}' )
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:496:1: ( 'function' (lv_name_1= RULE_ID ) '(' ')' '{' '}' )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:496:2: 'function' (lv_name_1= RULE_ID ) '(' ')' '{' '}'
            {
            match(input,19,FOLLOW_19_in_ruleFunction1164); 

                    createLeafNode(grammarAccess.getFunctionAccess().getFunctionKeyword_0(), null); 
                
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:500:1: (lv_name_1= RULE_ID )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:502:6: lv_name_1= RULE_ID
            {
            lv_name_1=(Token)input.LT(1);
            match(input,RULE_ID,FOLLOW_RULE_ID_in_ruleFunction1186); 

            		createLeafNode(grammarAccess.getFunctionAccess().getNameIDTerminalRuleCall_1_0(), "name"); 
            	

            	        if (current==null) {
            	            current = factory.create(grammarAccess.getFunctionRule().getType().getClassifier());
            	            associateNodeWithAstElement(currentNode, current);
            	        }
            	        
            	        try {
            	       		set(current, "name", lv_name_1, "ID", lastConsumedNode);
            	        } catch (ValueConverterException vce) {
            				handleValueConverterException(vce);
            	        }
            	    

            }

            match(input,20,FOLLOW_20_in_ruleFunction1203); 

                    createLeafNode(grammarAccess.getFunctionAccess().getLeftParenthesisKeyword_2(), null); 
                
            match(input,21,FOLLOW_21_in_ruleFunction1212); 

                    createLeafNode(grammarAccess.getFunctionAccess().getRightParenthesisKeyword_3(), null); 
                
            match(input,17,FOLLOW_17_in_ruleFunction1221); 

                    createLeafNode(grammarAccess.getFunctionAccess().getLeftCurlyBracketKeyword_4(), null); 
                
            match(input,18,FOLLOW_18_in_ruleFunction1230); 

                    createLeafNode(grammarAccess.getFunctionAccess().getRightCurlyBracketKeyword_5(), null); 
                

            }


            }

             resetLookahead(); 
                	lastConsumedNode = currentNode;
                
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end ruleFunction


    // $ANTLR start entryRuleVariables
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:543:1: entryRuleVariables returns [EObject current=null] : iv_ruleVariables= ruleVariables EOF ;
    public final EObject entryRuleVariables() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleVariables = null;


        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:543:51: (iv_ruleVariables= ruleVariables EOF )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:544:2: iv_ruleVariables= ruleVariables EOF
            {
             currentNode = createCompositeNode(grammarAccess.getVariablesRule(), currentNode); 
            pushFollow(FOLLOW_ruleVariables_in_entryRuleVariables1263);
            iv_ruleVariables=ruleVariables();
            _fsp--;

             current =iv_ruleVariables; 
            match(input,EOF,FOLLOW_EOF_in_entryRuleVariables1273); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end entryRuleVariables


    // $ANTLR start ruleVariables
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:551:1: ruleVariables returns [EObject current=null] : ( ( 'var' this_UNIT_1= ruleUNIT ) | ( 'var' this__String_3= rule_String ) | ( 'var' this__int_5= rule_int ) | ( 'var' this_number_7= rulenumber ) ) ;
    public final EObject ruleVariables() throws RecognitionException {
        EObject current = null;

        EObject this_UNIT_1 = null;

        EObject this__String_3 = null;

        EObject this__int_5 = null;

        EObject this_number_7 = null;


         EObject temp=null; setCurrentLookahead(); resetLookahead(); 
            
        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:556:6: ( ( ( 'var' this_UNIT_1= ruleUNIT ) | ( 'var' this__String_3= rule_String ) | ( 'var' this__int_5= rule_int ) | ( 'var' this_number_7= rulenumber ) ) )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:557:1: ( ( 'var' this_UNIT_1= ruleUNIT ) | ( 'var' this__String_3= rule_String ) | ( 'var' this__int_5= rule_int ) | ( 'var' this_number_7= rulenumber ) )
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:557:1: ( ( 'var' this_UNIT_1= ruleUNIT ) | ( 'var' this__String_3= rule_String ) | ( 'var' this__int_5= rule_int ) | ( 'var' this_number_7= rulenumber ) )
            int alt9=4;
            int LA9_0 = input.LA(1);

            if ( (LA9_0==22) ) {
                int LA9_1 = input.LA(2);

                if ( (LA9_1==RULE_ID) ) {
                    int LA9_2 = input.LA(3);

                    if ( (LA9_2==23) ) {
                        switch ( input.LA(4) ) {
                        case 24:
                            {
                            alt9=1;
                            }
                            break;
                        case 27:
                            {
                            alt9=2;
                            }
                            break;
                        case 29:
                            {
                            alt9=3;
                            }
                            break;
                        case 31:
                            {
                            alt9=4;
                            }
                            break;
                        default:
                            NoViableAltException nvae =
                                new NoViableAltException("557:1: ( ( 'var' this_UNIT_1= ruleUNIT ) | ( 'var' this__String_3= rule_String ) | ( 'var' this__int_5= rule_int ) | ( 'var' this_number_7= rulenumber ) )", 9, 3, input);

                            throw nvae;
                        }

                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("557:1: ( ( 'var' this_UNIT_1= ruleUNIT ) | ( 'var' this__String_3= rule_String ) | ( 'var' this__int_5= rule_int ) | ( 'var' this_number_7= rulenumber ) )", 9, 2, input);

                        throw nvae;
                    }
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("557:1: ( ( 'var' this_UNIT_1= ruleUNIT ) | ( 'var' this__String_3= rule_String ) | ( 'var' this__int_5= rule_int ) | ( 'var' this_number_7= rulenumber ) )", 9, 1, input);

                    throw nvae;
                }
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("557:1: ( ( 'var' this_UNIT_1= ruleUNIT ) | ( 'var' this__String_3= rule_String ) | ( 'var' this__int_5= rule_int ) | ( 'var' this_number_7= rulenumber ) )", 9, 0, input);

                throw nvae;
            }
            switch (alt9) {
                case 1 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:557:2: ( 'var' this_UNIT_1= ruleUNIT )
                    {
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:557:2: ( 'var' this_UNIT_1= ruleUNIT )
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:557:3: 'var' this_UNIT_1= ruleUNIT
                    {
                    match(input,22,FOLLOW_22_in_ruleVariables1308); 

                            createLeafNode(grammarAccess.getVariablesAccess().getVarKeyword_0_0(), null); 
                        
                     
                            currentNode=createCompositeNode(grammarAccess.getVariablesAccess().getUNITParserRuleCall_0_1(), currentNode); 
                        
                    pushFollow(FOLLOW_ruleUNIT_in_ruleVariables1330);
                    this_UNIT_1=ruleUNIT();
                    _fsp--;

                     
                            current = this_UNIT_1; 
                            currentNode = currentNode.getParent();
                        

                    }


                    }
                    break;
                case 2 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:571:6: ( 'var' this__String_3= rule_String )
                    {
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:571:6: ( 'var' this__String_3= rule_String )
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:571:7: 'var' this__String_3= rule_String
                    {
                    match(input,22,FOLLOW_22_in_ruleVariables1346); 

                            createLeafNode(grammarAccess.getVariablesAccess().getVarKeyword_1_0(), null); 
                        
                     
                            currentNode=createCompositeNode(grammarAccess.getVariablesAccess().get_StringParserRuleCall_1_1(), currentNode); 
                        
                    pushFollow(FOLLOW_rule_String_in_ruleVariables1368);
                    this__String_3=rule_String();
                    _fsp--;

                     
                            current = this__String_3; 
                            currentNode = currentNode.getParent();
                        

                    }


                    }
                    break;
                case 3 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:585:6: ( 'var' this__int_5= rule_int )
                    {
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:585:6: ( 'var' this__int_5= rule_int )
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:585:7: 'var' this__int_5= rule_int
                    {
                    match(input,22,FOLLOW_22_in_ruleVariables1384); 

                            createLeafNode(grammarAccess.getVariablesAccess().getVarKeyword_2_0(), null); 
                        
                     
                            currentNode=createCompositeNode(grammarAccess.getVariablesAccess().get_intParserRuleCall_2_1(), currentNode); 
                        
                    pushFollow(FOLLOW_rule_int_in_ruleVariables1406);
                    this__int_5=rule_int();
                    _fsp--;

                     
                            current = this__int_5; 
                            currentNode = currentNode.getParent();
                        

                    }


                    }
                    break;
                case 4 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:599:6: ( 'var' this_number_7= rulenumber )
                    {
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:599:6: ( 'var' this_number_7= rulenumber )
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:599:7: 'var' this_number_7= rulenumber
                    {
                    match(input,22,FOLLOW_22_in_ruleVariables1422); 

                            createLeafNode(grammarAccess.getVariablesAccess().getVarKeyword_3_0(), null); 
                        
                     
                            currentNode=createCompositeNode(grammarAccess.getVariablesAccess().getNumberParserRuleCall_3_1(), currentNode); 
                        
                    pushFollow(FOLLOW_rulenumber_in_ruleVariables1444);
                    this_number_7=rulenumber();
                    _fsp--;

                     
                            current = this_number_7; 
                            currentNode = currentNode.getParent();
                        

                    }


                    }
                    break;

            }


            }

             resetLookahead(); 
                	lastConsumedNode = currentNode;
                
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end ruleVariables


    // $ANTLR start entryRuleUNIT
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:619:1: entryRuleUNIT returns [EObject current=null] : iv_ruleUNIT= ruleUNIT EOF ;
    public final EObject entryRuleUNIT() throws RecognitionException {
        EObject current = null;

        EObject iv_ruleUNIT = null;


        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:619:46: (iv_ruleUNIT= ruleUNIT EOF )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:620:2: iv_ruleUNIT= ruleUNIT EOF
            {
             currentNode = createCompositeNode(grammarAccess.getUNITRule(), currentNode); 
            pushFollow(FOLLOW_ruleUNIT_in_entryRuleUNIT1477);
            iv_ruleUNIT=ruleUNIT();
            _fsp--;

             current =iv_ruleUNIT; 
            match(input,EOF,FOLLOW_EOF_in_entryRuleUNIT1487); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end entryRuleUNIT


    // $ANTLR start ruleUNIT
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:627:1: ruleUNIT returns [EObject current=null] : ( (lv_Name_0= RULE_ID ) ':' 'unit' ( '=' (lv_String_4= '0x000000' ) )? ';' ) ;
    public final EObject ruleUNIT() throws RecognitionException {
        EObject current = null;

        Token lv_Name_0=null;
        Token lv_String_4=null;

         EObject temp=null; setCurrentLookahead(); resetLookahead(); 
            
        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:632:6: ( ( (lv_Name_0= RULE_ID ) ':' 'unit' ( '=' (lv_String_4= '0x000000' ) )? ';' ) )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:633:1: ( (lv_Name_0= RULE_ID ) ':' 'unit' ( '=' (lv_String_4= '0x000000' ) )? ';' )
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:633:1: ( (lv_Name_0= RULE_ID ) ':' 'unit' ( '=' (lv_String_4= '0x000000' ) )? ';' )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:633:2: (lv_Name_0= RULE_ID ) ':' 'unit' ( '=' (lv_String_4= '0x000000' ) )? ';'
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:633:2: (lv_Name_0= RULE_ID )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:635:6: lv_Name_0= RULE_ID
            {
            lv_Name_0=(Token)input.LT(1);
            match(input,RULE_ID,FOLLOW_RULE_ID_in_ruleUNIT1534); 

            		createLeafNode(grammarAccess.getUNITAccess().getNameIDTerminalRuleCall_0_0(), "Name"); 
            	

            	        if (current==null) {
            	            current = factory.create(grammarAccess.getUNITRule().getType().getClassifier());
            	            associateNodeWithAstElement(currentNode, current);
            	        }
            	        
            	        try {
            	       		set(current, "Name", lv_Name_0, "ID", lastConsumedNode);
            	        } catch (ValueConverterException vce) {
            				handleValueConverterException(vce);
            	        }
            	    

            }

            match(input,23,FOLLOW_23_in_ruleUNIT1551); 

                    createLeafNode(grammarAccess.getUNITAccess().getColonKeyword_1(), null); 
                
            match(input,24,FOLLOW_24_in_ruleUNIT1560); 

                    createLeafNode(grammarAccess.getUNITAccess().getUnitKeyword_2(), null); 
                
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:661:1: ( '=' (lv_String_4= '0x000000' ) )?
            int alt10=2;
            int LA10_0 = input.LA(1);

            if ( (LA10_0==25) ) {
                alt10=1;
            }
            switch (alt10) {
                case 1 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:661:2: '=' (lv_String_4= '0x000000' )
                    {
                    match(input,25,FOLLOW_25_in_ruleUNIT1570); 

                            createLeafNode(grammarAccess.getUNITAccess().getEqualsSignKeyword_3_0(), null); 
                        
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:665:1: (lv_String_4= '0x000000' )
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:667:6: lv_String_4= '0x000000'
                    {
                    lv_String_4=(Token)input.LT(1);
                    match(input,26,FOLLOW_26_in_ruleUNIT1591); 

                            createLeafNode(grammarAccess.getUNITAccess().getString0x000000Keyword_3_1_0(), "String"); 
                        

                    	        if (current==null) {
                    	            current = factory.create(grammarAccess.getUNITRule().getType().getClassifier());
                    	            associateNodeWithAstElement(currentNode, current);
                    	        }
                    	        
                    	        try {
                    	       		set(current, "String", /* lv_String_4 */ input.LT(-1), "0x000000", lastConsumedNode);
                    	        } catch (ValueConverterException vce) {
                    				handleValueConverterException(vce);
                    	        }
                    	    

                    }


                    }
                    break;

            }

            match(input,12,FOLLOW_12_in_ruleUNIT1615); 

                    createLeafNode(grammarAccess.getUNITAccess().getSemicolonKeyword_4(), null); 
                

            }


            }

             resetLookahead(); 
                	lastConsumedNode = currentNode;
                
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end ruleUNIT


    // $ANTLR start entryRule_String
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:697:1: entryRule_String returns [EObject current=null] : iv_rule_String= rule_String EOF ;
    public final EObject entryRule_String() throws RecognitionException {
        EObject current = null;

        EObject iv_rule_String = null;


        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:697:49: (iv_rule_String= rule_String EOF )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:698:2: iv_rule_String= rule_String EOF
            {
             currentNode = createCompositeNode(grammarAccess.get_StringRule(), currentNode); 
            pushFollow(FOLLOW_rule_String_in_entryRule_String1648);
            iv_rule_String=rule_String();
            _fsp--;

             current =iv_rule_String; 
            match(input,EOF,FOLLOW_EOF_in_entryRule_String1658); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end entryRule_String


    // $ANTLR start rule_String
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:705:1: rule_String returns [EObject current=null] : ( (lv_Name_0= RULE_ID ) ':' 'String' ( '=' (lv_String_4= '' )? )? ';' ) ;
    public final EObject rule_String() throws RecognitionException {
        EObject current = null;

        Token lv_Name_0=null;
        Token lv_String_4=null;

         EObject temp=null; setCurrentLookahead(); resetLookahead(); 
            
        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:710:6: ( ( (lv_Name_0= RULE_ID ) ':' 'String' ( '=' (lv_String_4= '' )? )? ';' ) )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:711:1: ( (lv_Name_0= RULE_ID ) ':' 'String' ( '=' (lv_String_4= '' )? )? ';' )
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:711:1: ( (lv_Name_0= RULE_ID ) ':' 'String' ( '=' (lv_String_4= '' )? )? ';' )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:711:2: (lv_Name_0= RULE_ID ) ':' 'String' ( '=' (lv_String_4= '' )? )? ';'
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:711:2: (lv_Name_0= RULE_ID )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:713:6: lv_Name_0= RULE_ID
            {
            lv_Name_0=(Token)input.LT(1);
            match(input,RULE_ID,FOLLOW_RULE_ID_in_rule_String1705); 

            		createLeafNode(grammarAccess.get_StringAccess().getNameIDTerminalRuleCall_0_0(), "Name"); 
            	

            	        if (current==null) {
            	            current = factory.create(grammarAccess.get_StringRule().getType().getClassifier());
            	            associateNodeWithAstElement(currentNode, current);
            	        }
            	        
            	        try {
            	       		set(current, "Name", lv_Name_0, "ID", lastConsumedNode);
            	        } catch (ValueConverterException vce) {
            				handleValueConverterException(vce);
            	        }
            	    

            }

            match(input,23,FOLLOW_23_in_rule_String1722); 

                    createLeafNode(grammarAccess.get_StringAccess().getColonKeyword_1(), null); 
                
            match(input,27,FOLLOW_27_in_rule_String1731); 

                    createLeafNode(grammarAccess.get_StringAccess().getStringKeyword_2(), null); 
                
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:739:1: ( '=' (lv_String_4= '' )? )?
            int alt12=2;
            int LA12_0 = input.LA(1);

            if ( (LA12_0==25) ) {
                alt12=1;
            }
            switch (alt12) {
                case 1 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:739:2: '=' (lv_String_4= '' )?
                    {
                    match(input,25,FOLLOW_25_in_rule_String1741); 

                            createLeafNode(grammarAccess.get_StringAccess().getEqualsSignKeyword_3_0(), null); 
                        
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:743:1: (lv_String_4= '' )?
                    int alt11=2;
                    int LA11_0 = input.LA(1);

                    if ( (LA11_0==28) ) {
                        alt11=1;
                    }
                    switch (alt11) {
                        case 1 :
                            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:745:6: lv_String_4= ''
                            {
                            lv_String_4=(Token)input.LT(1);
                            match(input,28,FOLLOW_28_in_rule_String1762); 

                                    createLeafNode(grammarAccess.get_StringAccess().getStringKeyword_3_1_0(), "String"); 
                                

                            	        if (current==null) {
                            	            current = factory.create(grammarAccess.get_StringRule().getType().getClassifier());
                            	            associateNodeWithAstElement(currentNode, current);
                            	        }
                            	        
                            	        try {
                            	       		set(current, "String", /* lv_String_4 */ input.LT(-1), "", lastConsumedNode);
                            	        } catch (ValueConverterException vce) {
                            				handleValueConverterException(vce);
                            	        }
                            	    

                            }
                            break;

                    }


                    }
                    break;

            }

            match(input,12,FOLLOW_12_in_rule_String1787); 

                    createLeafNode(grammarAccess.get_StringAccess().getSemicolonKeyword_4(), null); 
                

            }


            }

             resetLookahead(); 
                	lastConsumedNode = currentNode;
                
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end rule_String


    // $ANTLR start entryRule_int
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:775:1: entryRule_int returns [EObject current=null] : iv_rule_int= rule_int EOF ;
    public final EObject entryRule_int() throws RecognitionException {
        EObject current = null;

        EObject iv_rule_int = null;


        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:775:46: (iv_rule_int= rule_int EOF )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:776:2: iv_rule_int= rule_int EOF
            {
             currentNode = createCompositeNode(grammarAccess.get_intRule(), currentNode); 
            pushFollow(FOLLOW_rule_int_in_entryRule_int1820);
            iv_rule_int=rule_int();
            _fsp--;

             current =iv_rule_int; 
            match(input,EOF,FOLLOW_EOF_in_entryRule_int1830); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end entryRule_int


    // $ANTLR start rule_int
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:783:1: rule_int returns [EObject current=null] : ( (lv_Name_0= RULE_ID ) ':' 'int' ( '=' (lv_int_4= '0' ) )? ';' ) ;
    public final EObject rule_int() throws RecognitionException {
        EObject current = null;

        Token lv_Name_0=null;
        Token lv_int_4=null;

         EObject temp=null; setCurrentLookahead(); resetLookahead(); 
            
        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:788:6: ( ( (lv_Name_0= RULE_ID ) ':' 'int' ( '=' (lv_int_4= '0' ) )? ';' ) )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:789:1: ( (lv_Name_0= RULE_ID ) ':' 'int' ( '=' (lv_int_4= '0' ) )? ';' )
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:789:1: ( (lv_Name_0= RULE_ID ) ':' 'int' ( '=' (lv_int_4= '0' ) )? ';' )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:789:2: (lv_Name_0= RULE_ID ) ':' 'int' ( '=' (lv_int_4= '0' ) )? ';'
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:789:2: (lv_Name_0= RULE_ID )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:791:6: lv_Name_0= RULE_ID
            {
            lv_Name_0=(Token)input.LT(1);
            match(input,RULE_ID,FOLLOW_RULE_ID_in_rule_int1877); 

            		createLeafNode(grammarAccess.get_intAccess().getNameIDTerminalRuleCall_0_0(), "Name"); 
            	

            	        if (current==null) {
            	            current = factory.create(grammarAccess.get_intRule().getType().getClassifier());
            	            associateNodeWithAstElement(currentNode, current);
            	        }
            	        
            	        try {
            	       		set(current, "Name", lv_Name_0, "ID", lastConsumedNode);
            	        } catch (ValueConverterException vce) {
            				handleValueConverterException(vce);
            	        }
            	    

            }

            match(input,23,FOLLOW_23_in_rule_int1894); 

                    createLeafNode(grammarAccess.get_intAccess().getColonKeyword_1(), null); 
                
            match(input,29,FOLLOW_29_in_rule_int1903); 

                    createLeafNode(grammarAccess.get_intAccess().getIntKeyword_2(), null); 
                
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:817:1: ( '=' (lv_int_4= '0' ) )?
            int alt13=2;
            int LA13_0 = input.LA(1);

            if ( (LA13_0==25) ) {
                alt13=1;
            }
            switch (alt13) {
                case 1 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:817:2: '=' (lv_int_4= '0' )
                    {
                    match(input,25,FOLLOW_25_in_rule_int1913); 

                            createLeafNode(grammarAccess.get_intAccess().getEqualsSignKeyword_3_0(), null); 
                        
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:821:1: (lv_int_4= '0' )
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:823:6: lv_int_4= '0'
                    {
                    lv_int_4=(Token)input.LT(1);
                    match(input,30,FOLLOW_30_in_rule_int1934); 

                            createLeafNode(grammarAccess.get_intAccess().getInt0Keyword_3_1_0(), "int"); 
                        

                    	        if (current==null) {
                    	            current = factory.create(grammarAccess.get_intRule().getType().getClassifier());
                    	            associateNodeWithAstElement(currentNode, current);
                    	        }
                    	        
                    	        try {
                    	       		set(current, "int", /* lv_int_4 */ input.LT(-1), "0", lastConsumedNode);
                    	        } catch (ValueConverterException vce) {
                    				handleValueConverterException(vce);
                    	        }
                    	    

                    }


                    }
                    break;

            }

            match(input,12,FOLLOW_12_in_rule_int1958); 

                    createLeafNode(grammarAccess.get_intAccess().getSemicolonKeyword_4(), null); 
                

            }


            }

             resetLookahead(); 
                	lastConsumedNode = currentNode;
                
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end rule_int


    // $ANTLR start entryRulenumber
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:853:1: entryRulenumber returns [EObject current=null] : iv_rulenumber= rulenumber EOF ;
    public final EObject entryRulenumber() throws RecognitionException {
        EObject current = null;

        EObject iv_rulenumber = null;


        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:853:48: (iv_rulenumber= rulenumber EOF )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:854:2: iv_rulenumber= rulenumber EOF
            {
             currentNode = createCompositeNode(grammarAccess.getNumberRule(), currentNode); 
            pushFollow(FOLLOW_rulenumber_in_entryRulenumber1991);
            iv_rulenumber=rulenumber();
            _fsp--;

             current =iv_rulenumber; 
            match(input,EOF,FOLLOW_EOF_in_entryRulenumber2001); 

            }

        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end entryRulenumber


    // $ANTLR start rulenumber
    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:861:1: rulenumber returns [EObject current=null] : ( (lv_Name_0= RULE_ID ) ':' 'Number' ( '=' (lv_double_4= '0' ) )? ';' ) ;
    public final EObject rulenumber() throws RecognitionException {
        EObject current = null;

        Token lv_Name_0=null;
        Token lv_double_4=null;

         EObject temp=null; setCurrentLookahead(); resetLookahead(); 
            
        try {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:866:6: ( ( (lv_Name_0= RULE_ID ) ':' 'Number' ( '=' (lv_double_4= '0' ) )? ';' ) )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:867:1: ( (lv_Name_0= RULE_ID ) ':' 'Number' ( '=' (lv_double_4= '0' ) )? ';' )
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:867:1: ( (lv_Name_0= RULE_ID ) ':' 'Number' ( '=' (lv_double_4= '0' ) )? ';' )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:867:2: (lv_Name_0= RULE_ID ) ':' 'Number' ( '=' (lv_double_4= '0' ) )? ';'
            {
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:867:2: (lv_Name_0= RULE_ID )
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:869:6: lv_Name_0= RULE_ID
            {
            lv_Name_0=(Token)input.LT(1);
            match(input,RULE_ID,FOLLOW_RULE_ID_in_rulenumber2048); 

            		createLeafNode(grammarAccess.getNumberAccess().getNameIDTerminalRuleCall_0_0(), "Name"); 
            	

            	        if (current==null) {
            	            current = factory.create(grammarAccess.getNumberRule().getType().getClassifier());
            	            associateNodeWithAstElement(currentNode, current);
            	        }
            	        
            	        try {
            	       		set(current, "Name", lv_Name_0, "ID", lastConsumedNode);
            	        } catch (ValueConverterException vce) {
            				handleValueConverterException(vce);
            	        }
            	    

            }

            match(input,23,FOLLOW_23_in_rulenumber2065); 

                    createLeafNode(grammarAccess.getNumberAccess().getColonKeyword_1(), null); 
                
            match(input,31,FOLLOW_31_in_rulenumber2074); 

                    createLeafNode(grammarAccess.getNumberAccess().getNumberKeyword_2(), null); 
                
            // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:895:1: ( '=' (lv_double_4= '0' ) )?
            int alt14=2;
            int LA14_0 = input.LA(1);

            if ( (LA14_0==25) ) {
                alt14=1;
            }
            switch (alt14) {
                case 1 :
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:895:2: '=' (lv_double_4= '0' )
                    {
                    match(input,25,FOLLOW_25_in_rulenumber2084); 

                            createLeafNode(grammarAccess.getNumberAccess().getEqualsSignKeyword_3_0(), null); 
                        
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:899:1: (lv_double_4= '0' )
                    // ../org.xtext.actionscript.as3os/src-gen/org/xtext/actionscript/parser/antlr/internal/Internalactionscript3.g:901:6: lv_double_4= '0'
                    {
                    lv_double_4=(Token)input.LT(1);
                    match(input,30,FOLLOW_30_in_rulenumber2105); 

                            createLeafNode(grammarAccess.getNumberAccess().getDouble0Keyword_3_1_0(), "double"); 
                        

                    	        if (current==null) {
                    	            current = factory.create(grammarAccess.getNumberRule().getType().getClassifier());
                    	            associateNodeWithAstElement(currentNode, current);
                    	        }
                    	        
                    	        try {
                    	       		set(current, "double", /* lv_double_4 */ input.LT(-1), "0", lastConsumedNode);
                    	        } catch (ValueConverterException vce) {
                    				handleValueConverterException(vce);
                    	        }
                    	    

                    }


                    }
                    break;

            }

            match(input,12,FOLLOW_12_in_rulenumber2129); 

                    createLeafNode(grammarAccess.getNumberAccess().getSemicolonKeyword_4(), null); 
                

            }


            }

             resetLookahead(); 
                	lastConsumedNode = currentNode;
                
        }
         
            catch (RecognitionException re) { 
                recover(input,re); 
                appendSkippedTokens();
            } 
        finally {
        }
        return current;
    }
    // $ANTLR end rulenumber


 

    public static final BitSet FOLLOW_ruleModel_in_entryRuleModel73 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRuleModel83 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleImport_in_ruleModel142 = new BitSet(new long[]{0x0000000000006802L});
    public static final BitSet FOLLOW_ruleType_in_ruleModel181 = new BitSet(new long[]{0x0000000000006002L});
    public static final BitSet FOLLOW_ruleImport_in_entryRuleImport219 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRuleImport229 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_11_in_ruleImport263 = new BitSet(new long[]{0x0000000000000010L});
    public static final BitSet FOLLOW_RULE_STRING_in_ruleImport285 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_12_in_ruleImport302 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleType_in_entryRuleType335 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRuleType345 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rulePublic_in_ruleType392 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rulePrivate_in_ruleType419 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleProperty_in_entryRuleProperty451 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRuleProperty461 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleVariables_in_ruleProperty508 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleFunction_in_ruleProperty535 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rulePublic_in_entryRulePublic567 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRulePublic577 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_13_in_rulePublic612 = new BitSet(new long[]{0x0000000000008000L});
    public static final BitSet FOLLOW_ruleClass_in_rulePublic634 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_13_in_rulePublic650 = new BitSet(new long[]{0x0000000000080000L});
    public static final BitSet FOLLOW_ruleFunction_in_rulePublic672 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_13_in_rulePublic688 = new BitSet(new long[]{0x0000000000400000L});
    public static final BitSet FOLLOW_ruleVariables_in_rulePublic710 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rulePrivate_in_entryRulePrivate743 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRulePrivate753 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_14_in_rulePrivate788 = new BitSet(new long[]{0x0000000000008000L});
    public static final BitSet FOLLOW_ruleClass_in_rulePrivate810 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_14_in_rulePrivate826 = new BitSet(new long[]{0x0000000000080000L});
    public static final BitSet FOLLOW_ruleFunction_in_rulePrivate848 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_14_in_rulePrivate864 = new BitSet(new long[]{0x0000000000400000L});
    public static final BitSet FOLLOW_ruleVariables_in_rulePrivate886 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleClass_in_entryRuleClass919 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRuleClass929 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_15_in_ruleClass963 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_RULE_ID_in_ruleClass985 = new BitSet(new long[]{0x0000000000030000L});
    public static final BitSet FOLLOW_16_in_ruleClass1003 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_RULE_ID_in_ruleClass1025 = new BitSet(new long[]{0x0000000000020000L});
    public static final BitSet FOLLOW_17_in_ruleClass1039 = new BitSet(new long[]{0x00000000004C0000L});
    public static final BitSet FOLLOW_ruleProperty_in_ruleClass1073 = new BitSet(new long[]{0x00000000004C0000L});
    public static final BitSet FOLLOW_18_in_ruleClass1087 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleFunction_in_entryRuleFunction1120 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRuleFunction1130 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_19_in_ruleFunction1164 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_RULE_ID_in_ruleFunction1186 = new BitSet(new long[]{0x0000000000100000L});
    public static final BitSet FOLLOW_20_in_ruleFunction1203 = new BitSet(new long[]{0x0000000000200000L});
    public static final BitSet FOLLOW_21_in_ruleFunction1212 = new BitSet(new long[]{0x0000000000020000L});
    public static final BitSet FOLLOW_17_in_ruleFunction1221 = new BitSet(new long[]{0x0000000000040000L});
    public static final BitSet FOLLOW_18_in_ruleFunction1230 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleVariables_in_entryRuleVariables1263 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRuleVariables1273 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_22_in_ruleVariables1308 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_ruleUNIT_in_ruleVariables1330 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_22_in_ruleVariables1346 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_rule_String_in_ruleVariables1368 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_22_in_ruleVariables1384 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_rule_int_in_ruleVariables1406 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_22_in_ruleVariables1422 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_rulenumber_in_ruleVariables1444 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleUNIT_in_entryRuleUNIT1477 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRuleUNIT1487 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_RULE_ID_in_ruleUNIT1534 = new BitSet(new long[]{0x0000000000800000L});
    public static final BitSet FOLLOW_23_in_ruleUNIT1551 = new BitSet(new long[]{0x0000000001000000L});
    public static final BitSet FOLLOW_24_in_ruleUNIT1560 = new BitSet(new long[]{0x0000000002001000L});
    public static final BitSet FOLLOW_25_in_ruleUNIT1570 = new BitSet(new long[]{0x0000000004000000L});
    public static final BitSet FOLLOW_26_in_ruleUNIT1591 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_12_in_ruleUNIT1615 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule_String_in_entryRule_String1648 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRule_String1658 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_RULE_ID_in_rule_String1705 = new BitSet(new long[]{0x0000000000800000L});
    public static final BitSet FOLLOW_23_in_rule_String1722 = new BitSet(new long[]{0x0000000008000000L});
    public static final BitSet FOLLOW_27_in_rule_String1731 = new BitSet(new long[]{0x0000000002001000L});
    public static final BitSet FOLLOW_25_in_rule_String1741 = new BitSet(new long[]{0x0000000010001000L});
    public static final BitSet FOLLOW_28_in_rule_String1762 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_12_in_rule_String1787 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule_int_in_entryRule_int1820 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRule_int1830 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_RULE_ID_in_rule_int1877 = new BitSet(new long[]{0x0000000000800000L});
    public static final BitSet FOLLOW_23_in_rule_int1894 = new BitSet(new long[]{0x0000000020000000L});
    public static final BitSet FOLLOW_29_in_rule_int1903 = new BitSet(new long[]{0x0000000002001000L});
    public static final BitSet FOLLOW_25_in_rule_int1913 = new BitSet(new long[]{0x0000000040000000L});
    public static final BitSet FOLLOW_30_in_rule_int1934 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_12_in_rule_int1958 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rulenumber_in_entryRulenumber1991 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRulenumber2001 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_RULE_ID_in_rulenumber2048 = new BitSet(new long[]{0x0000000000800000L});
    public static final BitSet FOLLOW_23_in_rulenumber2065 = new BitSet(new long[]{0x0000000080000000L});
    public static final BitSet FOLLOW_31_in_rulenumber2074 = new BitSet(new long[]{0x0000000002001000L});
    public static final BitSet FOLLOW_25_in_rulenumber2084 = new BitSet(new long[]{0x0000000040000000L});
    public static final BitSet FOLLOW_30_in_rulenumber2105 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_12_in_rulenumber2129 = new BitSet(new long[]{0x0000000000000002L});

}
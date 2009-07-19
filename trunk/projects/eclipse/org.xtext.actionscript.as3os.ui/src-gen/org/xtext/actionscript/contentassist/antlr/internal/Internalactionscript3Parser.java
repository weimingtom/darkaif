package org.xtext.actionscript.contentassist.antlr.internal; 

import java.io.InputStream;
import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.xtext.parsetree.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.ui.common.editor.contentassist.antlr.internal.AbstractInternalContentAssistParser;
import org.xtext.actionscript.services.actionscript3GrammarAccess;



import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class Internalactionscript3Parser extends AbstractInternalContentAssistParser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "RULE_STRING", "RULE_ID", "RULE_INT", "RULE_ML_COMMENT", "RULE_SL_COMMENT", "RULE_WS", "RULE_ANY_OTHER", "'import'", "';'", "'public'", "'private'", "'class'", "'{'", "'}'", "'extends'", "'function'", "'('", "')'", "'var'", "':'", "'unit'", "'='", "'0x000000'", "'String'", "''", "'int'", "'0'", "'Number'"
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
    public String getGrammarFileName() { return "../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g"; }


     
     	private actionscript3GrammarAccess grammarAccess;
     	
        public void setGrammarAccess(actionscript3GrammarAccess grammarAccess) {
        	this.grammarAccess = grammarAccess;
        }
        
        @Override
        protected Grammar getGrammar() {
        	return grammarAccess.getGrammar();
        }




    // $ANTLR start entryRuleModel
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:55:1: entryRuleModel : ruleModel EOF ;
    public final void entryRuleModel() throws RecognitionException {
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:55:16: ( ruleModel EOF )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:56:1: ruleModel EOF
            {
             before(grammarAccess.getModelRule()); 
            pushFollow(FOLLOW_ruleModel_in_entryRuleModel60);
            ruleModel();
            _fsp--;

             after(grammarAccess.getModelRule()); 
            match(input,EOF,FOLLOW_EOF_in_entryRuleModel67); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end entryRuleModel


    // $ANTLR start ruleModel
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:63:1: ruleModel : ( ( rule__Model__Group ) ) ;
    public final void ruleModel() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:67:2: ( ( ( rule__Model__Group ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:68:1: ( ( rule__Model__Group ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:68:1: ( ( rule__Model__Group ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:69:1: ( rule__Model__Group )
            {
             before(grammarAccess.getModelAccess().getGroup()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:70:1: ( rule__Model__Group )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:70:2: rule__Model__Group
            {
            pushFollow(FOLLOW_rule__Model__Group_in_ruleModel94);
            rule__Model__Group();
            _fsp--;


            }

             after(grammarAccess.getModelAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end ruleModel


    // $ANTLR start entryRuleImport
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:81:1: entryRuleImport : ruleImport EOF ;
    public final void entryRuleImport() throws RecognitionException {
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:81:17: ( ruleImport EOF )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:82:1: ruleImport EOF
            {
             before(grammarAccess.getImportRule()); 
            pushFollow(FOLLOW_ruleImport_in_entryRuleImport119);
            ruleImport();
            _fsp--;

             after(grammarAccess.getImportRule()); 
            match(input,EOF,FOLLOW_EOF_in_entryRuleImport126); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end entryRuleImport


    // $ANTLR start ruleImport
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:89:1: ruleImport : ( ( rule__Import__Group ) ) ;
    public final void ruleImport() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:93:2: ( ( ( rule__Import__Group ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:94:1: ( ( rule__Import__Group ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:94:1: ( ( rule__Import__Group ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:95:1: ( rule__Import__Group )
            {
             before(grammarAccess.getImportAccess().getGroup()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:96:1: ( rule__Import__Group )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:96:2: rule__Import__Group
            {
            pushFollow(FOLLOW_rule__Import__Group_in_ruleImport153);
            rule__Import__Group();
            _fsp--;


            }

             after(grammarAccess.getImportAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end ruleImport


    // $ANTLR start entryRuleType
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:107:1: entryRuleType : ruleType EOF ;
    public final void entryRuleType() throws RecognitionException {
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:107:15: ( ruleType EOF )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:108:1: ruleType EOF
            {
             before(grammarAccess.getTypeRule()); 
            pushFollow(FOLLOW_ruleType_in_entryRuleType178);
            ruleType();
            _fsp--;

             after(grammarAccess.getTypeRule()); 
            match(input,EOF,FOLLOW_EOF_in_entryRuleType185); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end entryRuleType


    // $ANTLR start ruleType
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:115:1: ruleType : ( ( rule__Type__Alternatives ) ) ;
    public final void ruleType() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:119:2: ( ( ( rule__Type__Alternatives ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:120:1: ( ( rule__Type__Alternatives ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:120:1: ( ( rule__Type__Alternatives ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:121:1: ( rule__Type__Alternatives )
            {
             before(grammarAccess.getTypeAccess().getAlternatives()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:122:1: ( rule__Type__Alternatives )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:122:2: rule__Type__Alternatives
            {
            pushFollow(FOLLOW_rule__Type__Alternatives_in_ruleType212);
            rule__Type__Alternatives();
            _fsp--;


            }

             after(grammarAccess.getTypeAccess().getAlternatives()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end ruleType


    // $ANTLR start entryRuleProperty
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:133:1: entryRuleProperty : ruleProperty EOF ;
    public final void entryRuleProperty() throws RecognitionException {
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:133:19: ( ruleProperty EOF )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:134:1: ruleProperty EOF
            {
             before(grammarAccess.getPropertyRule()); 
            pushFollow(FOLLOW_ruleProperty_in_entryRuleProperty237);
            ruleProperty();
            _fsp--;

             after(grammarAccess.getPropertyRule()); 
            match(input,EOF,FOLLOW_EOF_in_entryRuleProperty244); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end entryRuleProperty


    // $ANTLR start ruleProperty
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:141:1: ruleProperty : ( ( rule__Property__Alternatives ) ) ;
    public final void ruleProperty() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:145:2: ( ( ( rule__Property__Alternatives ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:146:1: ( ( rule__Property__Alternatives ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:146:1: ( ( rule__Property__Alternatives ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:147:1: ( rule__Property__Alternatives )
            {
             before(grammarAccess.getPropertyAccess().getAlternatives()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:148:1: ( rule__Property__Alternatives )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:148:2: rule__Property__Alternatives
            {
            pushFollow(FOLLOW_rule__Property__Alternatives_in_ruleProperty271);
            rule__Property__Alternatives();
            _fsp--;


            }

             after(grammarAccess.getPropertyAccess().getAlternatives()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end ruleProperty


    // $ANTLR start entryRulePublic
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:159:1: entryRulePublic : rulePublic EOF ;
    public final void entryRulePublic() throws RecognitionException {
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:159:17: ( rulePublic EOF )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:160:1: rulePublic EOF
            {
             before(grammarAccess.getPublicRule()); 
            pushFollow(FOLLOW_rulePublic_in_entryRulePublic296);
            rulePublic();
            _fsp--;

             after(grammarAccess.getPublicRule()); 
            match(input,EOF,FOLLOW_EOF_in_entryRulePublic303); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end entryRulePublic


    // $ANTLR start rulePublic
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:167:1: rulePublic : ( ( rule__Public__Alternatives ) ) ;
    public final void rulePublic() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:171:2: ( ( ( rule__Public__Alternatives ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:172:1: ( ( rule__Public__Alternatives ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:172:1: ( ( rule__Public__Alternatives ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:173:1: ( rule__Public__Alternatives )
            {
             before(grammarAccess.getPublicAccess().getAlternatives()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:174:1: ( rule__Public__Alternatives )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:174:2: rule__Public__Alternatives
            {
            pushFollow(FOLLOW_rule__Public__Alternatives_in_rulePublic330);
            rule__Public__Alternatives();
            _fsp--;


            }

             after(grammarAccess.getPublicAccess().getAlternatives()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rulePublic


    // $ANTLR start entryRulePrivate
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:185:1: entryRulePrivate : rulePrivate EOF ;
    public final void entryRulePrivate() throws RecognitionException {
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:185:18: ( rulePrivate EOF )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:186:1: rulePrivate EOF
            {
             before(grammarAccess.getPrivateRule()); 
            pushFollow(FOLLOW_rulePrivate_in_entryRulePrivate355);
            rulePrivate();
            _fsp--;

             after(grammarAccess.getPrivateRule()); 
            match(input,EOF,FOLLOW_EOF_in_entryRulePrivate362); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end entryRulePrivate


    // $ANTLR start rulePrivate
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:193:1: rulePrivate : ( ( rule__Private__Alternatives ) ) ;
    public final void rulePrivate() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:197:2: ( ( ( rule__Private__Alternatives ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:198:1: ( ( rule__Private__Alternatives ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:198:1: ( ( rule__Private__Alternatives ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:199:1: ( rule__Private__Alternatives )
            {
             before(grammarAccess.getPrivateAccess().getAlternatives()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:200:1: ( rule__Private__Alternatives )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:200:2: rule__Private__Alternatives
            {
            pushFollow(FOLLOW_rule__Private__Alternatives_in_rulePrivate389);
            rule__Private__Alternatives();
            _fsp--;


            }

             after(grammarAccess.getPrivateAccess().getAlternatives()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rulePrivate


    // $ANTLR start entryRuleClass
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:211:1: entryRuleClass : ruleClass EOF ;
    public final void entryRuleClass() throws RecognitionException {
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:211:16: ( ruleClass EOF )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:212:1: ruleClass EOF
            {
             before(grammarAccess.getClassRule()); 
            pushFollow(FOLLOW_ruleClass_in_entryRuleClass414);
            ruleClass();
            _fsp--;

             after(grammarAccess.getClassRule()); 
            match(input,EOF,FOLLOW_EOF_in_entryRuleClass421); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end entryRuleClass


    // $ANTLR start ruleClass
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:219:1: ruleClass : ( ( rule__Class__Group ) ) ;
    public final void ruleClass() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:223:2: ( ( ( rule__Class__Group ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:224:1: ( ( rule__Class__Group ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:224:1: ( ( rule__Class__Group ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:225:1: ( rule__Class__Group )
            {
             before(grammarAccess.getClassAccess().getGroup()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:226:1: ( rule__Class__Group )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:226:2: rule__Class__Group
            {
            pushFollow(FOLLOW_rule__Class__Group_in_ruleClass448);
            rule__Class__Group();
            _fsp--;


            }

             after(grammarAccess.getClassAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end ruleClass


    // $ANTLR start entryRuleFunction
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:237:1: entryRuleFunction : ruleFunction EOF ;
    public final void entryRuleFunction() throws RecognitionException {
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:237:19: ( ruleFunction EOF )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:238:1: ruleFunction EOF
            {
             before(grammarAccess.getFunctionRule()); 
            pushFollow(FOLLOW_ruleFunction_in_entryRuleFunction473);
            ruleFunction();
            _fsp--;

             after(grammarAccess.getFunctionRule()); 
            match(input,EOF,FOLLOW_EOF_in_entryRuleFunction480); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end entryRuleFunction


    // $ANTLR start ruleFunction
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:245:1: ruleFunction : ( ( rule__Function__Group ) ) ;
    public final void ruleFunction() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:249:2: ( ( ( rule__Function__Group ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:250:1: ( ( rule__Function__Group ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:250:1: ( ( rule__Function__Group ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:251:1: ( rule__Function__Group )
            {
             before(grammarAccess.getFunctionAccess().getGroup()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:252:1: ( rule__Function__Group )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:252:2: rule__Function__Group
            {
            pushFollow(FOLLOW_rule__Function__Group_in_ruleFunction507);
            rule__Function__Group();
            _fsp--;


            }

             after(grammarAccess.getFunctionAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end ruleFunction


    // $ANTLR start entryRuleVariables
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:263:1: entryRuleVariables : ruleVariables EOF ;
    public final void entryRuleVariables() throws RecognitionException {
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:263:20: ( ruleVariables EOF )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:264:1: ruleVariables EOF
            {
             before(grammarAccess.getVariablesRule()); 
            pushFollow(FOLLOW_ruleVariables_in_entryRuleVariables532);
            ruleVariables();
            _fsp--;

             after(grammarAccess.getVariablesRule()); 
            match(input,EOF,FOLLOW_EOF_in_entryRuleVariables539); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end entryRuleVariables


    // $ANTLR start ruleVariables
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:271:1: ruleVariables : ( ( rule__Variables__Alternatives ) ) ;
    public final void ruleVariables() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:275:2: ( ( ( rule__Variables__Alternatives ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:276:1: ( ( rule__Variables__Alternatives ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:276:1: ( ( rule__Variables__Alternatives ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:277:1: ( rule__Variables__Alternatives )
            {
             before(grammarAccess.getVariablesAccess().getAlternatives()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:278:1: ( rule__Variables__Alternatives )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:278:2: rule__Variables__Alternatives
            {
            pushFollow(FOLLOW_rule__Variables__Alternatives_in_ruleVariables566);
            rule__Variables__Alternatives();
            _fsp--;


            }

             after(grammarAccess.getVariablesAccess().getAlternatives()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end ruleVariables


    // $ANTLR start entryRuleUNIT
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:289:1: entryRuleUNIT : ruleUNIT EOF ;
    public final void entryRuleUNIT() throws RecognitionException {
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:289:15: ( ruleUNIT EOF )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:290:1: ruleUNIT EOF
            {
             before(grammarAccess.getUNITRule()); 
            pushFollow(FOLLOW_ruleUNIT_in_entryRuleUNIT591);
            ruleUNIT();
            _fsp--;

             after(grammarAccess.getUNITRule()); 
            match(input,EOF,FOLLOW_EOF_in_entryRuleUNIT598); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end entryRuleUNIT


    // $ANTLR start ruleUNIT
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:297:1: ruleUNIT : ( ( rule__UNIT__Group ) ) ;
    public final void ruleUNIT() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:301:2: ( ( ( rule__UNIT__Group ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:302:1: ( ( rule__UNIT__Group ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:302:1: ( ( rule__UNIT__Group ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:303:1: ( rule__UNIT__Group )
            {
             before(grammarAccess.getUNITAccess().getGroup()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:304:1: ( rule__UNIT__Group )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:304:2: rule__UNIT__Group
            {
            pushFollow(FOLLOW_rule__UNIT__Group_in_ruleUNIT625);
            rule__UNIT__Group();
            _fsp--;


            }

             after(grammarAccess.getUNITAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end ruleUNIT


    // $ANTLR start entryRule_String
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:315:1: entryRule_String : rule_String EOF ;
    public final void entryRule_String() throws RecognitionException {
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:315:18: ( rule_String EOF )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:316:1: rule_String EOF
            {
             before(grammarAccess.get_StringRule()); 
            pushFollow(FOLLOW_rule_String_in_entryRule_String650);
            rule_String();
            _fsp--;

             after(grammarAccess.get_StringRule()); 
            match(input,EOF,FOLLOW_EOF_in_entryRule_String657); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end entryRule_String


    // $ANTLR start rule_String
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:323:1: rule_String : ( ( rule___String__Group ) ) ;
    public final void rule_String() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:327:2: ( ( ( rule___String__Group ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:328:1: ( ( rule___String__Group ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:328:1: ( ( rule___String__Group ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:329:1: ( rule___String__Group )
            {
             before(grammarAccess.get_StringAccess().getGroup()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:330:1: ( rule___String__Group )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:330:2: rule___String__Group
            {
            pushFollow(FOLLOW_rule___String__Group_in_rule_String684);
            rule___String__Group();
            _fsp--;


            }

             after(grammarAccess.get_StringAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule_String


    // $ANTLR start entryRule_int
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:341:1: entryRule_int : rule_int EOF ;
    public final void entryRule_int() throws RecognitionException {
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:341:15: ( rule_int EOF )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:342:1: rule_int EOF
            {
             before(grammarAccess.get_intRule()); 
            pushFollow(FOLLOW_rule_int_in_entryRule_int709);
            rule_int();
            _fsp--;

             after(grammarAccess.get_intRule()); 
            match(input,EOF,FOLLOW_EOF_in_entryRule_int716); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end entryRule_int


    // $ANTLR start rule_int
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:349:1: rule_int : ( ( rule___int__Group ) ) ;
    public final void rule_int() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:353:2: ( ( ( rule___int__Group ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:354:1: ( ( rule___int__Group ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:354:1: ( ( rule___int__Group ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:355:1: ( rule___int__Group )
            {
             before(grammarAccess.get_intAccess().getGroup()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:356:1: ( rule___int__Group )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:356:2: rule___int__Group
            {
            pushFollow(FOLLOW_rule___int__Group_in_rule_int743);
            rule___int__Group();
            _fsp--;


            }

             after(grammarAccess.get_intAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule_int


    // $ANTLR start entryRulenumber
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:367:1: entryRulenumber : rulenumber EOF ;
    public final void entryRulenumber() throws RecognitionException {
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:367:17: ( rulenumber EOF )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:368:1: rulenumber EOF
            {
             before(grammarAccess.getNumberRule()); 
            pushFollow(FOLLOW_rulenumber_in_entryRulenumber768);
            rulenumber();
            _fsp--;

             after(grammarAccess.getNumberRule()); 
            match(input,EOF,FOLLOW_EOF_in_entryRulenumber775); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end entryRulenumber


    // $ANTLR start rulenumber
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:375:1: rulenumber : ( ( rule__Number__Group ) ) ;
    public final void rulenumber() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:379:2: ( ( ( rule__Number__Group ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:380:1: ( ( rule__Number__Group ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:380:1: ( ( rule__Number__Group ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:381:1: ( rule__Number__Group )
            {
             before(grammarAccess.getNumberAccess().getGroup()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:382:1: ( rule__Number__Group )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:382:2: rule__Number__Group
            {
            pushFollow(FOLLOW_rule__Number__Group_in_rulenumber802);
            rule__Number__Group();
            _fsp--;


            }

             after(grammarAccess.getNumberAccess().getGroup()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rulenumber


    // $ANTLR start rule__Type__Alternatives
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:393:1: rule__Type__Alternatives : ( ( rulePublic ) | ( rulePrivate ) );
    public final void rule__Type__Alternatives() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:397:1: ( ( rulePublic ) | ( rulePrivate ) )
            int alt1=2;
            int LA1_0 = input.LA(1);

            if ( (LA1_0==13) ) {
                alt1=1;
            }
            else if ( (LA1_0==14) ) {
                alt1=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("393:1: rule__Type__Alternatives : ( ( rulePublic ) | ( rulePrivate ) );", 1, 0, input);

                throw nvae;
            }
            switch (alt1) {
                case 1 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:398:1: ( rulePublic )
                    {
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:398:1: ( rulePublic )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:399:1: rulePublic
                    {
                     before(grammarAccess.getTypeAccess().getPublicParserRuleCall_0()); 
                    pushFollow(FOLLOW_rulePublic_in_rule__Type__Alternatives837);
                    rulePublic();
                    _fsp--;

                     after(grammarAccess.getTypeAccess().getPublicParserRuleCall_0()); 

                    }


                    }
                    break;
                case 2 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:403:6: ( rulePrivate )
                    {
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:403:6: ( rulePrivate )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:404:1: rulePrivate
                    {
                     before(grammarAccess.getTypeAccess().getPrivateParserRuleCall_1()); 
                    pushFollow(FOLLOW_rulePrivate_in_rule__Type__Alternatives853);
                    rulePrivate();
                    _fsp--;

                     after(grammarAccess.getTypeAccess().getPrivateParserRuleCall_1()); 

                    }


                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Type__Alternatives


    // $ANTLR start rule__Property__Alternatives
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:413:1: rule__Property__Alternatives : ( ( ruleVariables ) | ( ruleFunction ) );
    public final void rule__Property__Alternatives() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:417:1: ( ( ruleVariables ) | ( ruleFunction ) )
            int alt2=2;
            int LA2_0 = input.LA(1);

            if ( (LA2_0==22) ) {
                alt2=1;
            }
            else if ( (LA2_0==19) ) {
                alt2=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("413:1: rule__Property__Alternatives : ( ( ruleVariables ) | ( ruleFunction ) );", 2, 0, input);

                throw nvae;
            }
            switch (alt2) {
                case 1 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:418:1: ( ruleVariables )
                    {
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:418:1: ( ruleVariables )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:419:1: ruleVariables
                    {
                     before(grammarAccess.getPropertyAccess().getVariablesParserRuleCall_0()); 
                    pushFollow(FOLLOW_ruleVariables_in_rule__Property__Alternatives884);
                    ruleVariables();
                    _fsp--;

                     after(grammarAccess.getPropertyAccess().getVariablesParserRuleCall_0()); 

                    }


                    }
                    break;
                case 2 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:423:6: ( ruleFunction )
                    {
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:423:6: ( ruleFunction )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:424:1: ruleFunction
                    {
                     before(grammarAccess.getPropertyAccess().getFunctionParserRuleCall_1()); 
                    pushFollow(FOLLOW_ruleFunction_in_rule__Property__Alternatives900);
                    ruleFunction();
                    _fsp--;

                     after(grammarAccess.getPropertyAccess().getFunctionParserRuleCall_1()); 

                    }


                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Property__Alternatives


    // $ANTLR start rule__Public__Alternatives
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:433:1: rule__Public__Alternatives : ( ( ( rule__Public__Group_0 ) ) | ( ( rule__Public__Group_1 ) ) | ( ( rule__Public__Group_2 ) ) );
    public final void rule__Public__Alternatives() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:437:1: ( ( ( rule__Public__Group_0 ) ) | ( ( rule__Public__Group_1 ) ) | ( ( rule__Public__Group_2 ) ) )
            int alt3=3;
            int LA3_0 = input.LA(1);

            if ( (LA3_0==13) ) {
                switch ( input.LA(2) ) {
                case 15:
                    {
                    alt3=1;
                    }
                    break;
                case 22:
                    {
                    alt3=3;
                    }
                    break;
                case 19:
                    {
                    alt3=2;
                    }
                    break;
                default:
                    NoViableAltException nvae =
                        new NoViableAltException("433:1: rule__Public__Alternatives : ( ( ( rule__Public__Group_0 ) ) | ( ( rule__Public__Group_1 ) ) | ( ( rule__Public__Group_2 ) ) );", 3, 1, input);

                    throw nvae;
                }

            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("433:1: rule__Public__Alternatives : ( ( ( rule__Public__Group_0 ) ) | ( ( rule__Public__Group_1 ) ) | ( ( rule__Public__Group_2 ) ) );", 3, 0, input);

                throw nvae;
            }
            switch (alt3) {
                case 1 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:438:1: ( ( rule__Public__Group_0 ) )
                    {
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:438:1: ( ( rule__Public__Group_0 ) )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:439:1: ( rule__Public__Group_0 )
                    {
                     before(grammarAccess.getPublicAccess().getGroup_0()); 
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:440:1: ( rule__Public__Group_0 )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:440:2: rule__Public__Group_0
                    {
                    pushFollow(FOLLOW_rule__Public__Group_0_in_rule__Public__Alternatives931);
                    rule__Public__Group_0();
                    _fsp--;


                    }

                     after(grammarAccess.getPublicAccess().getGroup_0()); 

                    }


                    }
                    break;
                case 2 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:443:6: ( ( rule__Public__Group_1 ) )
                    {
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:443:6: ( ( rule__Public__Group_1 ) )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:444:1: ( rule__Public__Group_1 )
                    {
                     before(grammarAccess.getPublicAccess().getGroup_1()); 
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:445:1: ( rule__Public__Group_1 )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:445:2: rule__Public__Group_1
                    {
                    pushFollow(FOLLOW_rule__Public__Group_1_in_rule__Public__Alternatives948);
                    rule__Public__Group_1();
                    _fsp--;


                    }

                     after(grammarAccess.getPublicAccess().getGroup_1()); 

                    }


                    }
                    break;
                case 3 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:448:6: ( ( rule__Public__Group_2 ) )
                    {
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:448:6: ( ( rule__Public__Group_2 ) )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:449:1: ( rule__Public__Group_2 )
                    {
                     before(grammarAccess.getPublicAccess().getGroup_2()); 
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:450:1: ( rule__Public__Group_2 )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:450:2: rule__Public__Group_2
                    {
                    pushFollow(FOLLOW_rule__Public__Group_2_in_rule__Public__Alternatives965);
                    rule__Public__Group_2();
                    _fsp--;


                    }

                     after(grammarAccess.getPublicAccess().getGroup_2()); 

                    }


                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Public__Alternatives


    // $ANTLR start rule__Private__Alternatives
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:458:1: rule__Private__Alternatives : ( ( ( rule__Private__Group_0 ) ) | ( ( rule__Private__Group_1 ) ) | ( ( rule__Private__Group_2 ) ) );
    public final void rule__Private__Alternatives() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:462:1: ( ( ( rule__Private__Group_0 ) ) | ( ( rule__Private__Group_1 ) ) | ( ( rule__Private__Group_2 ) ) )
            int alt4=3;
            int LA4_0 = input.LA(1);

            if ( (LA4_0==14) ) {
                switch ( input.LA(2) ) {
                case 15:
                    {
                    alt4=1;
                    }
                    break;
                case 19:
                    {
                    alt4=2;
                    }
                    break;
                case 22:
                    {
                    alt4=3;
                    }
                    break;
                default:
                    NoViableAltException nvae =
                        new NoViableAltException("458:1: rule__Private__Alternatives : ( ( ( rule__Private__Group_0 ) ) | ( ( rule__Private__Group_1 ) ) | ( ( rule__Private__Group_2 ) ) );", 4, 1, input);

                    throw nvae;
                }

            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("458:1: rule__Private__Alternatives : ( ( ( rule__Private__Group_0 ) ) | ( ( rule__Private__Group_1 ) ) | ( ( rule__Private__Group_2 ) ) );", 4, 0, input);

                throw nvae;
            }
            switch (alt4) {
                case 1 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:463:1: ( ( rule__Private__Group_0 ) )
                    {
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:463:1: ( ( rule__Private__Group_0 ) )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:464:1: ( rule__Private__Group_0 )
                    {
                     before(grammarAccess.getPrivateAccess().getGroup_0()); 
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:465:1: ( rule__Private__Group_0 )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:465:2: rule__Private__Group_0
                    {
                    pushFollow(FOLLOW_rule__Private__Group_0_in_rule__Private__Alternatives997);
                    rule__Private__Group_0();
                    _fsp--;


                    }

                     after(grammarAccess.getPrivateAccess().getGroup_0()); 

                    }


                    }
                    break;
                case 2 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:468:6: ( ( rule__Private__Group_1 ) )
                    {
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:468:6: ( ( rule__Private__Group_1 ) )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:469:1: ( rule__Private__Group_1 )
                    {
                     before(grammarAccess.getPrivateAccess().getGroup_1()); 
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:470:1: ( rule__Private__Group_1 )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:470:2: rule__Private__Group_1
                    {
                    pushFollow(FOLLOW_rule__Private__Group_1_in_rule__Private__Alternatives1014);
                    rule__Private__Group_1();
                    _fsp--;


                    }

                     after(grammarAccess.getPrivateAccess().getGroup_1()); 

                    }


                    }
                    break;
                case 3 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:473:6: ( ( rule__Private__Group_2 ) )
                    {
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:473:6: ( ( rule__Private__Group_2 ) )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:474:1: ( rule__Private__Group_2 )
                    {
                     before(grammarAccess.getPrivateAccess().getGroup_2()); 
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:475:1: ( rule__Private__Group_2 )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:475:2: rule__Private__Group_2
                    {
                    pushFollow(FOLLOW_rule__Private__Group_2_in_rule__Private__Alternatives1031);
                    rule__Private__Group_2();
                    _fsp--;


                    }

                     after(grammarAccess.getPrivateAccess().getGroup_2()); 

                    }


                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Private__Alternatives


    // $ANTLR start rule__Variables__Alternatives
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:483:1: rule__Variables__Alternatives : ( ( ( rule__Variables__Group_0 ) ) | ( ( rule__Variables__Group_1 ) ) | ( ( rule__Variables__Group_2 ) ) | ( ( rule__Variables__Group_3 ) ) );
    public final void rule__Variables__Alternatives() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:487:1: ( ( ( rule__Variables__Group_0 ) ) | ( ( rule__Variables__Group_1 ) ) | ( ( rule__Variables__Group_2 ) ) | ( ( rule__Variables__Group_3 ) ) )
            int alt5=4;
            int LA5_0 = input.LA(1);

            if ( (LA5_0==22) ) {
                int LA5_1 = input.LA(2);

                if ( (LA5_1==RULE_ID) ) {
                    int LA5_2 = input.LA(3);

                    if ( (LA5_2==23) ) {
                        switch ( input.LA(4) ) {
                        case 31:
                            {
                            alt5=4;
                            }
                            break;
                        case 24:
                            {
                            alt5=1;
                            }
                            break;
                        case 27:
                            {
                            alt5=2;
                            }
                            break;
                        case 29:
                            {
                            alt5=3;
                            }
                            break;
                        default:
                            NoViableAltException nvae =
                                new NoViableAltException("483:1: rule__Variables__Alternatives : ( ( ( rule__Variables__Group_0 ) ) | ( ( rule__Variables__Group_1 ) ) | ( ( rule__Variables__Group_2 ) ) | ( ( rule__Variables__Group_3 ) ) );", 5, 3, input);

                            throw nvae;
                        }

                    }
                    else {
                        NoViableAltException nvae =
                            new NoViableAltException("483:1: rule__Variables__Alternatives : ( ( ( rule__Variables__Group_0 ) ) | ( ( rule__Variables__Group_1 ) ) | ( ( rule__Variables__Group_2 ) ) | ( ( rule__Variables__Group_3 ) ) );", 5, 2, input);

                        throw nvae;
                    }
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("483:1: rule__Variables__Alternatives : ( ( ( rule__Variables__Group_0 ) ) | ( ( rule__Variables__Group_1 ) ) | ( ( rule__Variables__Group_2 ) ) | ( ( rule__Variables__Group_3 ) ) );", 5, 1, input);

                    throw nvae;
                }
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("483:1: rule__Variables__Alternatives : ( ( ( rule__Variables__Group_0 ) ) | ( ( rule__Variables__Group_1 ) ) | ( ( rule__Variables__Group_2 ) ) | ( ( rule__Variables__Group_3 ) ) );", 5, 0, input);

                throw nvae;
            }
            switch (alt5) {
                case 1 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:488:1: ( ( rule__Variables__Group_0 ) )
                    {
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:488:1: ( ( rule__Variables__Group_0 ) )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:489:1: ( rule__Variables__Group_0 )
                    {
                     before(grammarAccess.getVariablesAccess().getGroup_0()); 
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:490:1: ( rule__Variables__Group_0 )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:490:2: rule__Variables__Group_0
                    {
                    pushFollow(FOLLOW_rule__Variables__Group_0_in_rule__Variables__Alternatives1063);
                    rule__Variables__Group_0();
                    _fsp--;


                    }

                     after(grammarAccess.getVariablesAccess().getGroup_0()); 

                    }


                    }
                    break;
                case 2 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:493:6: ( ( rule__Variables__Group_1 ) )
                    {
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:493:6: ( ( rule__Variables__Group_1 ) )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:494:1: ( rule__Variables__Group_1 )
                    {
                     before(grammarAccess.getVariablesAccess().getGroup_1()); 
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:495:1: ( rule__Variables__Group_1 )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:495:2: rule__Variables__Group_1
                    {
                    pushFollow(FOLLOW_rule__Variables__Group_1_in_rule__Variables__Alternatives1080);
                    rule__Variables__Group_1();
                    _fsp--;


                    }

                     after(grammarAccess.getVariablesAccess().getGroup_1()); 

                    }


                    }
                    break;
                case 3 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:498:6: ( ( rule__Variables__Group_2 ) )
                    {
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:498:6: ( ( rule__Variables__Group_2 ) )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:499:1: ( rule__Variables__Group_2 )
                    {
                     before(grammarAccess.getVariablesAccess().getGroup_2()); 
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:500:1: ( rule__Variables__Group_2 )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:500:2: rule__Variables__Group_2
                    {
                    pushFollow(FOLLOW_rule__Variables__Group_2_in_rule__Variables__Alternatives1097);
                    rule__Variables__Group_2();
                    _fsp--;


                    }

                     after(grammarAccess.getVariablesAccess().getGroup_2()); 

                    }


                    }
                    break;
                case 4 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:503:6: ( ( rule__Variables__Group_3 ) )
                    {
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:503:6: ( ( rule__Variables__Group_3 ) )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:504:1: ( rule__Variables__Group_3 )
                    {
                     before(grammarAccess.getVariablesAccess().getGroup_3()); 
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:505:1: ( rule__Variables__Group_3 )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:505:2: rule__Variables__Group_3
                    {
                    pushFollow(FOLLOW_rule__Variables__Group_3_in_rule__Variables__Alternatives1114);
                    rule__Variables__Group_3();
                    _fsp--;


                    }

                     after(grammarAccess.getVariablesAccess().getGroup_3()); 

                    }


                    }
                    break;

            }
        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Variables__Alternatives


    // $ANTLR start rule__Model__Group
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:514:1: rule__Model__Group : ( ( ( ruleImport ) )* ) ( ( ( ruleType ) )* ) ;
    public final void rule__Model__Group() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:518:1: ( ( ( ( ruleImport ) )* ) ( ( ( ruleType ) )* ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:519:1: ( ( ( ruleImport ) )* ) ( ( ( ruleType ) )* )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:519:1: ( ( ( ruleImport ) )* )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:520:1: ( ( ruleImport ) )*
            {
             before(grammarAccess.getModelAccess().getImportsAssignment_0()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:521:1: ( ( ruleImport ) )*
            loop6:
            do {
                int alt6=2;
                int LA6_0 = input.LA(1);

                if ( (LA6_0==11) ) {
                    alt6=1;
                }


                switch (alt6) {
            	case 1 :
            	    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:522:1: ( ruleImport )
            	    {
            	    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:522:1: ( ruleImport )
            	    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:523:1: ruleImport
            	    {
            	     before(grammarAccess.getModelAccess().getImportsImportParserRuleCall_0_0()); 
            	    pushFollow(FOLLOW_ruleImport_in_rule__Model__Group1154);
            	    ruleImport();
            	    _fsp--;

            	     after(grammarAccess.getModelAccess().getImportsImportParserRuleCall_0_0()); 

            	    }


            	    }
            	    break;

            	default :
            	    break loop6;
                }
            } while (true);

             after(grammarAccess.getModelAccess().getImportsAssignment_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:529:1: ( ( ( ruleType ) )* )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:530:1: ( ( ruleType ) )*
            {
             before(grammarAccess.getModelAccess().getElementsAssignment_1()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:531:1: ( ( ruleType ) )*
            loop7:
            do {
                int alt7=2;
                int LA7_0 = input.LA(1);

                if ( ((LA7_0>=13 && LA7_0<=14)) ) {
                    alt7=1;
                }


                switch (alt7) {
            	case 1 :
            	    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:532:1: ( ruleType )
            	    {
            	    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:532:1: ( ruleType )
            	    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:533:1: ruleType
            	    {
            	     before(grammarAccess.getModelAccess().getElementsTypeParserRuleCall_1_0()); 
            	    pushFollow(FOLLOW_ruleType_in_rule__Model__Group1179);
            	    ruleType();
            	    _fsp--;

            	     after(grammarAccess.getModelAccess().getElementsTypeParserRuleCall_1_0()); 

            	    }


            	    }
            	    break;

            	default :
            	    break loop7;
                }
            } while (true);

             after(grammarAccess.getModelAccess().getElementsAssignment_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Model__Group


    // $ANTLR start rule__Import__Group
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:545:1: rule__Import__Group : ( 'import' ) ( ( ( RULE_STRING ) ) ) ( ';' ) ;
    public final void rule__Import__Group() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:549:1: ( ( 'import' ) ( ( ( RULE_STRING ) ) ) ( ';' ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:550:1: ( 'import' ) ( ( ( RULE_STRING ) ) ) ( ';' )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:550:1: ( 'import' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:551:1: 'import'
            {
             before(grammarAccess.getImportAccess().getImportKeyword_0()); 
            match(input,11,FOLLOW_11_in_rule__Import__Group1219); 
             after(grammarAccess.getImportAccess().getImportKeyword_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:556:1: ( ( ( RULE_STRING ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:557:1: ( ( RULE_STRING ) )
            {
             before(grammarAccess.getImportAccess().getImportURIAssignment_1()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:558:1: ( ( RULE_STRING ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:559:1: ( RULE_STRING )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:559:1: ( RULE_STRING )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:560:1: RULE_STRING
            {
             before(grammarAccess.getImportAccess().getImportURISTRINGTerminalRuleCall_1_0()); 
            match(input,RULE_STRING,FOLLOW_RULE_STRING_in_rule__Import__Group1238); 
             after(grammarAccess.getImportAccess().getImportURISTRINGTerminalRuleCall_1_0()); 

            }


            }

             after(grammarAccess.getImportAccess().getImportURIAssignment_1()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:566:1: ( ';' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:567:1: ';'
            {
             before(grammarAccess.getImportAccess().getSemicolonKeyword_2()); 
            match(input,12,FOLLOW_12_in_rule__Import__Group1256); 
             after(grammarAccess.getImportAccess().getSemicolonKeyword_2()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Import__Group


    // $ANTLR start rule__Public__Group_0
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:578:1: rule__Public__Group_0 : ( 'public' ) ( ruleClass ) ;
    public final void rule__Public__Group_0() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:582:1: ( ( 'public' ) ( ruleClass ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:583:1: ( 'public' ) ( ruleClass )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:583:1: ( 'public' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:584:1: 'public'
            {
             before(grammarAccess.getPublicAccess().getPublicKeyword_0_0()); 
            match(input,13,FOLLOW_13_in_rule__Public__Group_01290); 
             after(grammarAccess.getPublicAccess().getPublicKeyword_0_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:589:1: ( ruleClass )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:590:1: ruleClass
            {
             before(grammarAccess.getPublicAccess().getClassParserRuleCall_0_1()); 
            pushFollow(FOLLOW_ruleClass_in_rule__Public__Group_01302);
            ruleClass();
            _fsp--;

             after(grammarAccess.getPublicAccess().getClassParserRuleCall_0_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Public__Group_0


    // $ANTLR start rule__Public__Group_1
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:599:1: rule__Public__Group_1 : ( 'public' ) ( ruleFunction ) ;
    public final void rule__Public__Group_1() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:603:1: ( ( 'public' ) ( ruleFunction ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:604:1: ( 'public' ) ( ruleFunction )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:604:1: ( 'public' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:605:1: 'public'
            {
             before(grammarAccess.getPublicAccess().getPublicKeyword_1_0()); 
            match(input,13,FOLLOW_13_in_rule__Public__Group_11334); 
             after(grammarAccess.getPublicAccess().getPublicKeyword_1_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:610:1: ( ruleFunction )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:611:1: ruleFunction
            {
             before(grammarAccess.getPublicAccess().getFunctionParserRuleCall_1_1()); 
            pushFollow(FOLLOW_ruleFunction_in_rule__Public__Group_11346);
            ruleFunction();
            _fsp--;

             after(grammarAccess.getPublicAccess().getFunctionParserRuleCall_1_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Public__Group_1


    // $ANTLR start rule__Public__Group_2
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:620:1: rule__Public__Group_2 : ( 'public' ) ( ruleVariables ) ;
    public final void rule__Public__Group_2() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:624:1: ( ( 'public' ) ( ruleVariables ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:625:1: ( 'public' ) ( ruleVariables )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:625:1: ( 'public' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:626:1: 'public'
            {
             before(grammarAccess.getPublicAccess().getPublicKeyword_2_0()); 
            match(input,13,FOLLOW_13_in_rule__Public__Group_21378); 
             after(grammarAccess.getPublicAccess().getPublicKeyword_2_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:631:1: ( ruleVariables )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:632:1: ruleVariables
            {
             before(grammarAccess.getPublicAccess().getVariablesParserRuleCall_2_1()); 
            pushFollow(FOLLOW_ruleVariables_in_rule__Public__Group_21390);
            ruleVariables();
            _fsp--;

             after(grammarAccess.getPublicAccess().getVariablesParserRuleCall_2_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Public__Group_2


    // $ANTLR start rule__Private__Group_0
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:641:1: rule__Private__Group_0 : ( 'private' ) ( ruleClass ) ;
    public final void rule__Private__Group_0() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:645:1: ( ( 'private' ) ( ruleClass ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:646:1: ( 'private' ) ( ruleClass )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:646:1: ( 'private' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:647:1: 'private'
            {
             before(grammarAccess.getPrivateAccess().getPrivateKeyword_0_0()); 
            match(input,14,FOLLOW_14_in_rule__Private__Group_01422); 
             after(grammarAccess.getPrivateAccess().getPrivateKeyword_0_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:652:1: ( ruleClass )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:653:1: ruleClass
            {
             before(grammarAccess.getPrivateAccess().getClassParserRuleCall_0_1()); 
            pushFollow(FOLLOW_ruleClass_in_rule__Private__Group_01434);
            ruleClass();
            _fsp--;

             after(grammarAccess.getPrivateAccess().getClassParserRuleCall_0_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Private__Group_0


    // $ANTLR start rule__Private__Group_1
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:662:1: rule__Private__Group_1 : ( 'private' ) ( ruleFunction ) ;
    public final void rule__Private__Group_1() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:666:1: ( ( 'private' ) ( ruleFunction ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:667:1: ( 'private' ) ( ruleFunction )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:667:1: ( 'private' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:668:1: 'private'
            {
             before(grammarAccess.getPrivateAccess().getPrivateKeyword_1_0()); 
            match(input,14,FOLLOW_14_in_rule__Private__Group_11466); 
             after(grammarAccess.getPrivateAccess().getPrivateKeyword_1_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:673:1: ( ruleFunction )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:674:1: ruleFunction
            {
             before(grammarAccess.getPrivateAccess().getFunctionParserRuleCall_1_1()); 
            pushFollow(FOLLOW_ruleFunction_in_rule__Private__Group_11478);
            ruleFunction();
            _fsp--;

             after(grammarAccess.getPrivateAccess().getFunctionParserRuleCall_1_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Private__Group_1


    // $ANTLR start rule__Private__Group_2
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:683:1: rule__Private__Group_2 : ( 'private' ) ( ruleVariables ) ;
    public final void rule__Private__Group_2() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:687:1: ( ( 'private' ) ( ruleVariables ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:688:1: ( 'private' ) ( ruleVariables )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:688:1: ( 'private' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:689:1: 'private'
            {
             before(grammarAccess.getPrivateAccess().getPrivateKeyword_2_0()); 
            match(input,14,FOLLOW_14_in_rule__Private__Group_21510); 
             after(grammarAccess.getPrivateAccess().getPrivateKeyword_2_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:694:1: ( ruleVariables )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:695:1: ruleVariables
            {
             before(grammarAccess.getPrivateAccess().getVariablesParserRuleCall_2_1()); 
            pushFollow(FOLLOW_ruleVariables_in_rule__Private__Group_21522);
            ruleVariables();
            _fsp--;

             after(grammarAccess.getPrivateAccess().getVariablesParserRuleCall_2_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Private__Group_2


    // $ANTLR start rule__Class__Group
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:704:1: rule__Class__Group : ( 'class' ) ( ( ( RULE_ID ) ) ) ( ( rule__Class__Group_2 )? ) ( '{' ) ( ( ( ruleProperty ) )* ) ( '}' ) ;
    public final void rule__Class__Group() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:708:1: ( ( 'class' ) ( ( ( RULE_ID ) ) ) ( ( rule__Class__Group_2 )? ) ( '{' ) ( ( ( ruleProperty ) )* ) ( '}' ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:709:1: ( 'class' ) ( ( ( RULE_ID ) ) ) ( ( rule__Class__Group_2 )? ) ( '{' ) ( ( ( ruleProperty ) )* ) ( '}' )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:709:1: ( 'class' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:710:1: 'class'
            {
             before(grammarAccess.getClassAccess().getClassKeyword_0()); 
            match(input,15,FOLLOW_15_in_rule__Class__Group1554); 
             after(grammarAccess.getClassAccess().getClassKeyword_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:715:1: ( ( ( RULE_ID ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:716:1: ( ( RULE_ID ) )
            {
             before(grammarAccess.getClassAccess().getNameAssignment_1()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:717:1: ( ( RULE_ID ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:718:1: ( RULE_ID )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:718:1: ( RULE_ID )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:719:1: RULE_ID
            {
             before(grammarAccess.getClassAccess().getNameIDTerminalRuleCall_1_0()); 
            match(input,RULE_ID,FOLLOW_RULE_ID_in_rule__Class__Group1573); 
             after(grammarAccess.getClassAccess().getNameIDTerminalRuleCall_1_0()); 

            }


            }

             after(grammarAccess.getClassAccess().getNameAssignment_1()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:725:1: ( ( rule__Class__Group_2 )? )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:726:1: ( rule__Class__Group_2 )?
            {
             before(grammarAccess.getClassAccess().getGroup_2()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:727:1: ( rule__Class__Group_2 )?
            int alt8=2;
            int LA8_0 = input.LA(1);

            if ( (LA8_0==18) ) {
                alt8=1;
            }
            switch (alt8) {
                case 1 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:727:2: rule__Class__Group_2
                    {
                    pushFollow(FOLLOW_rule__Class__Group_2_in_rule__Class__Group1590);
                    rule__Class__Group_2();
                    _fsp--;


                    }
                    break;

            }

             after(grammarAccess.getClassAccess().getGroup_2()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:729:1: ( '{' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:730:1: '{'
            {
             before(grammarAccess.getClassAccess().getLeftCurlyBracketKeyword_3()); 
            match(input,16,FOLLOW_16_in_rule__Class__Group1603); 
             after(grammarAccess.getClassAccess().getLeftCurlyBracketKeyword_3()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:735:1: ( ( ( ruleProperty ) )* )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:736:1: ( ( ruleProperty ) )*
            {
             before(grammarAccess.getClassAccess().getPropertiesAssignment_4()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:737:1: ( ( ruleProperty ) )*
            loop9:
            do {
                int alt9=2;
                int LA9_0 = input.LA(1);

                if ( (LA9_0==19||LA9_0==22) ) {
                    alt9=1;
                }


                switch (alt9) {
            	case 1 :
            	    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:738:1: ( ruleProperty )
            	    {
            	    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:738:1: ( ruleProperty )
            	    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:739:1: ruleProperty
            	    {
            	     before(grammarAccess.getClassAccess().getPropertiesPropertyParserRuleCall_4_0()); 
            	    pushFollow(FOLLOW_ruleProperty_in_rule__Class__Group1622);
            	    ruleProperty();
            	    _fsp--;

            	     after(grammarAccess.getClassAccess().getPropertiesPropertyParserRuleCall_4_0()); 

            	    }


            	    }
            	    break;

            	default :
            	    break loop9;
                }
            } while (true);

             after(grammarAccess.getClassAccess().getPropertiesAssignment_4()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:745:1: ( '}' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:746:1: '}'
            {
             before(grammarAccess.getClassAccess().getRightCurlyBracketKeyword_5()); 
            match(input,17,FOLLOW_17_in_rule__Class__Group1641); 
             after(grammarAccess.getClassAccess().getRightCurlyBracketKeyword_5()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Class__Group


    // $ANTLR start rule__Class__Group_2
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:757:1: rule__Class__Group_2 : ( 'extends' ) ( ( ( ( RULE_ID ) ) ) ) ;
    public final void rule__Class__Group_2() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:761:1: ( ( 'extends' ) ( ( ( ( RULE_ID ) ) ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:762:1: ( 'extends' ) ( ( ( ( RULE_ID ) ) ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:762:1: ( 'extends' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:763:1: 'extends'
            {
             before(grammarAccess.getClassAccess().getExtendsKeyword_2_0()); 
            match(input,18,FOLLOW_18_in_rule__Class__Group_21675); 
             after(grammarAccess.getClassAccess().getExtendsKeyword_2_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:768:1: ( ( ( ( RULE_ID ) ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:769:1: ( ( ( RULE_ID ) ) )
            {
             before(grammarAccess.getClassAccess().getSuperClassAssignment_2_1()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:770:1: ( ( ( RULE_ID ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:771:1: ( ( RULE_ID ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:771:1: ( ( RULE_ID ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:772:1: ( RULE_ID )
            {
             before(grammarAccess.getClassAccess().getSuperClassClassCrossReference_2_1_0()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:773:1: ( RULE_ID )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:774:1: RULE_ID
            {
             before(grammarAccess.getClassAccess().getSuperClassClassIDTerminalRuleCall_2_1_0_1()); 
            match(input,RULE_ID,FOLLOW_RULE_ID_in_rule__Class__Group_21698); 
             after(grammarAccess.getClassAccess().getSuperClassClassIDTerminalRuleCall_2_1_0_1()); 

            }

             after(grammarAccess.getClassAccess().getSuperClassClassCrossReference_2_1_0()); 

            }


            }

             after(grammarAccess.getClassAccess().getSuperClassAssignment_2_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Class__Group_2


    // $ANTLR start rule__Function__Group
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:788:1: rule__Function__Group : ( 'function' ) ( ( ( RULE_ID ) ) ) ( '(' ) ( ')' ) ( '{' ) ( '}' ) ;
    public final void rule__Function__Group() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:792:1: ( ( 'function' ) ( ( ( RULE_ID ) ) ) ( '(' ) ( ')' ) ( '{' ) ( '}' ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:793:1: ( 'function' ) ( ( ( RULE_ID ) ) ) ( '(' ) ( ')' ) ( '{' ) ( '}' )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:793:1: ( 'function' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:794:1: 'function'
            {
             before(grammarAccess.getFunctionAccess().getFunctionKeyword_0()); 
            match(input,19,FOLLOW_19_in_rule__Function__Group1741); 
             after(grammarAccess.getFunctionAccess().getFunctionKeyword_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:799:1: ( ( ( RULE_ID ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:800:1: ( ( RULE_ID ) )
            {
             before(grammarAccess.getFunctionAccess().getNameAssignment_1()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:801:1: ( ( RULE_ID ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:802:1: ( RULE_ID )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:802:1: ( RULE_ID )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:803:1: RULE_ID
            {
             before(grammarAccess.getFunctionAccess().getNameIDTerminalRuleCall_1_0()); 
            match(input,RULE_ID,FOLLOW_RULE_ID_in_rule__Function__Group1760); 
             after(grammarAccess.getFunctionAccess().getNameIDTerminalRuleCall_1_0()); 

            }


            }

             after(grammarAccess.getFunctionAccess().getNameAssignment_1()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:809:1: ( '(' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:810:1: '('
            {
             before(grammarAccess.getFunctionAccess().getLeftParenthesisKeyword_2()); 
            match(input,20,FOLLOW_20_in_rule__Function__Group1778); 
             after(grammarAccess.getFunctionAccess().getLeftParenthesisKeyword_2()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:815:1: ( ')' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:816:1: ')'
            {
             before(grammarAccess.getFunctionAccess().getRightParenthesisKeyword_3()); 
            match(input,21,FOLLOW_21_in_rule__Function__Group1791); 
             after(grammarAccess.getFunctionAccess().getRightParenthesisKeyword_3()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:821:1: ( '{' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:822:1: '{'
            {
             before(grammarAccess.getFunctionAccess().getLeftCurlyBracketKeyword_4()); 
            match(input,16,FOLLOW_16_in_rule__Function__Group1804); 
             after(grammarAccess.getFunctionAccess().getLeftCurlyBracketKeyword_4()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:827:1: ( '}' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:828:1: '}'
            {
             before(grammarAccess.getFunctionAccess().getRightCurlyBracketKeyword_5()); 
            match(input,17,FOLLOW_17_in_rule__Function__Group1817); 
             after(grammarAccess.getFunctionAccess().getRightCurlyBracketKeyword_5()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Function__Group


    // $ANTLR start rule__Variables__Group_0
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:839:1: rule__Variables__Group_0 : ( 'var' ) ( ruleUNIT ) ;
    public final void rule__Variables__Group_0() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:843:1: ( ( 'var' ) ( ruleUNIT ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:844:1: ( 'var' ) ( ruleUNIT )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:844:1: ( 'var' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:845:1: 'var'
            {
             before(grammarAccess.getVariablesAccess().getVarKeyword_0_0()); 
            match(input,22,FOLLOW_22_in_rule__Variables__Group_01851); 
             after(grammarAccess.getVariablesAccess().getVarKeyword_0_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:850:1: ( ruleUNIT )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:851:1: ruleUNIT
            {
             before(grammarAccess.getVariablesAccess().getUNITParserRuleCall_0_1()); 
            pushFollow(FOLLOW_ruleUNIT_in_rule__Variables__Group_01863);
            ruleUNIT();
            _fsp--;

             after(grammarAccess.getVariablesAccess().getUNITParserRuleCall_0_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Variables__Group_0


    // $ANTLR start rule__Variables__Group_1
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:860:1: rule__Variables__Group_1 : ( 'var' ) ( rule_String ) ;
    public final void rule__Variables__Group_1() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:864:1: ( ( 'var' ) ( rule_String ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:865:1: ( 'var' ) ( rule_String )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:865:1: ( 'var' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:866:1: 'var'
            {
             before(grammarAccess.getVariablesAccess().getVarKeyword_1_0()); 
            match(input,22,FOLLOW_22_in_rule__Variables__Group_11895); 
             after(grammarAccess.getVariablesAccess().getVarKeyword_1_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:871:1: ( rule_String )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:872:1: rule_String
            {
             before(grammarAccess.getVariablesAccess().get_StringParserRuleCall_1_1()); 
            pushFollow(FOLLOW_rule_String_in_rule__Variables__Group_11907);
            rule_String();
            _fsp--;

             after(grammarAccess.getVariablesAccess().get_StringParserRuleCall_1_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Variables__Group_1


    // $ANTLR start rule__Variables__Group_2
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:881:1: rule__Variables__Group_2 : ( 'var' ) ( rule_int ) ;
    public final void rule__Variables__Group_2() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:885:1: ( ( 'var' ) ( rule_int ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:886:1: ( 'var' ) ( rule_int )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:886:1: ( 'var' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:887:1: 'var'
            {
             before(grammarAccess.getVariablesAccess().getVarKeyword_2_0()); 
            match(input,22,FOLLOW_22_in_rule__Variables__Group_21939); 
             after(grammarAccess.getVariablesAccess().getVarKeyword_2_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:892:1: ( rule_int )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:893:1: rule_int
            {
             before(grammarAccess.getVariablesAccess().get_intParserRuleCall_2_1()); 
            pushFollow(FOLLOW_rule_int_in_rule__Variables__Group_21951);
            rule_int();
            _fsp--;

             after(grammarAccess.getVariablesAccess().get_intParserRuleCall_2_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Variables__Group_2


    // $ANTLR start rule__Variables__Group_3
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:902:1: rule__Variables__Group_3 : ( 'var' ) ( rulenumber ) ;
    public final void rule__Variables__Group_3() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:906:1: ( ( 'var' ) ( rulenumber ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:907:1: ( 'var' ) ( rulenumber )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:907:1: ( 'var' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:908:1: 'var'
            {
             before(grammarAccess.getVariablesAccess().getVarKeyword_3_0()); 
            match(input,22,FOLLOW_22_in_rule__Variables__Group_31983); 
             after(grammarAccess.getVariablesAccess().getVarKeyword_3_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:913:1: ( rulenumber )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:914:1: rulenumber
            {
             before(grammarAccess.getVariablesAccess().getNumberParserRuleCall_3_1()); 
            pushFollow(FOLLOW_rulenumber_in_rule__Variables__Group_31995);
            rulenumber();
            _fsp--;

             after(grammarAccess.getVariablesAccess().getNumberParserRuleCall_3_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Variables__Group_3


    // $ANTLR start rule__UNIT__Group
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:923:1: rule__UNIT__Group : ( ( ( RULE_ID ) ) ) ( ':' ) ( 'unit' ) ( ( rule__UNIT__Group_3 )? ) ( ';' ) ;
    public final void rule__UNIT__Group() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:927:1: ( ( ( ( RULE_ID ) ) ) ( ':' ) ( 'unit' ) ( ( rule__UNIT__Group_3 )? ) ( ';' ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:928:1: ( ( ( RULE_ID ) ) ) ( ':' ) ( 'unit' ) ( ( rule__UNIT__Group_3 )? ) ( ';' )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:928:1: ( ( ( RULE_ID ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:929:1: ( ( RULE_ID ) )
            {
             before(grammarAccess.getUNITAccess().getNameAssignment_0()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:930:1: ( ( RULE_ID ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:931:1: ( RULE_ID )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:931:1: ( RULE_ID )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:932:1: RULE_ID
            {
             before(grammarAccess.getUNITAccess().getNameIDTerminalRuleCall_0_0()); 
            match(input,RULE_ID,FOLLOW_RULE_ID_in_rule__UNIT__Group2033); 
             after(grammarAccess.getUNITAccess().getNameIDTerminalRuleCall_0_0()); 

            }


            }

             after(grammarAccess.getUNITAccess().getNameAssignment_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:938:1: ( ':' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:939:1: ':'
            {
             before(grammarAccess.getUNITAccess().getColonKeyword_1()); 
            match(input,23,FOLLOW_23_in_rule__UNIT__Group2051); 
             after(grammarAccess.getUNITAccess().getColonKeyword_1()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:944:1: ( 'unit' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:945:1: 'unit'
            {
             before(grammarAccess.getUNITAccess().getUnitKeyword_2()); 
            match(input,24,FOLLOW_24_in_rule__UNIT__Group2064); 
             after(grammarAccess.getUNITAccess().getUnitKeyword_2()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:950:1: ( ( rule__UNIT__Group_3 )? )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:951:1: ( rule__UNIT__Group_3 )?
            {
             before(grammarAccess.getUNITAccess().getGroup_3()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:952:1: ( rule__UNIT__Group_3 )?
            int alt10=2;
            int LA10_0 = input.LA(1);

            if ( (LA10_0==25) ) {
                alt10=1;
            }
            switch (alt10) {
                case 1 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:952:2: rule__UNIT__Group_3
                    {
                    pushFollow(FOLLOW_rule__UNIT__Group_3_in_rule__UNIT__Group2076);
                    rule__UNIT__Group_3();
                    _fsp--;


                    }
                    break;

            }

             after(grammarAccess.getUNITAccess().getGroup_3()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:954:1: ( ';' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:955:1: ';'
            {
             before(grammarAccess.getUNITAccess().getSemicolonKeyword_4()); 
            match(input,12,FOLLOW_12_in_rule__UNIT__Group2089); 
             after(grammarAccess.getUNITAccess().getSemicolonKeyword_4()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__UNIT__Group


    // $ANTLR start rule__UNIT__Group_3
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:966:1: rule__UNIT__Group_3 : ( '=' ) ( ( ( ( '0x000000' ) ) ) ) ;
    public final void rule__UNIT__Group_3() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:970:1: ( ( '=' ) ( ( ( ( '0x000000' ) ) ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:971:1: ( '=' ) ( ( ( ( '0x000000' ) ) ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:971:1: ( '=' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:972:1: '='
            {
             before(grammarAccess.getUNITAccess().getEqualsSignKeyword_3_0()); 
            match(input,25,FOLLOW_25_in_rule__UNIT__Group_32123); 
             after(grammarAccess.getUNITAccess().getEqualsSignKeyword_3_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:977:1: ( ( ( ( '0x000000' ) ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:978:1: ( ( ( '0x000000' ) ) )
            {
             before(grammarAccess.getUNITAccess().getStringAssignment_3_1()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:979:1: ( ( ( '0x000000' ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:980:1: ( ( '0x000000' ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:980:1: ( ( '0x000000' ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:981:1: ( '0x000000' )
            {
             before(grammarAccess.getUNITAccess().getString0x000000Keyword_3_1_0()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:982:1: ( '0x000000' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:983:1: '0x000000'
            {
             before(grammarAccess.getUNITAccess().getString0x000000Keyword_3_1_0()); 
            match(input,26,FOLLOW_26_in_rule__UNIT__Group_32147); 
             after(grammarAccess.getUNITAccess().getString0x000000Keyword_3_1_0()); 

            }

             after(grammarAccess.getUNITAccess().getString0x000000Keyword_3_1_0()); 

            }


            }

             after(grammarAccess.getUNITAccess().getStringAssignment_3_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__UNIT__Group_3


    // $ANTLR start rule___String__Group
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1000:1: rule___String__Group : ( ( ( RULE_ID ) ) ) ( ':' ) ( 'String' ) ( ( rule___String__Group_3 )? ) ( ';' ) ;
    public final void rule___String__Group() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1004:1: ( ( ( ( RULE_ID ) ) ) ( ':' ) ( 'String' ) ( ( rule___String__Group_3 )? ) ( ';' ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1005:1: ( ( ( RULE_ID ) ) ) ( ':' ) ( 'String' ) ( ( rule___String__Group_3 )? ) ( ';' )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1005:1: ( ( ( RULE_ID ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1006:1: ( ( RULE_ID ) )
            {
             before(grammarAccess.get_StringAccess().getNameAssignment_0()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1007:1: ( ( RULE_ID ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1008:1: ( RULE_ID )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1008:1: ( RULE_ID )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1009:1: RULE_ID
            {
             before(grammarAccess.get_StringAccess().getNameIDTerminalRuleCall_0_0()); 
            match(input,RULE_ID,FOLLOW_RULE_ID_in_rule___String__Group2199); 
             after(grammarAccess.get_StringAccess().getNameIDTerminalRuleCall_0_0()); 

            }


            }

             after(grammarAccess.get_StringAccess().getNameAssignment_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1015:1: ( ':' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1016:1: ':'
            {
             before(grammarAccess.get_StringAccess().getColonKeyword_1()); 
            match(input,23,FOLLOW_23_in_rule___String__Group2217); 
             after(grammarAccess.get_StringAccess().getColonKeyword_1()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1021:1: ( 'String' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1022:1: 'String'
            {
             before(grammarAccess.get_StringAccess().getStringKeyword_2()); 
            match(input,27,FOLLOW_27_in_rule___String__Group2230); 
             after(grammarAccess.get_StringAccess().getStringKeyword_2()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1027:1: ( ( rule___String__Group_3 )? )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1028:1: ( rule___String__Group_3 )?
            {
             before(grammarAccess.get_StringAccess().getGroup_3()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1029:1: ( rule___String__Group_3 )?
            int alt11=2;
            int LA11_0 = input.LA(1);

            if ( (LA11_0==25) ) {
                alt11=1;
            }
            switch (alt11) {
                case 1 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1029:2: rule___String__Group_3
                    {
                    pushFollow(FOLLOW_rule___String__Group_3_in_rule___String__Group2242);
                    rule___String__Group_3();
                    _fsp--;


                    }
                    break;

            }

             after(grammarAccess.get_StringAccess().getGroup_3()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1031:1: ( ';' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1032:1: ';'
            {
             before(grammarAccess.get_StringAccess().getSemicolonKeyword_4()); 
            match(input,12,FOLLOW_12_in_rule___String__Group2255); 
             after(grammarAccess.get_StringAccess().getSemicolonKeyword_4()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule___String__Group


    // $ANTLR start rule___String__Group_3
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1043:1: rule___String__Group_3 : ( '=' ) ( ( ( ( '' ) ) )? ) ;
    public final void rule___String__Group_3() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1047:1: ( ( '=' ) ( ( ( ( '' ) ) )? ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1048:1: ( '=' ) ( ( ( ( '' ) ) )? )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1048:1: ( '=' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1049:1: '='
            {
             before(grammarAccess.get_StringAccess().getEqualsSignKeyword_3_0()); 
            match(input,25,FOLLOW_25_in_rule___String__Group_32289); 
             after(grammarAccess.get_StringAccess().getEqualsSignKeyword_3_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1054:1: ( ( ( ( '' ) ) )? )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1055:1: ( ( ( '' ) ) )?
            {
             before(grammarAccess.get_StringAccess().getStringAssignment_3_1()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1056:1: ( ( ( '' ) ) )?
            int alt12=2;
            int LA12_0 = input.LA(1);

            if ( (LA12_0==28) ) {
                alt12=1;
            }
            switch (alt12) {
                case 1 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1057:1: ( ( '' ) )
                    {
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1057:1: ( ( '' ) )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1058:1: ( '' )
                    {
                     before(grammarAccess.get_StringAccess().getStringKeyword_3_1_0()); 
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1059:1: ( '' )
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1060:1: ''
                    {
                     before(grammarAccess.get_StringAccess().getStringKeyword_3_1_0()); 
                    match(input,28,FOLLOW_28_in_rule___String__Group_32313); 
                     after(grammarAccess.get_StringAccess().getStringKeyword_3_1_0()); 

                    }

                     after(grammarAccess.get_StringAccess().getStringKeyword_3_1_0()); 

                    }


                    }
                    break;

            }

             after(grammarAccess.get_StringAccess().getStringAssignment_3_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule___String__Group_3


    // $ANTLR start rule___int__Group
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1077:1: rule___int__Group : ( ( ( RULE_ID ) ) ) ( ':' ) ( 'int' ) ( ( rule___int__Group_3 )? ) ( ';' ) ;
    public final void rule___int__Group() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1081:1: ( ( ( ( RULE_ID ) ) ) ( ':' ) ( 'int' ) ( ( rule___int__Group_3 )? ) ( ';' ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1082:1: ( ( ( RULE_ID ) ) ) ( ':' ) ( 'int' ) ( ( rule___int__Group_3 )? ) ( ';' )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1082:1: ( ( ( RULE_ID ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1083:1: ( ( RULE_ID ) )
            {
             before(grammarAccess.get_intAccess().getNameAssignment_0()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1084:1: ( ( RULE_ID ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1085:1: ( RULE_ID )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1085:1: ( RULE_ID )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1086:1: RULE_ID
            {
             before(grammarAccess.get_intAccess().getNameIDTerminalRuleCall_0_0()); 
            match(input,RULE_ID,FOLLOW_RULE_ID_in_rule___int__Group2366); 
             after(grammarAccess.get_intAccess().getNameIDTerminalRuleCall_0_0()); 

            }


            }

             after(grammarAccess.get_intAccess().getNameAssignment_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1092:1: ( ':' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1093:1: ':'
            {
             before(grammarAccess.get_intAccess().getColonKeyword_1()); 
            match(input,23,FOLLOW_23_in_rule___int__Group2384); 
             after(grammarAccess.get_intAccess().getColonKeyword_1()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1098:1: ( 'int' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1099:1: 'int'
            {
             before(grammarAccess.get_intAccess().getIntKeyword_2()); 
            match(input,29,FOLLOW_29_in_rule___int__Group2397); 
             after(grammarAccess.get_intAccess().getIntKeyword_2()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1104:1: ( ( rule___int__Group_3 )? )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1105:1: ( rule___int__Group_3 )?
            {
             before(grammarAccess.get_intAccess().getGroup_3()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1106:1: ( rule___int__Group_3 )?
            int alt13=2;
            int LA13_0 = input.LA(1);

            if ( (LA13_0==25) ) {
                alt13=1;
            }
            switch (alt13) {
                case 1 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1106:2: rule___int__Group_3
                    {
                    pushFollow(FOLLOW_rule___int__Group_3_in_rule___int__Group2409);
                    rule___int__Group_3();
                    _fsp--;


                    }
                    break;

            }

             after(grammarAccess.get_intAccess().getGroup_3()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1108:1: ( ';' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1109:1: ';'
            {
             before(grammarAccess.get_intAccess().getSemicolonKeyword_4()); 
            match(input,12,FOLLOW_12_in_rule___int__Group2422); 
             after(grammarAccess.get_intAccess().getSemicolonKeyword_4()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule___int__Group


    // $ANTLR start rule___int__Group_3
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1120:1: rule___int__Group_3 : ( '=' ) ( ( ( ( '0' ) ) ) ) ;
    public final void rule___int__Group_3() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1124:1: ( ( '=' ) ( ( ( ( '0' ) ) ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1125:1: ( '=' ) ( ( ( ( '0' ) ) ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1125:1: ( '=' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1126:1: '='
            {
             before(grammarAccess.get_intAccess().getEqualsSignKeyword_3_0()); 
            match(input,25,FOLLOW_25_in_rule___int__Group_32456); 
             after(grammarAccess.get_intAccess().getEqualsSignKeyword_3_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1131:1: ( ( ( ( '0' ) ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1132:1: ( ( ( '0' ) ) )
            {
             before(grammarAccess.get_intAccess().getIntAssignment_3_1()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1133:1: ( ( ( '0' ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1134:1: ( ( '0' ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1134:1: ( ( '0' ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1135:1: ( '0' )
            {
             before(grammarAccess.get_intAccess().getInt0Keyword_3_1_0()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1136:1: ( '0' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1137:1: '0'
            {
             before(grammarAccess.get_intAccess().getInt0Keyword_3_1_0()); 
            match(input,30,FOLLOW_30_in_rule___int__Group_32480); 
             after(grammarAccess.get_intAccess().getInt0Keyword_3_1_0()); 

            }

             after(grammarAccess.get_intAccess().getInt0Keyword_3_1_0()); 

            }


            }

             after(grammarAccess.get_intAccess().getIntAssignment_3_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule___int__Group_3


    // $ANTLR start rule__Number__Group
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1154:1: rule__Number__Group : ( ( ( RULE_ID ) ) ) ( ':' ) ( 'Number' ) ( ( rule__Number__Group_3 )? ) ( ';' ) ;
    public final void rule__Number__Group() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1158:1: ( ( ( ( RULE_ID ) ) ) ( ':' ) ( 'Number' ) ( ( rule__Number__Group_3 )? ) ( ';' ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1159:1: ( ( ( RULE_ID ) ) ) ( ':' ) ( 'Number' ) ( ( rule__Number__Group_3 )? ) ( ';' )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1159:1: ( ( ( RULE_ID ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1160:1: ( ( RULE_ID ) )
            {
             before(grammarAccess.getNumberAccess().getNameAssignment_0()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1161:1: ( ( RULE_ID ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1162:1: ( RULE_ID )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1162:1: ( RULE_ID )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1163:1: RULE_ID
            {
             before(grammarAccess.getNumberAccess().getNameIDTerminalRuleCall_0_0()); 
            match(input,RULE_ID,FOLLOW_RULE_ID_in_rule__Number__Group2532); 
             after(grammarAccess.getNumberAccess().getNameIDTerminalRuleCall_0_0()); 

            }


            }

             after(grammarAccess.getNumberAccess().getNameAssignment_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1169:1: ( ':' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1170:1: ':'
            {
             before(grammarAccess.getNumberAccess().getColonKeyword_1()); 
            match(input,23,FOLLOW_23_in_rule__Number__Group2550); 
             after(grammarAccess.getNumberAccess().getColonKeyword_1()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1175:1: ( 'Number' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1176:1: 'Number'
            {
             before(grammarAccess.getNumberAccess().getNumberKeyword_2()); 
            match(input,31,FOLLOW_31_in_rule__Number__Group2563); 
             after(grammarAccess.getNumberAccess().getNumberKeyword_2()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1181:1: ( ( rule__Number__Group_3 )? )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1182:1: ( rule__Number__Group_3 )?
            {
             before(grammarAccess.getNumberAccess().getGroup_3()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1183:1: ( rule__Number__Group_3 )?
            int alt14=2;
            int LA14_0 = input.LA(1);

            if ( (LA14_0==25) ) {
                alt14=1;
            }
            switch (alt14) {
                case 1 :
                    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1183:2: rule__Number__Group_3
                    {
                    pushFollow(FOLLOW_rule__Number__Group_3_in_rule__Number__Group2575);
                    rule__Number__Group_3();
                    _fsp--;


                    }
                    break;

            }

             after(grammarAccess.getNumberAccess().getGroup_3()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1185:1: ( ';' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1186:1: ';'
            {
             before(grammarAccess.getNumberAccess().getSemicolonKeyword_4()); 
            match(input,12,FOLLOW_12_in_rule__Number__Group2588); 
             after(grammarAccess.getNumberAccess().getSemicolonKeyword_4()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Number__Group


    // $ANTLR start rule__Number__Group_3
    // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1197:1: rule__Number__Group_3 : ( '=' ) ( ( ( ( '0' ) ) ) ) ;
    public final void rule__Number__Group_3() throws RecognitionException {

        		int stackSize = keepStackSize();
            
        try {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1201:1: ( ( '=' ) ( ( ( ( '0' ) ) ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1202:1: ( '=' ) ( ( ( ( '0' ) ) ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1202:1: ( '=' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1203:1: '='
            {
             before(grammarAccess.getNumberAccess().getEqualsSignKeyword_3_0()); 
            match(input,25,FOLLOW_25_in_rule__Number__Group_32622); 
             after(grammarAccess.getNumberAccess().getEqualsSignKeyword_3_0()); 

            }

            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1208:1: ( ( ( ( '0' ) ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1209:1: ( ( ( '0' ) ) )
            {
             before(grammarAccess.getNumberAccess().getDoubleAssignment_3_1()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1210:1: ( ( ( '0' ) ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1211:1: ( ( '0' ) )
            {
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1211:1: ( ( '0' ) )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1212:1: ( '0' )
            {
             before(grammarAccess.getNumberAccess().getDouble0Keyword_3_1_0()); 
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1213:1: ( '0' )
            // ../org.xtext.actionscript.as3os.ui/src-gen/org/xtext/actionscript/contentassist/antlr/internal/Internalactionscript3.g:1214:1: '0'
            {
             before(grammarAccess.getNumberAccess().getDouble0Keyword_3_1_0()); 
            match(input,30,FOLLOW_30_in_rule__Number__Group_32646); 
             after(grammarAccess.getNumberAccess().getDouble0Keyword_3_1_0()); 

            }

             after(grammarAccess.getNumberAccess().getDouble0Keyword_3_1_0()); 

            }


            }

             after(grammarAccess.getNumberAccess().getDoubleAssignment_3_1()); 

            }


            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {

            	restoreStackSize(stackSize);

        }
        return ;
    }
    // $ANTLR end rule__Number__Group_3


 

    public static final BitSet FOLLOW_ruleModel_in_entryRuleModel60 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRuleModel67 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Model__Group_in_ruleModel94 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleImport_in_entryRuleImport119 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRuleImport126 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Import__Group_in_ruleImport153 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleType_in_entryRuleType178 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRuleType185 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Type__Alternatives_in_ruleType212 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleProperty_in_entryRuleProperty237 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRuleProperty244 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Property__Alternatives_in_ruleProperty271 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rulePublic_in_entryRulePublic296 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRulePublic303 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Public__Alternatives_in_rulePublic330 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rulePrivate_in_entryRulePrivate355 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRulePrivate362 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Private__Alternatives_in_rulePrivate389 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleClass_in_entryRuleClass414 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRuleClass421 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Class__Group_in_ruleClass448 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleFunction_in_entryRuleFunction473 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRuleFunction480 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Function__Group_in_ruleFunction507 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleVariables_in_entryRuleVariables532 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRuleVariables539 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Variables__Alternatives_in_ruleVariables566 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleUNIT_in_entryRuleUNIT591 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRuleUNIT598 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__UNIT__Group_in_ruleUNIT625 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule_String_in_entryRule_String650 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRule_String657 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule___String__Group_in_rule_String684 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule_int_in_entryRule_int709 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRule_int716 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule___int__Group_in_rule_int743 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rulenumber_in_entryRulenumber768 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_entryRulenumber775 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Number__Group_in_rulenumber802 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rulePublic_in_rule__Type__Alternatives837 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rulePrivate_in_rule__Type__Alternatives853 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleVariables_in_rule__Property__Alternatives884 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleFunction_in_rule__Property__Alternatives900 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Public__Group_0_in_rule__Public__Alternatives931 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Public__Group_1_in_rule__Public__Alternatives948 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Public__Group_2_in_rule__Public__Alternatives965 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Private__Group_0_in_rule__Private__Alternatives997 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Private__Group_1_in_rule__Private__Alternatives1014 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Private__Group_2_in_rule__Private__Alternatives1031 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Variables__Group_0_in_rule__Variables__Alternatives1063 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Variables__Group_1_in_rule__Variables__Alternatives1080 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Variables__Group_2_in_rule__Variables__Alternatives1097 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_rule__Variables__Group_3_in_rule__Variables__Alternatives1114 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_ruleImport_in_rule__Model__Group1154 = new BitSet(new long[]{0x0000000000006802L});
    public static final BitSet FOLLOW_ruleType_in_rule__Model__Group1179 = new BitSet(new long[]{0x0000000000006002L});
    public static final BitSet FOLLOW_11_in_rule__Import__Group1219 = new BitSet(new long[]{0x0000000000000010L});
    public static final BitSet FOLLOW_RULE_STRING_in_rule__Import__Group1238 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_12_in_rule__Import__Group1256 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_13_in_rule__Public__Group_01290 = new BitSet(new long[]{0x0000000000008000L});
    public static final BitSet FOLLOW_ruleClass_in_rule__Public__Group_01302 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_13_in_rule__Public__Group_11334 = new BitSet(new long[]{0x0000000000080000L});
    public static final BitSet FOLLOW_ruleFunction_in_rule__Public__Group_11346 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_13_in_rule__Public__Group_21378 = new BitSet(new long[]{0x0000000000400000L});
    public static final BitSet FOLLOW_ruleVariables_in_rule__Public__Group_21390 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_14_in_rule__Private__Group_01422 = new BitSet(new long[]{0x0000000000008000L});
    public static final BitSet FOLLOW_ruleClass_in_rule__Private__Group_01434 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_14_in_rule__Private__Group_11466 = new BitSet(new long[]{0x0000000000080000L});
    public static final BitSet FOLLOW_ruleFunction_in_rule__Private__Group_11478 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_14_in_rule__Private__Group_21510 = new BitSet(new long[]{0x0000000000400000L});
    public static final BitSet FOLLOW_ruleVariables_in_rule__Private__Group_21522 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_15_in_rule__Class__Group1554 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_RULE_ID_in_rule__Class__Group1573 = new BitSet(new long[]{0x0000000000050000L});
    public static final BitSet FOLLOW_rule__Class__Group_2_in_rule__Class__Group1590 = new BitSet(new long[]{0x0000000000010000L});
    public static final BitSet FOLLOW_16_in_rule__Class__Group1603 = new BitSet(new long[]{0x00000000004A0000L});
    public static final BitSet FOLLOW_ruleProperty_in_rule__Class__Group1622 = new BitSet(new long[]{0x00000000004A0000L});
    public static final BitSet FOLLOW_17_in_rule__Class__Group1641 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_18_in_rule__Class__Group_21675 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_RULE_ID_in_rule__Class__Group_21698 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_19_in_rule__Function__Group1741 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_RULE_ID_in_rule__Function__Group1760 = new BitSet(new long[]{0x0000000000100000L});
    public static final BitSet FOLLOW_20_in_rule__Function__Group1778 = new BitSet(new long[]{0x0000000000200000L});
    public static final BitSet FOLLOW_21_in_rule__Function__Group1791 = new BitSet(new long[]{0x0000000000010000L});
    public static final BitSet FOLLOW_16_in_rule__Function__Group1804 = new BitSet(new long[]{0x0000000000020000L});
    public static final BitSet FOLLOW_17_in_rule__Function__Group1817 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_22_in_rule__Variables__Group_01851 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_ruleUNIT_in_rule__Variables__Group_01863 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_22_in_rule__Variables__Group_11895 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_rule_String_in_rule__Variables__Group_11907 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_22_in_rule__Variables__Group_21939 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_rule_int_in_rule__Variables__Group_21951 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_22_in_rule__Variables__Group_31983 = new BitSet(new long[]{0x0000000000000020L});
    public static final BitSet FOLLOW_rulenumber_in_rule__Variables__Group_31995 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_RULE_ID_in_rule__UNIT__Group2033 = new BitSet(new long[]{0x0000000000800000L});
    public static final BitSet FOLLOW_23_in_rule__UNIT__Group2051 = new BitSet(new long[]{0x0000000001000000L});
    public static final BitSet FOLLOW_24_in_rule__UNIT__Group2064 = new BitSet(new long[]{0x0000000002001000L});
    public static final BitSet FOLLOW_rule__UNIT__Group_3_in_rule__UNIT__Group2076 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_12_in_rule__UNIT__Group2089 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_25_in_rule__UNIT__Group_32123 = new BitSet(new long[]{0x0000000004000000L});
    public static final BitSet FOLLOW_26_in_rule__UNIT__Group_32147 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_RULE_ID_in_rule___String__Group2199 = new BitSet(new long[]{0x0000000000800000L});
    public static final BitSet FOLLOW_23_in_rule___String__Group2217 = new BitSet(new long[]{0x0000000008000000L});
    public static final BitSet FOLLOW_27_in_rule___String__Group2230 = new BitSet(new long[]{0x0000000002001000L});
    public static final BitSet FOLLOW_rule___String__Group_3_in_rule___String__Group2242 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_12_in_rule___String__Group2255 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_25_in_rule___String__Group_32289 = new BitSet(new long[]{0x0000000010000002L});
    public static final BitSet FOLLOW_28_in_rule___String__Group_32313 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_RULE_ID_in_rule___int__Group2366 = new BitSet(new long[]{0x0000000000800000L});
    public static final BitSet FOLLOW_23_in_rule___int__Group2384 = new BitSet(new long[]{0x0000000020000000L});
    public static final BitSet FOLLOW_29_in_rule___int__Group2397 = new BitSet(new long[]{0x0000000002001000L});
    public static final BitSet FOLLOW_rule___int__Group_3_in_rule___int__Group2409 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_12_in_rule___int__Group2422 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_25_in_rule___int__Group_32456 = new BitSet(new long[]{0x0000000040000000L});
    public static final BitSet FOLLOW_30_in_rule___int__Group_32480 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_RULE_ID_in_rule__Number__Group2532 = new BitSet(new long[]{0x0000000000800000L});
    public static final BitSet FOLLOW_23_in_rule__Number__Group2550 = new BitSet(new long[]{0x0000000080000000L});
    public static final BitSet FOLLOW_31_in_rule__Number__Group2563 = new BitSet(new long[]{0x0000000002001000L});
    public static final BitSet FOLLOW_rule__Number__Group_3_in_rule__Number__Group2575 = new BitSet(new long[]{0x0000000000001000L});
    public static final BitSet FOLLOW_12_in_rule__Number__Group2588 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_25_in_rule__Number__Group_32622 = new BitSet(new long[]{0x0000000040000000L});
    public static final BitSet FOLLOW_30_in_rule__Number__Group_32646 = new BitSet(new long[]{0x0000000000000002L});

}
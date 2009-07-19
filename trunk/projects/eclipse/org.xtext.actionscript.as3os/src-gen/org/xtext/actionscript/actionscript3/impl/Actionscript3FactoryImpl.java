/**
 * <copyright>
 * </copyright>
 *

 */
package org.xtext.actionscript.actionscript3.impl;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;

import org.eclipse.emf.ecore.impl.EFactoryImpl;

import org.eclipse.emf.ecore.plugin.EcorePlugin;

import org.xtext.actionscript.actionscript3.Actionscript3Factory;
import org.xtext.actionscript.actionscript3.Actionscript3Package;
import org.xtext.actionscript.actionscript3.Function;
import org.xtext.actionscript.actionscript3.Import;
import org.xtext.actionscript.actionscript3.Model;
import org.xtext.actionscript.actionscript3.Private;
import org.xtext.actionscript.actionscript3.Property;
import org.xtext.actionscript.actionscript3.Public;
import org.xtext.actionscript.actionscript3.Type;
import org.xtext.actionscript.actionscript3.UNIT;
import org.xtext.actionscript.actionscript3.Variables;
import org.xtext.actionscript.actionscript3._String;
import org.xtext.actionscript.actionscript3._int;
import org.xtext.actionscript.actionscript3.number;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model <b>Factory</b>.
 * <!-- end-user-doc -->
 * @generated
 */
public class Actionscript3FactoryImpl extends EFactoryImpl implements Actionscript3Factory
{
  /**
   * Creates the default factory implementation.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public static Actionscript3Factory init()
  {
    try
    {
      Actionscript3Factory theActionscript3Factory = (Actionscript3Factory)EPackage.Registry.INSTANCE.getEFactory("http://www.xtext.org/actionscript/actionscript3"); 
      if (theActionscript3Factory != null)
      {
        return theActionscript3Factory;
      }
    }
    catch (Exception exception)
    {
      EcorePlugin.INSTANCE.log(exception);
    }
    return new Actionscript3FactoryImpl();
  }

  /**
   * Creates an instance of the factory.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Actionscript3FactoryImpl()
  {
    super();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  @Override
  public EObject create(EClass eClass)
  {
    switch (eClass.getClassifierID())
    {
      case Actionscript3Package.MODEL: return createModel();
      case Actionscript3Package.IMPORT: return createImport();
      case Actionscript3Package.TYPE: return createType();
      case Actionscript3Package.PROPERTY: return createProperty();
      case Actionscript3Package.PUBLIC: return createPublic();
      case Actionscript3Package.PRIVATE: return createPrivate();
      case Actionscript3Package.CLASS: return createClass();
      case Actionscript3Package.FUNCTION: return createFunction();
      case Actionscript3Package.VARIABLES: return createVariables();
      case Actionscript3Package.UNIT: return createUNIT();
      case Actionscript3Package._STRING: return create_String();
      case Actionscript3Package._INT: return create_int();
      case Actionscript3Package.NUMBER: return createnumber();
      default:
        throw new IllegalArgumentException("The class '" + eClass.getName() + "' is not a valid classifier");
    }
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Model createModel()
  {
    ModelImpl model = new ModelImpl();
    return model;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Import createImport()
  {
    ImportImpl import_ = new ImportImpl();
    return import_;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Type createType()
  {
    TypeImpl type = new TypeImpl();
    return type;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Property createProperty()
  {
    PropertyImpl property = new PropertyImpl();
    return property;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Public createPublic()
  {
    PublicImpl public_ = new PublicImpl();
    return public_;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Private createPrivate()
  {
    PrivateImpl private_ = new PrivateImpl();
    return private_;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public org.xtext.actionscript.actionscript3.Class createClass()
  {
    ClassImpl class_ = new ClassImpl();
    return class_;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Function createFunction()
  {
    FunctionImpl function = new FunctionImpl();
    return function;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Variables createVariables()
  {
    VariablesImpl variables = new VariablesImpl();
    return variables;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public UNIT createUNIT()
  {
    UNITImpl unit = new UNITImpl();
    return unit;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public _String create_String()
  {
    _StringImpl _String = new _StringImpl();
    return _String;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public _int create_int()
  {
    _intImpl _int = new _intImpl();
    return _int;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public number createnumber()
  {
    numberImpl number = new numberImpl();
    return number;
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  public Actionscript3Package getActionscript3Package()
  {
    return (Actionscript3Package)getEPackage();
  }

  /**
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @deprecated
   * @generated
   */
  @Deprecated
  public static Actionscript3Package getPackage()
  {
    return Actionscript3Package.eINSTANCE;
  }

} //Actionscript3FactoryImpl

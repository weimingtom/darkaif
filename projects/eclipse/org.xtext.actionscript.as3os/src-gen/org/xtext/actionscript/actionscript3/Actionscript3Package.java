/**
 * <copyright>
 * </copyright>
 *

 */
package org.xtext.actionscript.actionscript3;

import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.EReference;

/**
 * <!-- begin-user-doc -->
 * The <b>Package</b> for the model.
 * It contains accessors for the meta objects to represent
 * <ul>
 *   <li>each class,</li>
 *   <li>each feature of each class,</li>
 *   <li>each enum,</li>
 *   <li>and each data type</li>
 * </ul>
 * <!-- end-user-doc -->
 * @see org.xtext.actionscript.actionscript3.Actionscript3Factory
 * @model kind="package"
 * @generated
 */
public interface Actionscript3Package extends EPackage
{
  /**
   * The package name.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  String eNAME = "actionscript3";

  /**
   * The package namespace URI.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  String eNS_URI = "http://www.xtext.org/actionscript/actionscript3";

  /**
   * The package namespace name.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  String eNS_PREFIX = "actionscript3";

  /**
   * The singleton instance of the package.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  Actionscript3Package eINSTANCE = org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl.init();

  /**
   * The meta object id for the '{@link org.xtext.actionscript.actionscript3.impl.ModelImpl <em>Model</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.actionscript.actionscript3.impl.ModelImpl
   * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getModel()
   * @generated
   */
  int MODEL = 0;

  /**
   * The feature id for the '<em><b>Imports</b></em>' containment reference list.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int MODEL__IMPORTS = 0;

  /**
   * The feature id for the '<em><b>Elements</b></em>' containment reference list.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int MODEL__ELEMENTS = 1;

  /**
   * The number of structural features of the '<em>Model</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int MODEL_FEATURE_COUNT = 2;

  /**
   * The meta object id for the '{@link org.xtext.actionscript.actionscript3.impl.ImportImpl <em>Import</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.actionscript.actionscript3.impl.ImportImpl
   * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getImport()
   * @generated
   */
  int IMPORT = 1;

  /**
   * The feature id for the '<em><b>Import URI</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int IMPORT__IMPORT_URI = 0;

  /**
   * The number of structural features of the '<em>Import</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int IMPORT_FEATURE_COUNT = 1;

  /**
   * The meta object id for the '{@link org.xtext.actionscript.actionscript3.impl.TypeImpl <em>Type</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.actionscript.actionscript3.impl.TypeImpl
   * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getType()
   * @generated
   */
  int TYPE = 2;

  /**
   * The number of structural features of the '<em>Type</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int TYPE_FEATURE_COUNT = 0;

  /**
   * The meta object id for the '{@link org.xtext.actionscript.actionscript3.impl.PropertyImpl <em>Property</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.actionscript.actionscript3.impl.PropertyImpl
   * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getProperty()
   * @generated
   */
  int PROPERTY = 3;

  /**
   * The number of structural features of the '<em>Property</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int PROPERTY_FEATURE_COUNT = 0;

  /**
   * The meta object id for the '{@link org.xtext.actionscript.actionscript3.impl.PublicImpl <em>Public</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.actionscript.actionscript3.impl.PublicImpl
   * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getPublic()
   * @generated
   */
  int PUBLIC = 4;

  /**
   * The number of structural features of the '<em>Public</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int PUBLIC_FEATURE_COUNT = TYPE_FEATURE_COUNT + 0;

  /**
   * The meta object id for the '{@link org.xtext.actionscript.actionscript3.impl.PrivateImpl <em>Private</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.actionscript.actionscript3.impl.PrivateImpl
   * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getPrivate()
   * @generated
   */
  int PRIVATE = 5;

  /**
   * The number of structural features of the '<em>Private</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int PRIVATE_FEATURE_COUNT = TYPE_FEATURE_COUNT + 0;

  /**
   * The meta object id for the '{@link org.xtext.actionscript.actionscript3.impl.ClassImpl <em>Class</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.actionscript.actionscript3.impl.ClassImpl
   * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getClass_()
   * @generated
   */
  int CLASS = 6;

  /**
   * The feature id for the '<em><b>Name</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int CLASS__NAME = PUBLIC_FEATURE_COUNT + 0;

  /**
   * The feature id for the '<em><b>Super Class</b></em>' reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int CLASS__SUPER_CLASS = PUBLIC_FEATURE_COUNT + 1;

  /**
   * The feature id for the '<em><b>Properties</b></em>' containment reference list.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int CLASS__PROPERTIES = PUBLIC_FEATURE_COUNT + 2;

  /**
   * The number of structural features of the '<em>Class</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int CLASS_FEATURE_COUNT = PUBLIC_FEATURE_COUNT + 3;

  /**
   * The meta object id for the '{@link org.xtext.actionscript.actionscript3.impl.FunctionImpl <em>Function</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.actionscript.actionscript3.impl.FunctionImpl
   * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getFunction()
   * @generated
   */
  int FUNCTION = 7;

  /**
   * The feature id for the '<em><b>Name</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int FUNCTION__NAME = PROPERTY_FEATURE_COUNT + 0;

  /**
   * The number of structural features of the '<em>Function</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int FUNCTION_FEATURE_COUNT = PROPERTY_FEATURE_COUNT + 1;

  /**
   * The meta object id for the '{@link org.xtext.actionscript.actionscript3.impl.VariablesImpl <em>Variables</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.actionscript.actionscript3.impl.VariablesImpl
   * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getVariables()
   * @generated
   */
  int VARIABLES = 8;

  /**
   * The feature id for the '<em><b>Name</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int VARIABLES__NAME = PROPERTY_FEATURE_COUNT + 0;

  /**
   * The number of structural features of the '<em>Variables</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int VARIABLES_FEATURE_COUNT = PROPERTY_FEATURE_COUNT + 1;

  /**
   * The meta object id for the '{@link org.xtext.actionscript.actionscript3.impl.UNITImpl <em>UNIT</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.actionscript.actionscript3.impl.UNITImpl
   * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getUNIT()
   * @generated
   */
  int UNIT = 9;

  /**
   * The feature id for the '<em><b>Name</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int UNIT__NAME = VARIABLES__NAME;

  /**
   * The feature id for the '<em><b>String</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int UNIT__STRING = VARIABLES_FEATURE_COUNT + 0;

  /**
   * The number of structural features of the '<em>UNIT</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int UNIT_FEATURE_COUNT = VARIABLES_FEATURE_COUNT + 1;

  /**
   * The meta object id for the '{@link org.xtext.actionscript.actionscript3.impl._StringImpl <em>String</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.actionscript.actionscript3.impl._StringImpl
   * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#get_String()
   * @generated
   */
  int _STRING = 10;

  /**
   * The feature id for the '<em><b>Name</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int _STRING__NAME = VARIABLES__NAME;

  /**
   * The feature id for the '<em><b>String</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int _STRING__STRING = VARIABLES_FEATURE_COUNT + 0;

  /**
   * The number of structural features of the '<em>String</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int _STRING_FEATURE_COUNT = VARIABLES_FEATURE_COUNT + 1;

  /**
   * The meta object id for the '{@link org.xtext.actionscript.actionscript3.impl._intImpl <em>int</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.actionscript.actionscript3.impl._intImpl
   * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#get_int()
   * @generated
   */
  int _INT = 11;

  /**
   * The feature id for the '<em><b>Name</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int _INT__NAME = VARIABLES__NAME;

  /**
   * The feature id for the '<em><b>Int</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int _INT__INT = VARIABLES_FEATURE_COUNT + 0;

  /**
   * The number of structural features of the '<em>int</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int _INT_FEATURE_COUNT = VARIABLES_FEATURE_COUNT + 1;

  /**
   * The meta object id for the '{@link org.xtext.actionscript.actionscript3.impl.numberImpl <em>number</em>}' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @see org.xtext.actionscript.actionscript3.impl.numberImpl
   * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getnumber()
   * @generated
   */
  int NUMBER = 12;

  /**
   * The feature id for the '<em><b>Name</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int NUMBER__NAME = VARIABLES__NAME;

  /**
   * The feature id for the '<em><b>Double</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int NUMBER__DOUBLE = VARIABLES_FEATURE_COUNT + 0;

  /**
   * The number of structural features of the '<em>number</em>' class.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   * @ordered
   */
  int NUMBER_FEATURE_COUNT = VARIABLES_FEATURE_COUNT + 1;


  /**
   * Returns the meta object for class '{@link org.xtext.actionscript.actionscript3.Model <em>Model</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Model</em>'.
   * @see org.xtext.actionscript.actionscript3.Model
   * @generated
   */
  EClass getModel();

  /**
   * Returns the meta object for the containment reference list '{@link org.xtext.actionscript.actionscript3.Model#getImports <em>Imports</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the containment reference list '<em>Imports</em>'.
   * @see org.xtext.actionscript.actionscript3.Model#getImports()
   * @see #getModel()
   * @generated
   */
  EReference getModel_Imports();

  /**
   * Returns the meta object for the containment reference list '{@link org.xtext.actionscript.actionscript3.Model#getElements <em>Elements</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the containment reference list '<em>Elements</em>'.
   * @see org.xtext.actionscript.actionscript3.Model#getElements()
   * @see #getModel()
   * @generated
   */
  EReference getModel_Elements();

  /**
   * Returns the meta object for class '{@link org.xtext.actionscript.actionscript3.Import <em>Import</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Import</em>'.
   * @see org.xtext.actionscript.actionscript3.Import
   * @generated
   */
  EClass getImport();

  /**
   * Returns the meta object for the attribute '{@link org.xtext.actionscript.actionscript3.Import#getImportURI <em>Import URI</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the attribute '<em>Import URI</em>'.
   * @see org.xtext.actionscript.actionscript3.Import#getImportURI()
   * @see #getImport()
   * @generated
   */
  EAttribute getImport_ImportURI();

  /**
   * Returns the meta object for class '{@link org.xtext.actionscript.actionscript3.Type <em>Type</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Type</em>'.
   * @see org.xtext.actionscript.actionscript3.Type
   * @generated
   */
  EClass getType();

  /**
   * Returns the meta object for class '{@link org.xtext.actionscript.actionscript3.Property <em>Property</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Property</em>'.
   * @see org.xtext.actionscript.actionscript3.Property
   * @generated
   */
  EClass getProperty();

  /**
   * Returns the meta object for class '{@link org.xtext.actionscript.actionscript3.Public <em>Public</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Public</em>'.
   * @see org.xtext.actionscript.actionscript3.Public
   * @generated
   */
  EClass getPublic();

  /**
   * Returns the meta object for class '{@link org.xtext.actionscript.actionscript3.Private <em>Private</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Private</em>'.
   * @see org.xtext.actionscript.actionscript3.Private
   * @generated
   */
  EClass getPrivate();

  /**
   * Returns the meta object for class '{@link org.xtext.actionscript.actionscript3.Class <em>Class</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Class</em>'.
   * @see org.xtext.actionscript.actionscript3.Class
   * @generated
   */
  EClass getClass_();

  /**
   * Returns the meta object for the attribute '{@link org.xtext.actionscript.actionscript3.Class#getName <em>Name</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the attribute '<em>Name</em>'.
   * @see org.xtext.actionscript.actionscript3.Class#getName()
   * @see #getClass_()
   * @generated
   */
  EAttribute getClass_Name();

  /**
   * Returns the meta object for the reference '{@link org.xtext.actionscript.actionscript3.Class#getSuperClass <em>Super Class</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the reference '<em>Super Class</em>'.
   * @see org.xtext.actionscript.actionscript3.Class#getSuperClass()
   * @see #getClass_()
   * @generated
   */
  EReference getClass_SuperClass();

  /**
   * Returns the meta object for the containment reference list '{@link org.xtext.actionscript.actionscript3.Class#getProperties <em>Properties</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the containment reference list '<em>Properties</em>'.
   * @see org.xtext.actionscript.actionscript3.Class#getProperties()
   * @see #getClass_()
   * @generated
   */
  EReference getClass_Properties();

  /**
   * Returns the meta object for class '{@link org.xtext.actionscript.actionscript3.Function <em>Function</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Function</em>'.
   * @see org.xtext.actionscript.actionscript3.Function
   * @generated
   */
  EClass getFunction();

  /**
   * Returns the meta object for the attribute '{@link org.xtext.actionscript.actionscript3.Function#getName <em>Name</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the attribute '<em>Name</em>'.
   * @see org.xtext.actionscript.actionscript3.Function#getName()
   * @see #getFunction()
   * @generated
   */
  EAttribute getFunction_Name();

  /**
   * Returns the meta object for class '{@link org.xtext.actionscript.actionscript3.Variables <em>Variables</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>Variables</em>'.
   * @see org.xtext.actionscript.actionscript3.Variables
   * @generated
   */
  EClass getVariables();

  /**
   * Returns the meta object for the attribute '{@link org.xtext.actionscript.actionscript3.Variables#getName <em>Name</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the attribute '<em>Name</em>'.
   * @see org.xtext.actionscript.actionscript3.Variables#getName()
   * @see #getVariables()
   * @generated
   */
  EAttribute getVariables_Name();

  /**
   * Returns the meta object for class '{@link org.xtext.actionscript.actionscript3.UNIT <em>UNIT</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>UNIT</em>'.
   * @see org.xtext.actionscript.actionscript3.UNIT
   * @generated
   */
  EClass getUNIT();

  /**
   * Returns the meta object for the attribute '{@link org.xtext.actionscript.actionscript3.UNIT#getString <em>String</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the attribute '<em>String</em>'.
   * @see org.xtext.actionscript.actionscript3.UNIT#getString()
   * @see #getUNIT()
   * @generated
   */
  EAttribute getUNIT_String();

  /**
   * Returns the meta object for class '{@link org.xtext.actionscript.actionscript3._String <em>String</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>String</em>'.
   * @see org.xtext.actionscript.actionscript3._String
   * @generated
   */
  EClass get_String();

  /**
   * Returns the meta object for the attribute '{@link org.xtext.actionscript.actionscript3._String#getString <em>String</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the attribute '<em>String</em>'.
   * @see org.xtext.actionscript.actionscript3._String#getString()
   * @see #get_String()
   * @generated
   */
  EAttribute get_String_String();

  /**
   * Returns the meta object for class '{@link org.xtext.actionscript.actionscript3._int <em>int</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>int</em>'.
   * @see org.xtext.actionscript.actionscript3._int
   * @generated
   */
  EClass get_int();

  /**
   * Returns the meta object for the attribute '{@link org.xtext.actionscript.actionscript3._int#getInt <em>Int</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the attribute '<em>Int</em>'.
   * @see org.xtext.actionscript.actionscript3._int#getInt()
   * @see #get_int()
   * @generated
   */
  EAttribute get_int_Int();

  /**
   * Returns the meta object for class '{@link org.xtext.actionscript.actionscript3.number <em>number</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for class '<em>number</em>'.
   * @see org.xtext.actionscript.actionscript3.number
   * @generated
   */
  EClass getnumber();

  /**
   * Returns the meta object for the attribute '{@link org.xtext.actionscript.actionscript3.number#getDouble <em>Double</em>}'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the meta object for the attribute '<em>Double</em>'.
   * @see org.xtext.actionscript.actionscript3.number#getDouble()
   * @see #getnumber()
   * @generated
   */
  EAttribute getnumber_Double();

  /**
   * Returns the factory that creates the instances of the model.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the factory that creates the instances of the model.
   * @generated
   */
  Actionscript3Factory getActionscript3Factory();

  /**
   * <!-- begin-user-doc -->
   * Defines literals for the meta objects that represent
   * <ul>
   *   <li>each class,</li>
   *   <li>each feature of each class,</li>
   *   <li>each enum,</li>
   *   <li>and each data type</li>
   * </ul>
   * <!-- end-user-doc -->
   * @generated
   */
  interface Literals
  {
    /**
     * The meta object literal for the '{@link org.xtext.actionscript.actionscript3.impl.ModelImpl <em>Model</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.actionscript.actionscript3.impl.ModelImpl
     * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getModel()
     * @generated
     */
    EClass MODEL = eINSTANCE.getModel();

    /**
     * The meta object literal for the '<em><b>Imports</b></em>' containment reference list feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EReference MODEL__IMPORTS = eINSTANCE.getModel_Imports();

    /**
     * The meta object literal for the '<em><b>Elements</b></em>' containment reference list feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EReference MODEL__ELEMENTS = eINSTANCE.getModel_Elements();

    /**
     * The meta object literal for the '{@link org.xtext.actionscript.actionscript3.impl.ImportImpl <em>Import</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.actionscript.actionscript3.impl.ImportImpl
     * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getImport()
     * @generated
     */
    EClass IMPORT = eINSTANCE.getImport();

    /**
     * The meta object literal for the '<em><b>Import URI</b></em>' attribute feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EAttribute IMPORT__IMPORT_URI = eINSTANCE.getImport_ImportURI();

    /**
     * The meta object literal for the '{@link org.xtext.actionscript.actionscript3.impl.TypeImpl <em>Type</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.actionscript.actionscript3.impl.TypeImpl
     * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getType()
     * @generated
     */
    EClass TYPE = eINSTANCE.getType();

    /**
     * The meta object literal for the '{@link org.xtext.actionscript.actionscript3.impl.PropertyImpl <em>Property</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.actionscript.actionscript3.impl.PropertyImpl
     * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getProperty()
     * @generated
     */
    EClass PROPERTY = eINSTANCE.getProperty();

    /**
     * The meta object literal for the '{@link org.xtext.actionscript.actionscript3.impl.PublicImpl <em>Public</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.actionscript.actionscript3.impl.PublicImpl
     * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getPublic()
     * @generated
     */
    EClass PUBLIC = eINSTANCE.getPublic();

    /**
     * The meta object literal for the '{@link org.xtext.actionscript.actionscript3.impl.PrivateImpl <em>Private</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.actionscript.actionscript3.impl.PrivateImpl
     * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getPrivate()
     * @generated
     */
    EClass PRIVATE = eINSTANCE.getPrivate();

    /**
     * The meta object literal for the '{@link org.xtext.actionscript.actionscript3.impl.ClassImpl <em>Class</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.actionscript.actionscript3.impl.ClassImpl
     * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getClass_()
     * @generated
     */
    EClass CLASS = eINSTANCE.getClass_();

    /**
     * The meta object literal for the '<em><b>Name</b></em>' attribute feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EAttribute CLASS__NAME = eINSTANCE.getClass_Name();

    /**
     * The meta object literal for the '<em><b>Super Class</b></em>' reference feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EReference CLASS__SUPER_CLASS = eINSTANCE.getClass_SuperClass();

    /**
     * The meta object literal for the '<em><b>Properties</b></em>' containment reference list feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EReference CLASS__PROPERTIES = eINSTANCE.getClass_Properties();

    /**
     * The meta object literal for the '{@link org.xtext.actionscript.actionscript3.impl.FunctionImpl <em>Function</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.actionscript.actionscript3.impl.FunctionImpl
     * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getFunction()
     * @generated
     */
    EClass FUNCTION = eINSTANCE.getFunction();

    /**
     * The meta object literal for the '<em><b>Name</b></em>' attribute feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EAttribute FUNCTION__NAME = eINSTANCE.getFunction_Name();

    /**
     * The meta object literal for the '{@link org.xtext.actionscript.actionscript3.impl.VariablesImpl <em>Variables</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.actionscript.actionscript3.impl.VariablesImpl
     * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getVariables()
     * @generated
     */
    EClass VARIABLES = eINSTANCE.getVariables();

    /**
     * The meta object literal for the '<em><b>Name</b></em>' attribute feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EAttribute VARIABLES__NAME = eINSTANCE.getVariables_Name();

    /**
     * The meta object literal for the '{@link org.xtext.actionscript.actionscript3.impl.UNITImpl <em>UNIT</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.actionscript.actionscript3.impl.UNITImpl
     * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getUNIT()
     * @generated
     */
    EClass UNIT = eINSTANCE.getUNIT();

    /**
     * The meta object literal for the '<em><b>String</b></em>' attribute feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EAttribute UNIT__STRING = eINSTANCE.getUNIT_String();

    /**
     * The meta object literal for the '{@link org.xtext.actionscript.actionscript3.impl._StringImpl <em>String</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.actionscript.actionscript3.impl._StringImpl
     * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#get_String()
     * @generated
     */
    EClass _STRING = eINSTANCE.get_String();

    /**
     * The meta object literal for the '<em><b>String</b></em>' attribute feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EAttribute _STRING__STRING = eINSTANCE.get_String_String();

    /**
     * The meta object literal for the '{@link org.xtext.actionscript.actionscript3.impl._intImpl <em>int</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.actionscript.actionscript3.impl._intImpl
     * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#get_int()
     * @generated
     */
    EClass _INT = eINSTANCE.get_int();

    /**
     * The meta object literal for the '<em><b>Int</b></em>' attribute feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EAttribute _INT__INT = eINSTANCE.get_int_Int();

    /**
     * The meta object literal for the '{@link org.xtext.actionscript.actionscript3.impl.numberImpl <em>number</em>}' class.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @see org.xtext.actionscript.actionscript3.impl.numberImpl
     * @see org.xtext.actionscript.actionscript3.impl.Actionscript3PackageImpl#getnumber()
     * @generated
     */
    EClass NUMBER = eINSTANCE.getnumber();

    /**
     * The meta object literal for the '<em><b>Double</b></em>' attribute feature.
     * <!-- begin-user-doc -->
     * <!-- end-user-doc -->
     * @generated
     */
    EAttribute NUMBER__DOUBLE = eINSTANCE.getnumber_Double();

  }

} //Actionscript3Package

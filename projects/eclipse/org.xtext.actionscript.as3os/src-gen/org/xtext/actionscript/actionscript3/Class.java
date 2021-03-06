/**
 * <copyright>
 * </copyright>
 *

 */
package org.xtext.actionscript.actionscript3;

import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Class</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link org.xtext.actionscript.actionscript3.Class#getName <em>Name</em>}</li>
 *   <li>{@link org.xtext.actionscript.actionscript3.Class#getSuperClass <em>Super Class</em>}</li>
 *   <li>{@link org.xtext.actionscript.actionscript3.Class#getProperties <em>Properties</em>}</li>
 * </ul>
 * </p>
 *
 * @see org.xtext.actionscript.actionscript3.Actionscript3Package#getClass_()
 * @model
 * @generated
 */
public interface Class extends Public, Private
{
  /**
   * Returns the value of the '<em><b>Name</b></em>' attribute.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Name</em>' attribute isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Name</em>' attribute.
   * @see #setName(String)
   * @see org.xtext.actionscript.actionscript3.Actionscript3Package#getClass_Name()
   * @model
   * @generated
   */
  String getName();

  /**
   * Sets the value of the '{@link org.xtext.actionscript.actionscript3.Class#getName <em>Name</em>}' attribute.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Name</em>' attribute.
   * @see #getName()
   * @generated
   */
  void setName(String value);

  /**
   * Returns the value of the '<em><b>Super Class</b></em>' reference.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Super Class</em>' reference isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Super Class</em>' reference.
   * @see #setSuperClass(Class)
   * @see org.xtext.actionscript.actionscript3.Actionscript3Package#getClass_SuperClass()
   * @model
   * @generated
   */
  Class getSuperClass();

  /**
   * Sets the value of the '{@link org.xtext.actionscript.actionscript3.Class#getSuperClass <em>Super Class</em>}' reference.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @param value the new value of the '<em>Super Class</em>' reference.
   * @see #getSuperClass()
   * @generated
   */
  void setSuperClass(Class value);

  /**
   * Returns the value of the '<em><b>Properties</b></em>' containment reference list.
   * The list contents are of type {@link org.xtext.actionscript.actionscript3.Property}.
   * <!-- begin-user-doc -->
   * <p>
   * If the meaning of the '<em>Properties</em>' containment reference list isn't clear,
   * there really should be more of a description here...
   * </p>
   * <!-- end-user-doc -->
   * @return the value of the '<em>Properties</em>' containment reference list.
   * @see org.xtext.actionscript.actionscript3.Actionscript3Package#getClass_Properties()
   * @model containment="true"
   * @generated
   */
  EList<Property> getProperties();

} // Class

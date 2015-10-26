package ar.tp.dieta

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
abstract class ElementoDeReceta {
	String nombre = new String
	int cantidad = 0
	boolean ingrediente = false
	boolean condimento = false
	
	abstract public def boolean soyInadecuadoParaCondicion(Condicion unaCondicion)
	
	def String getNombre(){
		nombre
	}
	
	def boolean sosIngrediente(){
		ingrediente
	}
	
	def boolean sosCondimento(){
		condimento
	}
}	
	

package ar.tp.dieta

import org.uqbar.commons.utils.Observable

//Ingrediente integra tanto condimentos (sal,azucar, etc.) como ingredientes (carne, pollo, etc.)

@Observable
class Ingrediente extends ElementoDeReceta{
	
	override soyInadecuadoParaCondicion(Condicion unaCondicion) {
		unaCondicion.ingredienteEsInadecuado(this)
	}
	
	def setCondimento(){
		condimento = true
		ingrediente = false
	}
	
	def setIngrediente(){
		ingrediente = true
		condimento = false
	}
}
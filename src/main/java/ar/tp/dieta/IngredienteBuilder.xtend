package ar.tp.dieta

import org.uqbar.commons.utils.Observable

@Observable
class IngredienteBuilder {

	Ingrediente ingrediente

	new(String nombreIngrediente){
		ingrediente = new Ingrediente()
		ingrediente.setNombre(nombreIngrediente)
	}		

	public def IngredienteBuilder cantidad(int cantidad){
		ingrediente.setCantidad(cantidad)
		return this
	}
	
	public def Ingrediente build(){
		return ingrediente
	}
	
}
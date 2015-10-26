package ar.tp.dieta

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

//import java.util.ArrayList

@Accessors
class CondicionVegano extends Condicion {
	//Lista de "elementos" que no son buenos para una condicion
	List<String> elementosNoRecomendables = #["pollo", "carne", "chivito", "chori", "lomo"]
	
//	new(){
//		elementosNoRecomendables = new ArrayList<String>
//		elementosNoRecomendables.add("pollo")
//		elementosNoRecomendables.add("chivito")
//		elementosNoRecomendables.add("chori")
//		elementosNoRecomendables.add("lomo")
//		elementosNoRecomendables.add("carne")
//	}
	
	override esVegano() {
		true
	}

	override seSubsana(Usuario unUsuario) {
		(unUsuario.meGustaLaFruta())
	}
	
	override validarCondicion(Usuario unUsuario){
		!(unUsuario.meGustaLaCarne())
	}

	override ingredienteEsInadecuado(ElementoDeReceta unElemento) {
		//Si entre los elementos no recomendables esta alguno de los contenidos de la receta.
		elementosNoRecomendables.contains(unElemento.getNombre())
	}
}
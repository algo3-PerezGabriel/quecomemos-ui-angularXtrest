package ar.tp.dieta

import ar.tp.dieta.Filtro
import java.util.List

class FiltroPorIngrediente implements Filtro {
	
	String ingrediente
	
	new(String unIngrediente){
		ingrediente = unIngrediente
	}
	override aplicarFiltro(List<Receta> recetasSinFiltrar) {
		if (ingrediente == ""){return recetasSinFiltrar}
			else{recetasSinFiltrar.filter[contieneIngrediente(ingrediente)].toList}
	}
}
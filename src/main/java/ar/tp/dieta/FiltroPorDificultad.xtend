package ar.tp.dieta

import ar.tp.dieta.Filtro
import java.util.List

class FiltroPorDificultad implements Filtro {

	String dificultad
	
	new(String unaDificultad){
		dificultad = unaDificultad
	}
	
	override aplicarFiltro(List<Receta> recetasSinFiltrar) {
		if (dificultad == ""){return recetasSinFiltrar}
			else{recetasSinFiltrar.filter[getDificultad().equals(dificultad)].toList}
	}
}
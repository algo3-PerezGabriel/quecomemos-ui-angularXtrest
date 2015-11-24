package ar.tp.dieta

import ar.tp.dieta.Filtro
import java.util.List

class FiltroPorNombre implements Filtro {
	
	String nombre
	
	new(String unNombre){
		nombre = unNombre
	}
	override aplicarFiltro(List<Receta> recetasSinFiltrar) {
		if (nombre == ""){return recetasSinFiltrar}
			else{recetasSinFiltrar.filter[devolverNombre.contains(nombre)].toList}
	}
}
package ar.tp.dieta

import ar.tp.dieta.Filtro
import java.util.List

class FiltroPorTemporada implements Filtro {
	
	String temporada
	
	new(String unaTemporada){
		temporada = unaTemporada
	}
	
	override aplicarFiltro (List<Receta> recetasSinFiltrar) {
		if (temporada == ""){return recetasSinFiltrar}
			else{recetasSinFiltrar.filter[getTemporada.equals(temporada)].toList}
	}
}
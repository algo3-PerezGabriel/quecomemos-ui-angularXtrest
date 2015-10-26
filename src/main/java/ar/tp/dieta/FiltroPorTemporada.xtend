package ar.tp.dieta

import ar.tp.dieta.Filtro
import java.util.List

class FiltroPorTemporada implements Filtro {
	
	String temporada
	
	new(String unaTemporada){
		temporada = unaTemporada
	}
	
	override aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetasSinFiltrar) {
		if (temporada == ""){return recetasSinFiltrar}
			else{recetasSinFiltrar.filter[temporadaALaQueCorresponde.equals(temporada)].toList}
	}
	
	
	override aplicarFiltroGrupo(Grupo unGrupo, List<Receta> recetasSinFiltrar) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
package ar.tp.dieta

import ar.tp.dieta.Filtro
import java.util.List

class FiltroPorDificultad implements Filtro {

	String dificultad
	
	new(String unaDificultad){
		dificultad = unaDificultad
	}
	
	override aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetasSinFiltrar) {
		if (dificultad == ""){return recetasSinFiltrar}
			else{recetasSinFiltrar.filter[getDificultadDePreparacion().equals(dificultad)].toList}
	}
	
	override aplicarFiltroGrupo(Grupo unGrupo, List<Receta> recetasSinFiltrar) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
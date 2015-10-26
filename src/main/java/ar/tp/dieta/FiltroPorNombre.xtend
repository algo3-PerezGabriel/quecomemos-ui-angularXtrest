package ar.tp.dieta

import ar.tp.dieta.Filtro
import java.util.List

class FiltroPorNombre implements Filtro {
	
	String nombre
	
	new(String unNombre){
		nombre = unNombre
	}
	override aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetasSinFiltrar) {
		if (nombre == ""){return recetasSinFiltrar}
			else{recetasSinFiltrar.filter[devolverNombre.equals(nombre)].toList}
	}
	
	override aplicarFiltroGrupo(Grupo unGrupo, List<Receta> recetasSinFiltrar) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
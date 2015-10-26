package ar.tp.dieta

import java.util.List

class PosteriorBusquedaOrdenadoCalorias implements Filtro{
	
	override aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetasSinFiltrar) {
		recetasSinFiltrar.sortBy[calorias]
	}
}
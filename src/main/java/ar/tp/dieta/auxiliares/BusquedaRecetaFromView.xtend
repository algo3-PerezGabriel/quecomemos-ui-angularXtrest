package ar.tp.dieta.auxiliares

import ar.edu.unsam.dieta.tp.model.app.QueComemosAppModel
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class BusquedaRecetaFromView {

	String nombreBuscado = ""
	String dificultadBuscada = ""
	String ingredienteBuscado = ""
	String temporadaBuscada = ""
	int caloriasDesde = -1
	int caloriasHasta = -1

	
	def cargarModelo(QueComemosAppModel modeloBienvenida){
		modeloBienvenida.conNombre = nombreBuscado
		modeloBienvenida.conDificultad = dificultadBuscada
		modeloBienvenida.conIngrediente = ingredienteBuscado
		modeloBienvenida.conTemporada = temporadaBuscada
		modeloBienvenida.caloriasInferior = caloriasDesde
		modeloBienvenida.caloriasSuperior = caloriasHasta
		modeloBienvenida.conFiltrosUsuario = false
	}

}
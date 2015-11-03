package ar.tp.dieta.auxiliares

import ar.edu.unsam.dieta.tp.model.app.QueComemosAppModel
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class BusquedaRecetaFromView {

	String nombreBuscado
	String dificultadBuscada
	String ingredienteBuscado 
	String temporadaBuscada
	int caloriasDesde 
	int caloriasHasta
	boolean filtroUsuario
 
	new(String nomb,String dif,String ing,String temp,int cal1,int cal2,boolean usrFil){
		nombreBuscado = nomb
		dificultadBuscada = dif
		ingredienteBuscado = ing
		temporadaBuscada = temp
		caloriasDesde = cal1
		caloriasHasta = cal2
		filtroUsuario = usrFil
	}
	
	def cargarModelo(QueComemosAppModel modeloBienvenida){
		modeloBienvenida.conNombre = nombreBuscado
		modeloBienvenida.conDificultad = dificultadBuscada
		modeloBienvenida.conIngrediente = ingredienteBuscado
		modeloBienvenida.conTemporada = temporadaBuscada
		modeloBienvenida.conFiltrosUsuario = filtroUsuario
		if(caloriasDesde.equals("")){ modeloBienvenida.caloriasInferior = -1}
		else{modeloBienvenida.caloriasInferior = caloriasDesde}
		if(caloriasHasta.equals("")){ modeloBienvenida.caloriasSuperior = -1}
		else{modeloBienvenida.caloriasSuperior = caloriasHasta}
		
		}

}
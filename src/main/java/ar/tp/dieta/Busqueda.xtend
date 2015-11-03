package ar.tp.dieta

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Busqueda {
	
	public List<Filtro> filtros = new ArrayList<Filtro>
	
	List<Receta> recetasAuxiliar = new ArrayList<Receta>
	
	def void agregarFiltro(Filtro unFiltro){
		filtros.add(unFiltro)
	}
	
	def void removerFiltro(Filtro unFiltro){
		filtros.remove(unFiltro)
	}
	
	def List<Receta> aplicarBusqueda(List<Receta> recetas) {
		
		recetasAuxiliar = recetas
		
		filtros.forEach[filtro | 
			recetasAuxiliar = filtro.aplicarFiltro(recetasAuxiliar)
		]
		 
		recetasAuxiliar

	}
}
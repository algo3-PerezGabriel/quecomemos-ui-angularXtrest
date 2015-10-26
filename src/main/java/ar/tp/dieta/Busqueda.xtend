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
	
	def List<Receta> aplicarBusquedaUsuario(Usuario usuario, List<Receta> recetas) {
		
		recetasAuxiliar = recetas
		
		filtros.forEach[filtro | 
			recetasAuxiliar = filtro.aplicarFiltroUsuario(usuario,recetasAuxiliar)
		]
		 
		recetasAuxiliar
//		var int counter = 0
//		while(counter < filtros.size()){
//		//Itero sobre cada filtro en la coleccion y aplico cada filtro una y otra vez sobre la misma coleccion
//			recetasFiltradas=filtros.get(counter).aplicarFiltroUsuario(usuario, recetasFiltradas)
//			counter++
//		}
	}
}
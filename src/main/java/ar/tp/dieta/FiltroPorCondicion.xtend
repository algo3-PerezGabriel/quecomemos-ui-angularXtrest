package ar.tp.dieta

import java.util.ArrayList
import java.util.List

class FiltroPorCondicion implements Filtro {
	override aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetas){
		val List<Receta> recetasFiltradas = new ArrayList<Receta>		
		recetas.forEach[receta | if(receta.esInadecuadaParaUsuario(unUsuario)){
			recetasFiltradas.add(receta)}
		]
		recetasFiltradas
	}
}
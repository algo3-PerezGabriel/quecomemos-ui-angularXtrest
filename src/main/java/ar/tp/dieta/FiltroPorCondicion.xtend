package ar.tp.dieta

import java.util.ArrayList
import java.util.List

class FiltroPorCondicion implements Filtro {
	def aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetas){
		val List<Receta> recetasFiltradas = new ArrayList<Receta>		
		recetas.forEach[receta | if(receta.esInadecuadaParaUsuario(unUsuario)){
			recetasFiltradas.add(receta)}
		]
		recetasFiltradas
	}
	
	override aplicarFiltro(List<Receta> recetasSinFiltrar) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
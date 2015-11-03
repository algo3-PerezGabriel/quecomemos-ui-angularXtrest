package ar.tp.dieta

import java.util.ArrayList
import java.util.List

class FiltroPorIngredienteCaro implements Filtro {
	val String[] elementosCaros = #["lechon", "lomo", "salmon", "alcaparras"]
	
	def aplicarFiltroUsuario(Usuario unUsuario,List<Receta> recetas ){
		val List<Receta> recetasFinal = new ArrayList<Receta>
		recetas.forEach[receta | if(!receta.contieneAlguno(elementosCaros)){ recetasFinal.add(receta)}]
		recetasFinal
	}
	
	override aplicarFiltro(List<Receta> recetasSinFiltrar) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
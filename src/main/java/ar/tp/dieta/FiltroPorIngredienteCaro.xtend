package ar.tp.dieta

import java.util.ArrayList
import java.util.List

class FiltroPorIngredienteCaro implements Filtro {
	val String[] elementosCaros = #["lechon", "lomo", "salmon", "alcaparras"]
	
	override aplicarFiltroUsuario(Usuario unUsuario,List<Receta> recetas ){
		val List<Receta> recetasFinal = new ArrayList<Receta>
		recetas.forEach[receta | if(!receta.contieneAlguno(elementosCaros)){ recetasFinal.add(receta)}]
		recetasFinal
	}
	
	override aplicarFiltroGrupo(Grupo unGrupo, List<Receta> recetasSinFiltrar) {
	}
	
}
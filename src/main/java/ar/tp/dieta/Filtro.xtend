package ar.tp.dieta

import java.util.List

interface Filtro {
	
	def List<Receta> aplicarFiltroUsuario(Usuario unUsuario, List<Receta> recetasSinFiltrar)
}
package ar.tp.dieta.auxiliares

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import org.eclipse.xtend.lib.annotations.Accessors

@JsonIgnoreProperties(ignoreUnknown=true)
@Accessors
class BusquedaRecetaFromView {

	String nombreBuscado = ""
	String dificultadBuscada = ""
	String ingredienteBuscado = ""
	String temporadaBuscada= ""
	String caloriasDesde = ""
	String caloriasHasta =""
}
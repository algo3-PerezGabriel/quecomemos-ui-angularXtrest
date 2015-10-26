package ar.tp.dieta.controllers

import ar.tp.dieta.RecetarioPublico
import ar.tp.dieta.RepoDeUsuarios
import ar.tp.dieta.RepoRecetas
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils

@Controller
class QueComemosController {
	
	extension JSONUtils = new JSONUtils
	
	RepoDeUsuarios usuarios
	RecetarioPublico recetario = usuarios.recetarioPublico
	
	def static void main(String[] args) {
		XTRest.start(QueComemosController , 9000)
	}

	@Get("/recetasAMostrar")
	def Result recetasAMostrar() {
		val recetas = recetario.getRecetas
		response.contentType = ContentType.APPLICATION_JSON
		ok(recetas.toJson)
	}
	
}
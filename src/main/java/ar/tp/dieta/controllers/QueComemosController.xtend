package ar.tp.dieta.controllers

import ar.edu.unsam.dieta.tp.model.app.LoginUserModel
import ar.edu.unsam.dieta.tp.model.app.QueComemosAppModel
import ar.tp.dieta.Receta
import ar.tp.dieta.auxiliares.BusquedaRecetaFromView
import ar.tp.dieta.auxiliares.UsrAndPass
import com.google.gson.Gson
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.json.JSONUtils

@Controller
class QueComemosController {
	
	
	Gson gson = new Gson()// objeto que jeisonea
	extension JSONUtils = new JSONUtils
	
	LoginUserModel modeloLogin = new LoginUserModel
	QueComemosAppModel modeloBienvenida 
	
	
	@Get("/recetaEsFavorita/:idReceta")
	def Result esFavoritaReceta(){
		try{
			var Receta receta = modeloBienvenida.seleccionadaGrillaPorId(idReceta)
			if(receta == null){
				return badRequest ('{ "estado" : "error Interno del server"}')
			}
			if(modeloBienvenida.tieneFavorita(receta)){ return ok('{ "estado" : "ok", "favorita" : "true"}')}
			ok('{ "estado" : "ok", "favorita" : "false"}')
		}catch (Exception e){ badRequest(e.message)}
	}

	@Put("/copiarReceta/:idReceta")
	def Result copiarReceta(@Body String body){
		var String nuevoNombre = gson.fromJson(body, String)
		modeloBienvenida.clonarRecetaPorId(idReceta,nuevoNombre)
		ok('{"estado":"ok"')
	}
	
	@Put("/recetaFavoritear/:idReceta")
	def Result favearReceta(){
		try {
			var Receta recetaSeleccionada = modeloBienvenida.seleccionadaGrillaPorId(idReceta)
			if(recetaSeleccionada == null){
				return badRequest ('{ "estado" : "error Interno del server"}')
			}
			modeloBienvenida.favearReceta(recetaSeleccionada)			
			ok('{ "estado" : "ok"}')
		}catch(Exception e) {badRequest(e.message)}
	}	
	
	@Get("/recetasToGrill")
	def Result recetasGrilla(){
		ok(modeloBienvenida.recetasEnGrilla.toJson)
	}
	
	@Get("/tituloEnGrilla")
	def Result titulo(){
		ok(modeloBienvenida.outputTituloGrilla.toJson)
	}
	
	@Put("/busquedaRecetas/")
	def Result busquedaConFiltros(@Body String body){
		
		try {	
			val BusquedaRecetaFromView  busquedaAux = gson.fromJson(body, BusquedaRecetaFromView)
			if (busquedaAux == null){ 
				return badRequest ('{ "estado" : "busqueda no pasa a json"}')
			}
			modeloBienvenida.cargarModelo(busquedaAux)
			modeloBienvenida.ejecutarBusqueda
			ok('{"estado":"ok"}')
		}catch (Exception e){ badRequest(e.message)}
	}
	
	@Get("/busquedaAnterior")
	def Result busquedaAnterior(){
		modeloBienvenida.revertirListaRecetas()
		ok('{"estado":"ok"}')
	}

	
	@Post("/logearUsuario")
	def Result logUsuario(@Body String body) {
	
		try {
			val UsrAndPass parametrosJson = gson.fromJson(body, UsrAndPass)
			
			modeloLogin.setNombreUsuario = parametrosJson.getNombre
			modeloLogin.setPasswordUsuario = parametrosJson.getPassword
			
			if(!modeloLogin.validarLogin){
				return badRequest('{ "errorLog" : "Datos de Incorrectos"}')
			}
			modeloBienvenida = new QueComemosAppModel(modeloLogin.getUsrLogeado)
			ok('{ "estadoLog" : "ok" }')
			
			} catch (Exception e){ badRequest(e.message)}
	} 
	


	def static void main(String[] args) {
		XTRest.start(QueComemosController, 9028)
	}
}




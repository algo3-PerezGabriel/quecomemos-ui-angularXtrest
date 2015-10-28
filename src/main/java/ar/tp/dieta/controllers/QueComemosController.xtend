package ar.tp.dieta.controllers

import ar.edu.unsam.dieta.tp.model.app.LoginUserModel
import ar.edu.unsam.dieta.tp.model.app.QueComemosAppModel
import ar.tp.dieta.auxiliares.UsrAndPass
import com.google.gson.Gson
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.json.JSONUtils

@Controller
class QueComemosController {
	
	
	Gson gson = new Gson()
	extension JSONUtils = new JSONUtils
	
	LoginUserModel modeloLogin = new LoginUserModel
	QueComemosAppModel modeloBienvenida 
	
	@Post("/logearUsuario")
	def Result logUsuario(@Body String body) {
		
		var UsrAndPass parametrosJson = gson.fromJson(body, UsrAndPass)
		
		modeloLogin.setNombreUsuario = parametrosJson.getNombre
		modeloLogin.setPasswordUsuario = parametrosJson.getPassword
		
		modeloBienvenida = modeloLogin.validarLogin
		//aca comprobacion si valido
		
		//logueo el usr, creo el modelo de la sig vista, devuelvo las recetas
		
		ok(modeloBienvenida.recetasEnGrilla.toJson)
	}

	def static void main(String[] args) {
		XTRest.start(QueComemosController, 9111)
	}
}



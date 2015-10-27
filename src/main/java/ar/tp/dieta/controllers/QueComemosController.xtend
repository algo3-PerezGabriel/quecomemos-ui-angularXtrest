package ar.tp.dieta.controllers

import ar.edu.unsam.dieta.tp.model.app.LoginUserModel
import ar.edu.unsam.dieta.tp.model.app.QueComemosAppModel
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.json.JSONUtils

@Controller
class QueComemosController {
	
	extension JSONUtils = new JSONUtils
	
	LoginUserModel modeloLogin = new LoginUserModel
	QueComemosAppModel modeloBienvenida 

	
	@Get("/logearUsuario/:usrName")
	def Result logUsuario() {
		modeloLogin.nombreUsuario = usrName
		modeloBienvenida = modeloLogin.validarLoginNombre //este se tiene que cambiar por validarLogin
		//aca comprobacion si valido
		
		//logueo el usr, creo el modelo de la sig vista, devuelvo las recetas
		
		ok(modeloBienvenida.recetasEnGrilla.toJson)
	}

	def static void main(String[] args) {
		XTRest.start(QueComemosController, 9000)
	}
}
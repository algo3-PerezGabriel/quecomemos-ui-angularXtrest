package ar.edu.unsam.dieta.tp.model.app

import ar.tp.dieta.RepoDeUsuarios
import ar.tp.dieta.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

//import ar.tp.dieta.Usuario

@Accessors
@Observable
class LoginUserModel {
	
	public RepoDeUsuarios repoUsuarios = new RepoDeUsuarios()

	String nombreUsuario
	String passwordUsuario
	Usuario usrLogeado
	
	def validarLogin() {
		usrLogeado = repoUsuarios.logearUsuario(nombreUsuario, passwordUsuario)
		usrLogeado != null
	}
	
}
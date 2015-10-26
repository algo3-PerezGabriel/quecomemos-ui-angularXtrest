package ar.edu.unsam.dieta.tp.model.app

import ar.tp.dieta.RepoDeUsuarios
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

//import ar.tp.dieta.Usuario

@Accessors
@Observable
class LoginUserModel {
	
	public RepoDeUsuarios repoUsuarios = new RepoDeUsuarios()

	String nombreUsuario
	String passwordUsuario
	
	def validarLogin() { 
		new QueComemosAppModel(repoUsuarios.logearUsuario(nombreUsuario, passwordUsuario))
		
	}
	
}
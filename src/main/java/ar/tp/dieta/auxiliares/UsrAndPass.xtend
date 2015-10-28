package ar.tp.dieta.auxiliares

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import org.eclipse.xtend.lib.annotations.Accessors

@JsonIgnoreProperties(ignoreUnknown=true)
@Accessors
class UsrAndPass {
	String nombre
	String password

	new (String nomb, String pass){
		nombre = nomb
		password = pass
	}

}
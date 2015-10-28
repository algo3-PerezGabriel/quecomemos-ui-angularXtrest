package ar.tp.dieta.auxiliares

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import org.eclipse.xtend.lib.annotations.Accessors

@JsonIgnoreProperties(ignoreUnknown=true)
@Accessors
class UsrAndPass {
	String nombre
	String password
	String id

	new (String nomb, String pass, String ident){
		id = ident
		nombre = nomb
		password = pass
	}

}
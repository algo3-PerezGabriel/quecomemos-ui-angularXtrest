package ar.edu.unsam.dieta.tp.model.app

import ar.tp.dieta.Receta
import ar.tp.dieta.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class CopiarRecetaModelo {
	
	Usuario elUsr
	Receta laReceta
	String nombreReceta
	
	new(Usuario unUsr, Receta unaReceta){
		elUsr = unUsr
		laReceta = unaReceta
		nombreReceta = ("Mi " + unaReceta.nombreDeLaReceta)
	}
	
	def getNombreOrigen(){
		laReceta.getNombreDeLaReceta
	}
	
	def void copiarReceta(){
		//este método efectivamente copia la receta con el usuario y el nombreReceta
		//la agrega en las recetas del usr
		elUsr.agregarReceta(laReceta.clonateConNombre(nombreReceta))
	}
}
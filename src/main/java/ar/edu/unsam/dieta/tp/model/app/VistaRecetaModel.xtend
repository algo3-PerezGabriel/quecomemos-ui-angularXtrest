package ar.edu.unsam.dieta.tp.model.app

import ar.tp.dieta.Receta
import ar.tp.dieta.Usuario
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class VistaRecetaModel {

	Usuario elUsuario 
	Receta laReceta
	
	new(Usuario unUsuario,Receta unaReceta){
		elUsuario = unUsuario
		laReceta = unaReceta
	}
	
	def getIngredientesEnReceta(){
		laReceta.getIngredientes
	}
	
	def getCondimentosEnReceta(){
		laReceta.getCondimentos
	}
	
	def getEsFavorita() { elUsuario.tieneFavorita(laReceta) }
	
	def void setEsFavorita(boolean valor){ //valor viene del check y en base a eso faveo o desfaveo
		elUsuario.favearReceta(laReceta)
		esFavorita = elUsuario.tieneFavorita(laReceta)
			
	//está mal el binding.
	}
	
	def inicializarModeloCopiar() {
		new CopiarRecetaModelo(elUsuario,laReceta)
	}

}
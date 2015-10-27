package ar.tp.dieta

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RecetaToSend {
	String nombre
	String sID
	int calorias
	String dificultad
	String temporada
	List <Ingrediente> condimentos  = new ArrayList<Ingrediente>
	List <Ingrediente> ingredientes = new ArrayList<Ingrediente>
	List <String> condicionesPreexistentes = new ArrayList <String>
	String preparacion
	
	new (Receta receta){
		
	}
}
package ar.tp.dieta

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@JsonIgnoreProperties(ignoreUnknown = true)
@Accessors
class RecetarioPublico implements Cloneable{
	
	public List<Receta> recetas = new ArrayList<Receta>()
	
	int contador = 0
	
	def void agregarReceta(Receta unaReceta) {
		//agrega recetas al recetario
		contador ++
		unaReceta.sId = Integer.toString(contador)
		recetas.add(unaReceta)
	}

	def void mirarRecetario() {
		//imprime los nombres de las recetas
		recetas.forEach[receta|println(receta.getNombre)]
	}

	def elegirReceta(String nombre) {
		if(this.busquedaReceta(nombre)==null){
			throw new BusinessException("La receta buscada no existe.")
		}
		this.busquedaReceta(nombre)
		// devuelve la primer receta que conincide con el nombre pasado
		
	}
	
	def busquedaReceta(String nombreReceta){
		recetas.findFirst[receta|receta.getNombre.equals(nombreReceta)]
	}
	
	def recetarioContiene(Receta unaReceta){
		recetas.contains(unaReceta)
	}
	
	def recetaById(String idReceta){
		recetas.findFirst[getSId.equals(idReceta)]
	}
	
}
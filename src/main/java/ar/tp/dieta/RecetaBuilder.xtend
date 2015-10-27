package ar.tp.dieta

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class RecetaBuilder {

	Receta receta

	new(String nombreReceta) {
		receta = new Receta()
		receta.setNombre(nombreReceta)
	}

	public def RecetaBuilder calorias(int calorias) {
		receta.setCalorias(calorias)
		return this
	}

	public def RecetaBuilder owner(Usuario autor) {
		receta.setOwner(autor)
		receta.setNombreOwner(autor.nombre)
		return this
	}

	public def RecetaBuilder dificultad(String dificultad) {
		receta.setDificultad(dificultad)
		return this
	}

	public def RecetaBuilder procesoPreparacion(String procesoPreparacion) {
		receta.setPreparacion(procesoPreparacion)
		return this
	}

	public def RecetaBuilder temporada(String temporada) {
		receta.setTemporada(temporada)
		return this
	}

	public def RecetaBuilder agregarIngrediente(Ingrediente unIngrediente) {
		receta.agregarIngrediente(unIngrediente)
		return this
	}

	public def RecetaBuilder agregarCondimento(Ingrediente unCondimento){
		receta.agregarCondimento(unCondimento)
		return this
	}
	public def Receta build() {
//		if (receta.elementosDeReceta.isEmpty()) {
//			throw new BusinessException("Receta sin ingredientes")
//		}
		return receta
	}
}

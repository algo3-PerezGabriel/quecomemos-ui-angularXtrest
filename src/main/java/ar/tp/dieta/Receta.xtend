package ar.tp.dieta

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import java.util.ArrayList
import java.util.Iterator
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@JsonIgnoreProperties(ignoreUnknown = true)
@Accessors
class Receta extends ElementoDeReceta implements Cloneable{


	public String sId
	public int calorias
	ArrayList<ElementoDeReceta> elementosDeReceta = new ArrayList<ElementoDeReceta> //Integra ingredientes, condimentos y subrecetas.	
	String preparacion
	String dificultad
	String temporada
	int tiempoPreparacion
	int anioDeCreacion
	String nombreOwner
	boolean esFavorita
	
	

	def void agregarIngrediente(Ingrediente unIngrediente){
		unIngrediente.setIngrediente()
		elementosDeReceta.add(unIngrediente)
	}

	def void agregarCondimento(Ingrediente unCondimento) {
		unCondimento.setCondimento()
		elementosDeReceta.add(unCondimento)
	}

	def void removerIngrediente(Ingrediente unIngrediente) {
		elementosDeReceta.remove(unIngrediente)
	}

	def void removerCondimento(Ingrediente unCondimento) {
		elementosDeReceta.remove(unCondimento)
	}

	def validar(){
		this.validarCalorias && !elementosDeReceta.empty
	}

	def validarCalorias() {
		//Devuelve T o F segun la receta tenga las calorias necesarias o no
		(10 >= this.getCalorias && this.getCalorias <= 5000)
	}
	
	public def boolean inadecuadaParaCondiciones(Condicion unaCondicion){
		//Para cada condicion de la receta, que chequee si cada uno de los elementos de la receta es conveniente o no.
		elementosDeReceta.exists[ elemento | elemento.soyInadecuadoParaCondicion(unaCondicion) ]
	}
	
	public def boolean esInadecuadaParaUsuario(Usuario unUsuario) {
		//Para cada condicion del usuario, llamo al mÃ©todo para ver si es inadecuada la receta.
		unUsuario.condicionesPreexistentes.exists[ condicion | this.soyInadecuadoParaCondicion(condicion)]
	}

	def agregarSubreceta(Receta unaSubreceta) {
		 elementosDeReceta.add(unaSubreceta)
	}

	def cambiarNombre(String nombre) {
		setNombre(nombre)
	}

	def devolverNombre() {
		this.getNombre()
	}
	
	override soyInadecuadoParaCondicion(Condicion unaCondicion) {
		!elementosDeReceta.exists[ elemento | elemento.soyInadecuadoParaCondicion(unaCondicion)]
	}
	
	def exesoDeCalorias() {
		calorias > 500
	}
	
	
	def boolean contieneIngrediente(String nombreIngrediente) {
		getIngredientes.exists[getNombre().equals(nombreIngrediente)]
	}
	
	def boolean contieneAlguno(List<String> nombresIngredientes) {
		nombresIngredientes.exists[nombreIngrediente | this.contieneIngrediente(nombreIngrediente)]
	}
	
	def ingredientesAString(){
		var List<String> stringsList = new ArrayList<String>
		for(ElementoDeReceta elemento : elementosDeReceta){
			stringsList.add(elemento.nombre)
		}				
		stringsList.toString()
	}
	
	def boolean tuNombreEsEste(String nombre){
		
		this.nombre.equals(nombre)
	}
	
	def getIngredientes(){
		val Iterator<ElementoDeReceta> ingredienteIter = (elementosDeReceta.filter[sosIngrediente]).iterator()
		val List<ElementoDeReceta> ingredientes = new ArrayList<ElementoDeReceta>
		while(ingredienteIter.hasNext){
			ingredientes.add(ingredienteIter.next)
		}
		ingredientes
	}
	
	def getCondimentos(){
		val Iterator<ElementoDeReceta> condimentoIter = (elementosDeReceta.filter[sosCondimento]).iterator()
		val List<String> condimentos = new ArrayList<String>
		while(condimentoIter.hasNext){
			condimentos.add(condimentoIter.next.getNombre())
		}
		condimentos
		
	}
	
	def getCondiciones(){
		val List<String> condicionesInadecuadas = new ArrayList<String>
		if(this.inadecuadaParaCondiciones(new CondicionCeliaco).equals(true)){
			condicionesInadecuadas.add("Celiacos")
		}
		if(this.inadecuadaParaCondiciones(new CondicionVegano).equals(true)){
			condicionesInadecuadas.add("Veganos")
		}
		if(this.inadecuadaParaCondiciones(new CondicionHipertension).equals(true)){
			condicionesInadecuadas.add("Hipertensos")
		}
		if(this.inadecuadaParaCondiciones(new CondicionDiabetes).equals(true)){
			condicionesInadecuadas.add("Diabeticos")
		}
		return condicionesInadecuadas
	}
	
	public def devolverme(){
		this
	}
	
	 def clonateConNombre(String nombreNuevo){
		var Receta receta = new RecetaBuilder(nombreNuevo)
								.calorias(this.calorias)
								.dificultad(this.dificultad)
								.owner(this.nombreOwner)
								.procesoPreparacion(this.preparacion)
								.temporada(this.temporada)
								.build()
			receta.elementosDeReceta = this.elementosDeReceta
			receta
	}
}
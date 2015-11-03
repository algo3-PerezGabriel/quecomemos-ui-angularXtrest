package ar.tp.dieta

import java.util.ArrayList
import java.util.GregorianCalendar
import java.util.Iterator
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Usuario extends Miembro {
	Double peso
	Double altura
	GregorianCalendar fechaDeNacimiento
	GregorianCalendar diaDeHoy
	String sexo
	Rutina rutina
	List<Condicion> condicionesPreexistentes = new ArrayList<Condicion>
	List<String> comidasQueNoMeGustan = new ArrayList<String>
	List<Receta> misRecetas = new ArrayList<Receta>
	List<Receta> recetasFavoritas = new ArrayList<Receta>
	List<Receta> ultimasConsultadas = new ArrayList<Receta>
	String direccionCorreo
	Boolean resultadoDeConsultasAFavoritos = false
	String password
	
	int contadorRecetas = 0
	
	public def setFechaDeNacimiento(int ano, int mes, int diaDelMes) {
		fechaDeNacimiento = new GregorianCalendar(ano, mes, diaDelMes)
	}

	// Calcular indice de masa corporal
	public def indiceDeMasaCorporal() {
		peso / (Math.pow(altura, 2))
	}
	
	protected def validarIMC() {
		(18 >= this.indiceDeMasaCorporal) && (this.indiceDeMasaCorporal <= 30)
	}

	public def boolean sigoUnaRutinaSaludable(){
		rutina.rutinaSaludable(this)
	} 
	
	//Agregar condiciones preexistentes
	public def void agregarCondicion(Condicion unaCondicion) {
		condicionesPreexistentes.add(unaCondicion)
	}

	public def void agregarPreferencia(String unaComida) {
		preferencias.add(unaComida)
	}

	public def void agregarComidaQueMeDisgusta(String unaComida) {
		comidasQueNoMeGustan.add(unaComida)
	}

	protected def subsanaTodasLasCondiciones() {
		// T o F. Segun si las condiciones preexistentes estan subsanadas.
		(condicionesPreexistentes.exists[ condicion | !condicion.seSubsana(this)])			
	}

	protected def rutinaEsIntensiva() {
		rutina.rutinaEsIntensiva
	}

	protected def rutinaEsActiva() {
		rutina.rutinaEsActiva
	}
	
	protected def boolean meGustaLaCarne(){
		preferencias.contains("carne")
	}
	
	protected def boolean meGustaLaFruta(){
		preferencias.contains("fruta")
	}
	
	public def void agregarReceta(Receta unaReceta){
		unaReceta.setSId(contadorRecetas.toString+this.nombre)
		contadorRecetas ++
		misRecetas.add(unaReceta)
	}

	public def void crearReceta(String nombre, int calorias, String dificultad, String preparacion, String temporada, Ingrediente ingrediente1, Ingrediente ingrediente2 ) {
		var Receta nuevaReceta = new RecetaBuilder(nombre)
		.calorias(calorias)
		.owner(this.nombre)
		.dificultad(dificultad)
		.procesoPreparacion(preparacion)
		.temporada(temporada)
		.agregarIngrediente(ingrediente1)
		.agregarIngrediente(ingrediente2)
		.build()

		misRecetas.add(nuevaReceta)
	}

	// Devuelve una receta buscandola por su nombre.
	public def devolverReceta(String nombre) {// tambien buscar sobre las que puede ver
		var Receta receta = misRecetas.findFirst[receta | receta.devolverNombre.equals(nombre)]
		if (receta.equals(null)) {
			throw new BusinessException("No existe la receta en la lista de recetas.")
		}
		receta
	}
	
	public def creeEstaReceta(Receta unaReceta){
		misRecetas.contains(unaReceta)
	}
	
	//Devuelve una subreceta
	public def devolverSubReceta(String nombreReceta,String nombreSubreceta){
		var ElementoDeReceta subReceta = devolverReceta(nombreReceta).elementosDeReceta.findFirst[subReceta | subReceta.getNombre.equals(nombreSubreceta)] 
		if(subReceta.equals(null)){
			throw new BusinessException("No existe la subreceta en la lista de subrecetas.")
		}
		subReceta
	}

	def boolean meConvieneReceta(Receta receta) {
		receta.esInadecuadaParaUsuario(this) 
	}
	
	def void agregarRecetaFavorita(Receta unaReceta){
			recetasFavoritas.add(unaReceta)
			unaReceta.setEsFavorita(true);
	}
	
	def quitarFavorita(Receta unaReceta){
			recetasFavoritas.remove(unaReceta)
			unaReceta.setEsFavorita(false)
	}
	
	def favearReceta(Receta unaReceta){
		if(!this.tieneFavorita(unaReceta)){
			this.agregarRecetaFavorita(unaReceta)
			}else{ 
				this.quitarFavorita(unaReceta)
			}
	}
	
	def void agregarResultadosDeConsultasAFavoritos(){
		resultadoDeConsultasAFavoritos = true
	}
	
	def void noAgregarResultadosDeConsultasAFavoritos(){
		resultadoDeConsultasAFavoritos = false
	}

	def List<Receta> recetasQuePuedoVer(){
		val List<Receta> recetasQueVeo = new ArrayList<Receta>
		recetario.recetas.forEach[receta | recetasQueVeo.add(receta)]
		recetasQueVeo.addAll[misRecetas.iterator]
		recetasQueVeo
	}
	
	def tePuedoSugerirEstaReceta(Receta receta){
		!(receta.esInadecuadaParaUsuario(this)) && !noMeGustaEstaReceta(receta)
		
	}
	
	def noMeGustaEstaReceta(Receta receta){
		(comidasQueNoMeGustan.exists[ingrediente | receta.elementosDeReceta.exists(elem | elem.getNombre.equals(ingrediente))])
	}
	
	def tieneSobrepeso() {
		indiceDeMasaCorporal >= 30
	}
	
	def boolean tenesEstaCondicion(Condicion unaCondicion){
		//Si existe un objeto de la misma clase que alguna de las condiciones en la coleccion condicionesPreexistentes, devuelvo true.
		condicionesPreexistentes.exists[ condicion | condicion.getClass().equals(unaCondicion.getClass()) ]
	}
 	
 	
 	def List<Receta> busquedaFiltrada(){
		var List<Receta> recetasFiltradas = recetasQuePuedoVer()
	
		if(!misBusquedas.empty){
			var Iterator<Busqueda> iterBusqueda = misBusquedas.iterator()
	 		while(iterBusqueda.hasNext){
	   			recetasFiltradas = (iterBusqueda.next).aplicarBusqueda(recetasFiltradas)
			}
		}
		recetasFiltradas
	}
	
//	public def void agregarAccion(Accion unaAccion) {
//		acciones.add(unaAccion)
//	}
	
	def tieneFavorita(Receta unaReceta){
		recetasFavoritas.contains(unaReceta)
	}
	
	def sinFavoritas(){ recetasFavoritas.empty }
	
	def sinConsultadas() { 
		ultimasConsultadas.empty
	}
	
	def validarPassword(String unaPass) {
		if(unaPass.equals(password)){this}
		else{ //mandar excepcion de password incorrecto
		}
	}	
}
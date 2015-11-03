package ar.edu.unsam.dieta.tp.model.app

import ar.tp.dieta.Busqueda
import ar.tp.dieta.FiltroPorDificultad
import ar.tp.dieta.FiltroPorIngrediente
import ar.tp.dieta.FiltroPorNombre
import ar.tp.dieta.FiltroPorTemporada
import ar.tp.dieta.FiltroRangoCalorias
import ar.tp.dieta.Receta
import ar.tp.dieta.RecetarioPublico
import ar.tp.dieta.RepoRecetas
import ar.tp.dieta.Usuario
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class QueComemosAppModel {
	
	
	List<String> temporadas = #["INVIERNO","OTOÑO","VERANO","PRIMAVERA","TODO EL AÑO"]
	List<String> dificultades = #["Facil","Mediana","Dificil"]
	Usuario theUser
	String outputTituloGrilla =""
	Receta recetaSeleccionada
	List<Receta> recetasEnGrilla = new ArrayList<Receta>
	RecetarioPublico recetario = new RepoRecetas().getRecetarioPublico	

	String conNombre
	String conDificultad
	String conIngrediente
	String conTemporada
	int caloriasInferior
	int caloriasSuperior
	boolean conFiltrosUsuario
	
	
	new(Usuario elUsr){
		theUser = elUsr
		recetasEnGrilla = this.decidirRecetas()
	}
	
	
	//parche para que funcione
	def copiarRecetas (List<Receta> out, List<Receta> in){
		out.forEach[r | in.add(r)]
	}
	
	def decidirRecetas(){	
		var List<Receta> recetasSalida = new ArrayList<Receta>
			
		if(!theUser.sinFavoritas){ 
			outputTituloGrilla = "Estas son tus recetas favoritas"
			this.copiarRecetas(theUser.getRecetasFavoritas(),recetasSalida)
			recetasSalida
		}
		else{
			if(!theUser.sinConsultadas){ 
				outputTituloGrilla = "Estas fueron tus últimas consultas"
				theUser.getUltimasConsultadas()
			}
			else{ //Si no hay recetas favoritas ni busquedas
				outputTituloGrilla = "Estas son las recetas top del momento"
				recetario.getRecetas()
				 //aca habría que hacer un recetario.getTopten() da igual para ejemplo
			}
		}
	}
	
	
	//se modifico en Usuario, el manejo del atributo:
	// Boolean esFavorita de Receta.
	def favearReceta(Receta unaReceta){
		theUser.favearReceta(unaReceta)
	}
	
	def tieneFavorita(Receta unaReceta){
		theUser.tieneFavorita(unaReceta)
		}
	
	def seleccionadaGrillaPorId(String id){
		recetasEnGrilla.findFirst[sId.equals(id)]
	}
	
	def establecerSelecionadaPorId(String id){
		recetaSeleccionada = recetario.recetaById(id)
	}
	
	def ejecutarBusqueda() {
		outputTituloGrilla = "Resultado de la busqueda"
		val Busqueda busqueda = new Busqueda()
		this.crearFiltros(busqueda)
		
		recetasEnGrilla = busqueda.aplicarBusqueda(recetasEnGrilla)
		//salvar las recetas anteriores, y agregar boton ver recetas anteriores en la vista... ?
	}
	
	def crearFiltros(Busqueda laBusqueda) {
		
		laBusqueda.agregarFiltro(new FiltroRangoCalorias(caloriasInferior,caloriasSuperior))
		laBusqueda.agregarFiltro(new FiltroPorTemporada(conTemporada))
		laBusqueda.agregarFiltro(new FiltroPorNombre(conNombre))
		laBusqueda.agregarFiltro(new FiltroPorDificultad(conDificultad))
		laBusqueda.agregarFiltro(new FiltroPorIngrediente(conIngrediente))
		laBusqueda.agregarFiltro(new FiltroPorNombre(conNombre))
		}
	
	def vistaDetalle() {
		new VistaRecetaModel(theUser, recetaSeleccionada)
	}
	
	def clonarRecetaPorId(String idReceta, String nombreNuevo) {
			var Receta recetaSeleccionada = this.seleccionadaGrillaPorId(idReceta)
			var Receta recetaNueva = recetaSeleccionada.clonateConNombre(nombreNuevo)
			theUser.agregarReceta(recetaNueva)
			recetasEnGrilla.add(recetaNueva)
	}
	
}
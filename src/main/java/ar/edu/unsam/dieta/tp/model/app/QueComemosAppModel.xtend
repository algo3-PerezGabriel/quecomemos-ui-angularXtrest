package ar.edu.unsam.dieta.tp.model.app

import ar.tp.dieta.Busqueda
import ar.tp.dieta.FiltroPorDificultad
import ar.tp.dieta.FiltroPorNombre
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
	String caloriasInferior
	String caloriasSuperior
	boolean conFiltrosUsuario
	
	
	new(Usuario elUsr){
		theUser = elUsr
		recetasEnGrilla = this.decidirRecetas()
	}
	
	def decidirRecetas(){
		if(!theUser.sinFavoritas){ 
			outputTituloGrilla = "Estas son tus recetas favoritas"
			theUser.getRecetasFavoritas()
		}
		else{
			if(!theUser.sinConsultadas){ 
				outputTituloGrilla = "Estas fueron tus últimas consultas"
				theUser.getUltimasConsultadas()
			}
			else{ //Si no hay recetas favoritas ni busquedas
				outputTituloGrilla = "Estas son las recetas top del momento"
				recetario.recetas
				 //aca habría que hacer un recetario.getTopten() da igual para ejemplo
			}
		}
	}
	
	def favearReceta(Receta unaReceta){
		theUser.favearReceta(unaReceta)
	}
	
	def tieneFavorita(Receta unaReceta){
		theUser.tieneFavorita(unaReceta)
	}
	
	def vistaDetalle() {
		new VistaRecetaModel(theUser, recetaSeleccionada)
	}
	
	def establecerSelecionadaPorId(String id){
		recetaSeleccionada = recetario.recetaById(id)
	}
	
	def ejecutarBusqueda() {
		outputTituloGrilla = "Resultado de la busquedaaaaa"
		val Busqueda busqueda = new Busqueda()
		this.crearFiltros(busqueda)
		
		recetasEnGrilla = busqueda.aplicarBusquedaUsuario(theUser, new RepoRecetas().getRecetarioPublico.getRecetas)
		//theUser.ultimasConsultadas = recetasEnGrilla
		//tiene que ejecutar la busqueda,
		// y dejar el resultado en recetasEnGrilla, tmb modificar el outputTituloGrilla
		// tambien, se graba el resultado en las ultimas buscadas del usuario (no funncionaria por no haber persistencia)
		
	}
	
	def crearFiltros(Busqueda laBusqueda) {
		var int desdeCaloria
		var int hastaCaloria
		
		if( caloriasInferior == ""){ caloriasInferior = "-1"}
		if( caloriasSuperior == ""){ caloriasSuperior = "-1"}
		desdeCaloria = Integer.parseInt(caloriasInferior)
		hastaCaloria = Integer.parseInt(caloriasSuperior)
	
		laBusqueda.agregarFiltro(new FiltroRangoCalorias(desdeCaloria,hastaCaloria))


//			laBusqueda.agregarFiltro(new FiltroPorTemporada(conTemporada))
			laBusqueda.agregarFiltro(new FiltroPorNombre(conNombre))
			laBusqueda.agregarFiltro(new FiltroPorDificultad(conDificultad))
//			laBusqueda.agregarFiltro(new FiltroPorIngrediente(conIngrediente))
//			//add(new FiltroPorNombre(conNombre))   areglar cada filtro para que el valor null lo maneje
	}
}
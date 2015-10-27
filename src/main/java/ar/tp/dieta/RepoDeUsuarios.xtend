package ar.tp.dieta

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepoDeUsuarios extends RepoRecetas{
	
	public Usuario tojo
	public Usuario juan
	public Usuario gabriel
	public Usuario miguel
	public Usuario carlos
	public Usuario manuel

	List<Receta> topTenConsultas = new ArrayList<Receta>
	
	List<Usuario> usuarios = new ArrayList<Usuario>

	new(){
		
		
		tojo = new UsuarioBuilder("Daniel")
								.peso(120.4)
								.altura(1.89)
								.fechaNacimiento(1992, 6, 4)
								.sexo("M")
								.rutina(new RutinaSedentaria)
								.preferencia("carne")
								.condicion(new CondicionHipertension)
								.conRecetaFavorita(fideosConManteca)
								.conRecetaFavorita(arrozConPollo)
								.conRecetaFavorita(lomoMostaza)
								.email("dtoja@unsam.edu.ar")
								.conPassword("daniel")
								.build()
		
		juan = new UsuarioBuilder("Juan")
								.peso(80.0)
								.altura(1.87)
								.fechaNacimiento(1991, 8, 1)
								.sexo("M")
								//.rutina(new RutinaSedentaria)
								.email("jcantarini@unsam.edu.ar")
								.conPassword("juan")
								.build()
								
		gabriel = new UsuarioBuilder("Gabriel")
								.peso(88.4)
								.altura(1.85)
								.fechaNacimiento(1986, 7, 12)
								.sexo("M").rutina(new RutinaActiva)
								.condicion(new CondicionCeliaco)
								.email("gperez@unsam.edu.ar")
								.conPassword("gabriel")
								.build()
		
		miguel = new UsuarioBuilder("Miguel")
								.peso(95.4)
								.altura(1.73)
								.fechaNacimiento(1992, 6, 28)
								.sexo("M")
								.rutina(new RutinaActiva)
								.preferencia("pescado")
								.email("mgagliardo@unsam.edu.ar")
								.conPassword("miguel")
								.build()
		
		carlos = new UsuarioBuilder("Carlos")
								.peso(77.4)
								.altura(1.68)
								.fechaNacimiento(1992, 10, 25)
								.sexo("M")
								.rutina(new RutinaSedentaria)
								.condicion(new CondicionDiabetes)
								.email("clopez@unsam.edu.ar")
								.conPassword("carlos")
								.build()
		
		manuel = new UsuarioBuilder("Manuel")
								.peso(82.4)
								.altura(1.95)
								.fechaNacimiento(1992, 4, 1)
								.sexo("M")
								.rutina(new RutinaActiva)
								.preferencia("verduras")
								.condicion(new CondicionVegano)
								.email("mscalabrini@unsam.edu.ar")
								.conPassword("manuel")
								.build()
		
		usuarios => [add(tojo) add(juan) add(gabriel) add(miguel) add(carlos) add(manuel)]
	
		usuarios.add(tojo)
		usuarios.add(juan)
	
	}
	
	def logearUsuario(String nombre, String password){	
		
		var Usuario elUsr = usuarios.findFirst[u | u.getNombre().equals(nombre)]
		if((elUsr == null)){
			// se lanza excepcion 
		}else{
			elUsr.validarPassword(password)
			// esto tmb lanza excepción en caso de no estar bien el pass
		}
	}
	
	def logearUsuarioNombre(String nombre) {
		usuarios.findFirst[u | u.getNombre().equals(nombre)]
	}
	
}
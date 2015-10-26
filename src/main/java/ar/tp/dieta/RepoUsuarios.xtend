package ar.tp.dieta

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
public class RepoUsuarios {
	List<Usuario> usuarios = new ArrayList<Usuario>
	
	public def Usuario getUsuarioPorNombre(String nombreDeUsuario) {
		usuarios.findFirst[usuario|usuario.getNombre().equals(nombreDeUsuario)]
	}

	public def getListaDeUsuarios(String nombreDeUsuario) {
		usuarios.filter[it.getNombre().equals(nombreDeUsuario)]
	}

	public def getListaDeUsuarios(Condicion unaCondicion) {
		usuarios.filter[it.tenesEstaCondicion(unaCondicion)]
	}

}

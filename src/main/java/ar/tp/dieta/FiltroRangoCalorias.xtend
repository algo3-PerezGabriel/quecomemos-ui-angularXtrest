package ar.tp.dieta

import ar.tp.dieta.Filtro
import java.util.List

class FiltroRangoCalorias implements Filtro {
	
	int desde
	int hasta
	
	new(int conDesde, int conHasta){
		desde = conDesde
		hasta = conHasta
	}
	
	override aplicarFiltro(List<Receta> recetasSinFiltrar) {
		if(desde == -1 ){ if(hasta == -1){ return recetasSinFiltrar}
			recetasSinFiltrar.filter[receta | receta.getCalorias() < hasta].toList
		}
		if (hasta == -1){
			recetasSinFiltrar.filter[receta | receta.getCalorias() > desde].toList
		}
		else{
			recetasSinFiltrar.filter[receta | (receta.getCalorias() >=  desde && receta.getCalorias <= hasta)].toList
		}
	
	}
}
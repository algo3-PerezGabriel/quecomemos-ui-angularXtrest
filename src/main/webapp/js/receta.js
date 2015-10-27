function Receta (){
}

Receta.asReceta = function (jsonReceta) {
	  return angular.extend(new Receta(), jsonReceta);
};

Receta.esFavorita = function (nombreUsr){
	nombreUsr === this.nombreOwner;
}
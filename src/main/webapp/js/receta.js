function Receta (){
	var self = this;
}

Receta.asReceta = function (jsonReceta) {
	  return angular.extend(new Receta(), jsonReceta);
};


queComemosApp.service('RecetasService',function ($http) {
	
	var self = this;
	
	this.recetasEnGrilla = [];

	this.nombreUsr = "";


	this.restRecetas = function(callback) {
      $http.get('/logearUsuario/'+ self.nombreUsr).then(callback);
    };

	this.getRecetaById = function (identifier) {
    	return _.find(self.recetasEnGrilla, function(receta) {
      		return receta.sId === identifier;
    	});
    };
    
});


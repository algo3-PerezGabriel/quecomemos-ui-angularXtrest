
queComemosApp.service('RecetasService',function ($http) {
	
	var self = this;
	
	this.recetasEnGrilla = [];

	this.usr = {};


	this.restRecetas = function(callback) {
      $http.post('/logearUsuario', self.usr).then(callback);
    }; /* $http.post('/logearUsuario/', self.usr).then(callback);*/

	this.getRecetaById = function (identifier) {
    	return _.find(self.recetasEnGrilla, function(receta) {
      		return receta.sId === identifier;
    	});
    };
    
});


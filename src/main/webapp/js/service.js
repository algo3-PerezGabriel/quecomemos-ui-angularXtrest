
queComemosApp.service('RecetasService',function ($http) {
	
	var self = this;
	this.nombreUsr = 'Gabriel';
	self.recetasEnGrilla = [];

	this.findAll = function(callback) {
        $http.get('/logearUsuario/'+ this.nombreUsr).then(callback);
    };


	this.getRecetaById = function (identifier) {
    	return _.find(self.recetasEnGrilla, function(receta) {
      		return receta.identificador == identifier;
    	});
    };
    
});


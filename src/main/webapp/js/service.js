
queComemosApp.service('RecetasService',function ($http) {

	this.nombreUsr = 'Gabriel';
	this.recetasMostradas = [];
	
	this.findAll = function(callback) {
        $http.get('/logearUsuario/'+ this.nombreUsr).then(callback);
    };


	this.getRecetaById = function (identifier) {
    	return _.find(this.recetasMostradas, function(receta) {
      		return receta.identificador == identifier;
    	});
    };
    
});


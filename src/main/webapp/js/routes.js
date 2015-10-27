'use strict';

queComemosApp.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/");

  $stateProvider

/*
  .state('pantallaLogin', {
    url:"/",
    templateUrl: "partials/login.html",
    controller: "LonginController as loginCtrl"
  })   

*/
  .state('pantallaBienvenida', {
    url: "/",
    templateUrl: "partials/bienvenida.html",
    controller: "BienvenidaController as bienvenidaCtrl"
  })

  .state('verDetalle', {
    url: "/receta/:identifier",
    templateUrl: "partials/vistaReceta.html",
    controller: "DetalleController as detalleCtrl"
  });

});
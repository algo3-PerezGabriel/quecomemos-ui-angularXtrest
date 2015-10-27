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

 .state('editar',{
    url: "/receta/editar/:identificador",
    templateUrl: "partials/editar.html",
    controller: "EditarController as editarCtrl"
  })

  .state('pantallaBienvenida', {
    url: "/",
    templateUrl: "partials/bienvenida.html",
    controller: "BienvenidaController as bienvenidaCtrl"
  })

  .state('verDetalle', {
    url: "/receta/:identifier",
    templateUrl: "partials/vistaReceta.html",
    controller: "DetalleController as detalleCtrl"
  })
});
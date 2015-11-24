function Opcion (nombre) {
	this.valor = nombre;
}

function Combos (){
	this.dificultades = [new Opcion('Facil'), new Opcion('Dificil'), new Opcion('Mediana')];
	this.temporadas = [new Opcion('TODO EL AÑO'), new Opcion('INVIERNO'), new Opcion('VERANO'), new Opcion('OTOÑO'),new Opcion('PRIMAVERA')];
}
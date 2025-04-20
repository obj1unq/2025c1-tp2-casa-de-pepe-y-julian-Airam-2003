object electrodomestico {
	
}

object mueble {
	
}

object comida {
	
}

object heladera {
	method precio() = 20000
	method esDeCategoria(categoria) = categoria == self.categoria()
	method categoria() = electrodomestico
}

object cama {
	method precio() = 8000
	
	method esDeCategoria(categoria) = categoria == self.categoria()
	
	method categoria() = mueble
}

object tiraDeAsado {
	method precio() = 350
	method esDeCategoria(categoria) = categoria == self.categoria()
	method categoria() = comida
}

object paqueteDeFideos {
	method precio() = 50
	method esDeCategoria(categoria) = categoria == self.categoria()
	method categoria() = comida
}

object plancha {
	method precio() = 1200
	method esDeCategoria(categoria) = categoria == self.categoria()
	method categoria() = electrodomestico
}
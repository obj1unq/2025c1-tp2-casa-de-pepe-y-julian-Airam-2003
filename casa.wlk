import cosas.*

object cuentaCorriente {
  var saldo = 30000
  
  method saldo() = saldo
  
  method saldo(_saldo) {
    saldo = _saldo
  }
  
  method depositar(cantidad) {
    saldo += cantidad
  }
  
  method verificarExtraccion(cantidad) {
    if (cantidad > saldo) self.error(
        "ERROR: La cantidad a extraer sobrepasa el saldo actualmente disponible"
      )
  }
  
  method extraer(cantidad) {
    self.verificarExtraccion(cantidad)
    saldo -= cantidad
  }
}

object cuentaConGastos {
  var saldo = 500
  const costoPorOperacion = 20
  
  method saldo() = saldo
  
  method saldo(_saldo) {
    saldo = _saldo
  }
  
  method depositoTotal(cantidad) = cantidad - costoPorOperacion
  
  method verificarDeposito(cantidad) {
    if (cantidad > 1000) self.error(
        "ERROR: La cantidad a depositar supera el limite de 1000"
      )
  }
  
  method depositar(cantidad) {
    self.verificarDeposito(cantidad)
    saldo += self.depositoTotal(cantidad)
  }
  
  method extraer(cantidad) {
    saldo -= cantidad
  }
}

object casaDePepeYJulian {
  const cosasCompradas = []
  var importeTotal = 0
  var cuentaActual = cuentaCorriente
  
  method cosasCompradas() = cosasCompradas
  
  method cuentaActual() = cuentaActual
  
  method importeTotal() = importeTotal
  
  method cuentaActual(_cuentaActual) {
    cuentaActual = _cuentaActual
  }
  
  method comprar(cosa) {
    cuentaActual.extraer(cosa.precio())
    cosasCompradas.add(cosa)
    importeTotal += cosa.precio()
  }
  
  method cantidadDeCosasCompradas() = cosasCompradas.size()
  
  method tieneAlgun(categoria) = cosasCompradas.any(
    { o => o.categoria() == categoria }
  )
  
  method vieneDeComprar(
    categoria
  ) = cosasCompradas.last().categoria() == categoria
  
  method esDerrochona() = importeTotal >= 9000
  
  method compraMasCara() = cosasCompradas.sortBy({ o1, o2 => o1 > o2 })
  
  method comprados(categoria) = cosasCompradas.filter(
    { o => o.categoria() == categoria }
  )
  
  method malaEpoca() = cosasCompradas.all({ o => o.categoria() == comida })
  
  method queFaltaComprar(lista) = lista.filter(
    { o => !cosasCompradas.contains(o) }
  )
  
  method faltaComida() = cosasCompradas.filter(
    { o => o.categoria() == comida }
  ).size() < 2
  
  method categoríasCompradas() = cosasCompradas.map(
    { o => o.categoria() }
  ).withoutDuplicates()
}
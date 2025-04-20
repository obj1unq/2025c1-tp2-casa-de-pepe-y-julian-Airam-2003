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
  var cuentaActual = cuentaCorriente
  
  method cosasCompradas() = cosasCompradas
  
  method cuentaActual() = cuentaActual
  
  method importeTotal() = cosasCompradas.fold(
    0,
    { total, objeto => total + objeto.precio() }
  )
  
  method cuentaActual(_cuentaActual) {
    cuentaActual = _cuentaActual
  }
  
  method comprar(cosa) {
    cuentaActual.extraer(cosa.precio())
    cosasCompradas.add(cosa)
  }
  
  method cantidadDeCosasCompradas() = cosasCompradas.size()
  
  method tieneAlgun(categoria) = cosasCompradas.any(
    { objeto => objeto.categoria() == categoria }
  )
  
  method vieneDeComprar(categoria) = cosasCompradas.last().esDeCategoria(
    categoria
  )
  
  method esDerrochona() = self.importeTotal() >= 9000
  
  method compraMasCara() = cosasCompradas.max({ objeto => objeto.precio() })
  
  method comprados(categoria) = cosasCompradas.filter(
    { objeto => objeto.categoria() == categoria }
  )
  
  method malaEpoca() = cosasCompradas.all(
    { objeto => objeto.esDeCategoria(comida) }
  )
  
  method queFaltaComprar(lista) = lista.filter(
    { objeto => !cosasCompradas.contains(objeto) }
  )
  
  method faltaComida() = cosasCompradas.count(
    { objeto => objeto.esDeCategoria(comida) }
  ) < 2
  
  method categoríasCompradas() = cosasCompradas.map(
    { objeto => objeto.categoria() }
  ).withoutDuplicates()
}
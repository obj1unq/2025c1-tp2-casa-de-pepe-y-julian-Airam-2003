import cosas.* 

object casaDePepeYJulian {
    var cosasCompradas = []
    var importeTotal   = 0

    method cosasCompradas() = cosasCompradas
    method importeTotal()   = importeTotal

    method comprar(cosa) {
        cosasCompradas = cosasCompradas.add(cosa)
        importeTotal += cosa.precio()
    }

    method cantidadDeCosasCompradas() {
        return cosasCompradas.size()
    }

    method tieneAlgun(categoria) {
        cosasCompradas.findOrElse({n => n.categoria() == categoria}, false)
    }

    method vieneDeComprar(categoria) {
        return cosasCompradas.last().categoria() == categoria
    }

    method esDerrochona() {
        return importeTotal >= 9000
    }

    method compraMasCara() {

    }

    method comprados(categoria) {

    }

    method malaEpoca() {

    }

    method queFaltaComprar(lista) {

    }

    method faltaComida() {

    }

    method categoríasCompradas() {

    }
}

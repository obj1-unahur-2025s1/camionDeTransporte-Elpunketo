object knightRider {
    method peso() {return 500}
    method bultos() {return 1}
    method peligrosidad() {return 10}
    method consecuenciaCarga() {}
}
//

object bumblebee {
    var esRobot = false
    method peligrosidad(){
        if(esRobot){
            30
        }
        else{
            15
        }
    }
    method esRobot() {return esRobot}
    method transformarRobot(){
        esRobot = true
    }
    method transformarAuto(){
        esRobot = false
    }
    method peso() {return 800}
    method bultos() {return 2}
    method consecuenciaCarga(){
        self.transformarRobot()
    }
}

object ladrillos{
    var cantidadLadrillos = 0
    method cantidadLadrillos(unaCantidad) {cantidadLadrillos = unaCantidad}
    method cantidadLadrillos() {return cantidadLadrillos}
    method peso() {return 2 * cantidadLadrillos}
    method peligrosidad() {return 2}
    method bultos() {
        if(cantidadLadrillos <= 100){
            return 1
        }
        else if(cantidadLadrillos.between(101,300)){
            return 2
        }
        else{
            return 3
        }
    }
    method consecuenciaCarga(){
        self.cantidadLadrillos(cantidadLadrillos + 12)
    }
}

object arena{
    var property peso = 0
    //property tiene: method peso(unPeso) {peso = unPeso}
    //property tiene: method peso() {return peso}
    //property solo usar cuando no hay que incrementar o degradar el valor de la variable
    method peligrosidad() {return 1}
    method bultos() {return 1}
    method consecuenciaCarga(){
        peso = 0.max(peso-10)
    }
}

object bateriaAntiaerea{
    var tieneMisiles = false
    method tieneMisiles() {return tieneMisiles}
    method cargarMisiles(){
        tieneMisiles = true
    }
    method descargarMisiles(){
        tieneMisiles = false
    }
    method peso(){
        if(tieneMisiles){
            return 300
        }
        else{
            return 200
        }
    }
    method peligrosidad(){
        if(tieneMisiles){
            100
        }
        else{
            0
        }
    }
    method bultos() {
        if(self.tieneMisiles()){
            return 2
        }
        else{
            return 1
        }
    }
    method consecuenciaCarga(){
        self.cargarMisiles()
    }
}

object contenedor {
    const cosas = []
    method agregarCosa(unaCosa){
        cosas.add(unaCosa)
    }
    method quitarCosa(unaCosa){
        cosas.remove(unaCosa)
    }
    method agregarVariasCosas(unaListaDeCosas){
        cosas.addAll(unaListaDeCosas)
    }
    method peso() {return 100 + self.pesoDeLasCosas()}
    method pesoDeLasCosas() {return cosas.sum({cosa => cosa.peso()})}
    method peligrosidad(){
        if(cosas.isEmpty()){
            0
        }
        else{
            cosas.max({c => c.peligrosidad()}).peligrosidad()
        }
    }
    method bultos() {
        return 1 + cosas.sum({c=>c.bultos()})
        }
    method consecuenciaCarga(){
        cosas.forEach({c=>c.consecuenciaCarga()})
    }
}

object residuos {
    var property peso = 0
    method peligrosidad() {return 200}
    method bultos() {return 1}
    method consecuenciaCarga(){
        peso = peso + 15
    }
}

object embalaje {
    var property cosaEnvuelta = arena
    method peso() {return cosaEnvuelta.peso()}
    method peligrosidad() {return cosaEnvuelta.peligrosidad() / 2}
    method bultos() {return 2}
    method consecuenciaCarga() {}
}
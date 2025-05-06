object camion {
    const carga = []
    method cargar(unaCosa){
        carga.add(unaCosa)
        unaCosa.consecuenciaCarga()
    }
    method descargar(unaCosa){
        carga.remove(unaCosa)
    }
    method pesoTotal() {return 1000 + self.pesoDeLaCarga()}
    method pesoDeLaCarga(){
        return carga.sum({c=>c.peso()})
    }
    method todoPesoPar(){
        return carga.all({c=>c.peso().even()})
    }
    method cosaPesa(unValor){
        return carga.any({c=>c.peso() == unValor})
    }
    method cosaConPeligrosidad(unNivel){
        return carga.find({c=>c.peligrosidad() == unNivel})
    }
    method cosasSuperanPeligrosidad(unNivel){
        return carga.filter({c=>c.peligrosidad() > unNivel})
    }
    method cosasMasPeligrosasQue(unaCosa){
        return carga.filter({c=> c.peligrosidad() > unaCosa.peligrosidad()})
    
    }
    method excedidoDePeso(){
        return(self.pesoTotal() > 2500)
    }
    method puedeCircular(unNivel){
        return not self.excedidoDePeso() && self.cosasSuperanPeligrosidad(unNivel).isEmpty()
    }
    method tieneAlgoQuePesaEntre(min, max){
        return carga.any({c=>c.peso().between(min,max)})
    }
    method cosaMasPesada(){
        carga.max({c=>c.peso()})
    }
}
/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	var property objetivo = pelota 
	var property camiseta = "lionel-titular.png"

	method image() {
		return camiseta
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	method buscarla(){
		position = objetivo.position()
	}

	//CAMBIO DE CAMISETA 
	method cambiarCamiseta(){
		if(position == game.at(0,position.y())){
			self.cambioCamiseta()
		}
		else{
			self.error("No esta en el borde")
		}
	}
	method cambioCamiseta(){
		if(camiseta == "lionel-titular.png"){
			camiseta = "lionel-suplente.png"
		}else{
			camiseta = "lionel-titular.png"
		}
	}
	/*method levantarla(){
		pelota.levantarPelota()
		pelota.gravedad()
	}*/
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	method validarPatear(){
		 if(self.position() != lionel.position()){
			self.error("no esta en la pelota")
		 }
	}
	method patear() {
		self.validarPatear()
		const proximaX = (position.x() + 3).min(game.width()-1)
		self.position(game.at(proximaX,position.y()))
	  }
	method validarTaquito(){
		if (self.position() != lionel.position()){
			self.error("no esta en la pelota")
		}
	}
	method taquito(){
		self.validarTaquito()
		const xPostTaquito = (position.x() - 2).max(0)
		self.position(game.at(xPostTaquito,position.y()))
	}
}


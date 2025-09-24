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
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	
}


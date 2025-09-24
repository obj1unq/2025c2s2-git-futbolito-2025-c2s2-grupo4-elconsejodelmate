/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	
	method image() {
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	
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
	
}

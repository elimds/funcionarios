package funcionarios

import javax.transaction.Transactional;

class CargoController {

    def beforeInterceptor = [action:this.&auth, except:["index", "list", "show"]]

    def auth() {
      if(session.user && session.user.login != "admin") {
        flash.message = "Desculpe, você não tem permissão para realizar esta ação. =("
        redirect(controller:"funcionario", action:"index")
        return false
      }
    }
	
	static allowedMethods = [salvar: "POST", excluir: "DELETE"]
	
	def index() {
		def lista = Cargo.list()
		render(view: "/cargo/index", model: [cargos: lista])
	}
	
	def novo(){
		def novoCargo = new Cargo()
		render(template: "/cargo/form", model: [cargo: novoCargo])
	}
	
	def lista(){
		def lista = Cargo.list()
		render(template: "/cargo/list", model: [cargos: lista])
	}
	
	def editar(){
		def cargo = Cargo.get(params.id)
		render(template: "/cargo/form", model: [cargo: cargo])
	}
	
	@Transactional
	def excluir(){
		def cargo = Cargo.get(params.id)
		cargo.delete(flush:true)
		render("Registro excluido com sucesso!")
	}
	
	@Transactional
	def salvar(){
		Cargo cargo
		
		if (params?.id){
			cargo = Cargo.get(params.id)
		} else {
			cargo= new Cargo()
		}
		cargo.nome = params.nome
		cargo.classe = params.classe
		
		cargo.validate()
		if (!cargo.hasErrors()){
			cargo.save(flush:true)
			render ("Titulação salva com sucesso!")
		} else {
			render ("Erro ao salvar este registro... <br /> ${cargo.errors}")
		}
	}

}

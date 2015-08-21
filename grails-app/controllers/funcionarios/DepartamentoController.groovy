package funcionarios

import javax.transaction.Transactional;

class DepartamentoController {

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
		def lista = Departamento.list()
		render(view: "/departamento/index", model: [departamentos: lista])
	}
	
	def novo(){
		def novoDepartamento = new Departamento()
		render(template: "/departamento/form", model: [departamento: novoDepartamento])
	}
	
	def lista(){
		def lista = Departamento.list()
		render(template: "/departamento/list", model: [departamentos: lista])
	}
	
	def editar(){
		def departamento = Departamento.get(params.id)
		render(template: "/departamento/form", model: [departamento: departamento])
	}
	
	@Transactional
	def excluir(){
		def departamento = Departamento.get(params.id)
		departamento.delete(flush:true)
		render("Registro excluido com sucesso!")
	}
	
	@Transactional
	def salvar(){
		Departamento departamento
		
		if (params?.id){
			departamento = Departamento.get(params.id)	
		} else {
			departamento = new Departamento()
		}
		departamento.nome = params.nome
		departamento.sigla = params.sigla
		departamento.email = params.email
		departamento.ramal = params.ramal
		departamento.chefe = params.chefe
		
		departamento.validate()
		if (!departamento.hasErrors()){
			departamento.save(flush:true)
			render ('Departamento salvo com sucesso!')
		} else {
			render ('Erro ao salvar este departamento.')
		}
	}
}

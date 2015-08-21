package funcionarios

import javax.transaction.Transactional;

class TitulacaoController {

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
		def lista = Titulacao.list()
		render(view: "/titulacao/index", model: [titulacoes: lista])
	}
	
	def novo(){
		def novaTitulacao = new Titulacao()
		render(template: "/titulacao/form", model: [titulacao: novaTitulacao])
	}
	
	def lista(){
		def lista = Titulacao.list()
		render(template: "/titulacao/list", model: [titulacoes: lista])
	}
	
	def editar(){
		def titulacao = Titulacao.get(params.id)
		render(template: "/titulacao/form", model: [titulacao: titulacao])
	}
	
	@Transactional
	def excluir(){
		def titulacao = Titulacao.get(params.id)
		titulacao.delete(flush:true)
		render("Registro excluido com sucesso!")
	}
	
	@Transactional
	def salvar(){
		Titulacao titulacao
		
		if (params?.id){
			titulacao = Titulacao.get(params.id)
		} else {
			titulacao = new Titulacao()
		}
		titulacao.descricao = params.descricao
		titulacao.grau = params.grau
		titulacao.cargaHoraria = params.cargaHoraria.toInteger()
		titulacao.instituicao = params.instituicao
		
		titulacao.validate()
		if (!titulacao.hasErrors()){
			titulacao.save(flush:true)
			render ("Titulação salva com sucesso!")
		} else {
			render ("Erro ao salvar este registro... <br /> ${titulacao.errors}")
		}
	}

}

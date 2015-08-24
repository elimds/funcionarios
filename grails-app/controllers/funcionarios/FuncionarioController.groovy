package funcionarios



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FuncionarioController {

    def beforeInterceptor = [action:this.&auth, except:["index", "list", "show", "optionsCidade"]]

    def auth() {
		println "Params= ${params.action} params.id = ${params.id}"
		println params 
		// session?.user?.id != funcionarioInstance?.usuario?.id
		if (session?.user?.login != "admin" && (params.id || params.funcionario.id )){
			Funcionario funcionario
			if (params.action == "excluirDependente" ){
				def dependente = Dependente.get(params.id)
				funcionario = dependente.funcionario
			} else if (params.action == "excluirContato"){
				def contato = Contato.get(params.id)
				funcionario = contato.funcionario
			} else if (params.action == "excluirEndereco"){
				def endereco = Endereco.get(params.id)
				funcionario = endereco.funcionario
			} else if (params.action == "excluirTitulacao"){
				def titulacao = Titulacao.get(params.id)
				funcionario = titulacao.funcionario
			} else {
				def id = params.id ? params.id : params.funcionario.id
				funcionario = Funcionario.get(id)
			}
			if (funcionario.usuario.id == session.user?.id){
				return true
			} else {
				flash.message = "Desculpe, você não tem permissão para realizar esta ação. =("
				redirect(controller:"funcionario", action:"index")
				return false
			}
		} else if (session?.user?.login != "admin") {
	        flash.message = "Desculpe, você não tem permissão para realizar esta ação. =("
	        redirect(controller:"funcionario", action:"index")
	        return false
		}
    }    

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Funcionario.list(params), model:[funcionarioInstanceCount: Funcionario.count()]
    }

    def show(Funcionario funcionarioInstance) {
        respond funcionarioInstance
    }

    def create() {
        respond new Funcionario(params)
    }

    @Transactional
    def save(Funcionario funcionarioInstance) {
		println "usuario logado: ${session.user.id}" 
		//funcionarioInstance.usuario = User.get(session.user.id)
        if (funcionarioInstance == null) {
            notFound()
            return
        }

        if (funcionarioInstance.hasErrors()) {
            respond funcionarioInstance.errors, view:'create'
            return
        }
		
        funcionarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), funcionarioInstance.nome])
                redirect funcionarioInstance
            }
            '*' { respond funcionarioInstance, [status: CREATED] }
        }
    }

    def edit(Funcionario funcionarioInstance) {
        respond funcionarioInstance
    }
	
	def listaContatos(){
		Funcionario funcionario = Funcionario.get(params?.id) 
		render(template: "/funcionario/listaContatos", model: [funcionarioInstance: funcionario])
	}

	@Transactional
	def adicionarContato(){
		Contato contato
		if (params?.id){
			contato = Contato.get(params.id)
		} else {
			contato = new Contato()
		} 
		contato.funcionario = Funcionario.get(params.funcionario.id) 
		contato.tipo = params.tipo
		contato.valor = params.valor
		contato.save(flush:true)
		render ('Contato salvo com sucesso!')
	}

	@Transactional
	def excluirContato(){
		Contato contato = Contato.get(params.id)
		contato.delete(flush:true)
		render("Registro excluido com sucesso!")
	}

    def listaDependentes(){
        Funcionario funcionario = Funcionario.get(params?.id) 
        render(template: "/funcionario/listaDependentes", model: [funcionarioInstance: funcionario])
    }

    def listaTitulacoes(){
        Funcionario funcionario = Funcionario.get(params?.id) 
        render(template: "/funcionario/listaTitulacoes", model: [funcionarioInstance: funcionario])
    }

	// Endereço
	def listaEnderecos(){
		Funcionario funcionario = Funcionario.get(params?.id)
		render(template: "/funcionario/listaEnderecos", model: [funcionarioInstance: funcionario])
	}
	
	def editarEndereco(){
		Endereco endereco = Endereco.get(params?.id)
		def cidades = Cidade.findAllByEstado( endereco.estado)
		render(template: "/funcionario/endereco", model: [enderecoInstance: endereco, cidadeList: cidades, funcionarioInstance: endereco.funcionario])
	}
	
	def editarTitulacao(){
		Titulacao titulacao = Titulacao.get(params?.id)
		render(template: "/funcionario/titulacao", model: [titulacaoInstance: titulacao, funcionarioInstance: titulacao.funcionario])
	}

	def editarDependente(){
		Dependente dependente = Dependente.get(params?.id)
		render(template: "/funcionario/dependente", model: [dependenteInstance: dependente, funcionarioInstance: dependente.funcionario])
	}

	@Transactional
	def adicionarEndereco(){
		Endereco endereco
		if (params?.id){
			endereco = Endereco.get(params.id)
		} else {
			endereco = new Endereco()
		}
		endereco.funcionario = Funcionario.get(params.funcionario.id)
		endereco.rua = params.rua
		endereco.numero = params.numero.toInteger()
		endereco.complemento = params.complemento
		endereco.bairro = params.bairro
		endereco.estado = Estado.get(params.estado.id.toInteger())
		endereco.cidade = Cidade.get(params.cidade.id.toInteger())
		endereco.cep = params.cep
		endereco.save(flush:true)
		render ('Endereço salvo com sucesso!')
	}

	@Transactional
	def excluirEndereco(){
		Endereco endereco = Endereco.get(params?.id)
		endereco.delete(flush:true)
		render("Registro excluido com sucesso!")
	}
	
	@Transactional
	def excluirTitulacao(){
		Titulacao titulacao = Titulacao.get(params?.id)
		titulacao.delete(flush:true)
		render("Registro excluido com sucesso!")
	}

	@Transactional
	def excluirDependente(){
		Dependente dependente = Dependente.get(params?.id)
		dependente.delete(flush:true)
		render("Registro excluido com sucesso!")
	}
	
	def optionsCidade() {
		def estado = params.estado ?: 1
//		println "Estado: <<< ${estado} >>>"
		def cidades = Cidade.findAllByEstado( Estado.get(estado))
		render(template:"optionsCidade", model: [ cidadeList: cidades ])
	}
	
    @Transactional
    def update(Funcionario funcionarioInstance) {
        if (funcionarioInstance == null) {
            notFound()
            return
        }

        if (funcionarioInstance.hasErrors()) {
            respond funcionarioInstance.errors, view:'edit'
            return
        }

        funcionarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Funcionario.label', default: 'Funcionario'), funcionarioInstance.id])
                redirect funcionarioInstance
            }
            '*'{ respond funcionarioInstance, [status: OK] }
        }
    }
	
    @Transactional
    def adicionarDependente(){
		Dependente dependente
		if (params?.id){
			dependente = Dependente.get(params.id)
		} else {
			dependente = new Dependente()
		}
        dependente.funcionario = Funcionario.get(params.funcionario.id) 
        dependente.nome = params.nome
        dependente.dataNascimento = params.dataNascimento
        dependente.identidade = params.identidade
        dependente.cpf = params.cpf
        
        dependente.save(flush:true)
        
        render ('Dependente salvo com sucesso!')
    }

    @Transactional
    def adicionarTitulacao(){
		Titulacao titulacao
		if (params?.id){
			titulacao = Titulacao.get(params.id)
		} else {
			titulacao = new Titulacao()
		}
        titulacao.funcionario = Funcionario.get(params.funcionario.id) 
        titulacao.descricao = params.descricao
        titulacao.grau = params.grau
        titulacao.cargaHoraria = params.cargaHoraria.toInteger()
		titulacao.instituicao = params.instituicao
        titulacao.save(flush:true)
        render ('Titulação salva com sucesso!')
    }

    @Transactional
    def delete(Funcionario funcionarioInstance) {
        if (funcionarioInstance == null) {
            notFound()
            return
        }
        funcionarioInstance.delete flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Funcionario.label', default: 'Funcionario'), funcionarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'funcionario.label', default: 'Funcionario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

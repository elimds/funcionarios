package funcionarios



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FuncionarioController {

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
	def adicionarContato(){
		Contato contato = new Contato()
		contato.funcionario = Funcionario.get(params.funcionario.id) 
		contato.tipo = params.tipo
		contato.valor = params.valor
		contato.save(flush:true)
		render ('Contato salvo com sucesso!')
	}

    @Transactional
    def adicionarDependente(){
        Dependente dependente = new Dependente()
        println(params)
        dependente.funcionario = Funcionario.get(params.funcionario.id) 
        dependente.nome = params.nome
        dependente.dataNascimento = params.dataNascimento
        dependente.identidade = params.identidade
        dependente.cpf = params.cpf
        
        dependente.save(flush:true)
        
       // println contato
        
        render ('Dependente salvo com sucesso!')
    }

    @Transactional
    def adicionarTitulacao(){
        Titulacao titulacao = new Titulacao()
        println(params)
        titulacao.funcionario = Funcionario.get(params.funcionario.id) 
        titulacao.descricao = params.descricao
        titulacao.grau = params.grau
        println params.cargaHoraria.toInteger()
        titulacao.cargaHoraria = params.cargaHoraria.toInteger()
        
        titulacao.save(flush:true)
        
       // println contato
        
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

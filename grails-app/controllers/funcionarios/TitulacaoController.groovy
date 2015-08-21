package funcionarios


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TitulacaoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Titulacao.list(params), model:[titulacaoInstanceCount: Titulacao.count()]
    }

    def show(Titulacao titulacaoInstance) {
        respond titulacaoInstance
    }

    def create() {
        respond new Titulacao(params)
    }

    @Transactional
    def save(Titulacao titulacaoInstance) {
        if (titulacaoInstance == null) {
            notFound()
            return
        }

        if (titulacaoInstance.hasErrors()) {
            respond titulacaoInstance.errors, view:'create'
            return
        }

        titulacaoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'titulacao.label', default: 'Titulacao'), titulacaoInstance.id])
                redirect titulacaoInstance
            }
            '*' { respond titulacaoInstance, [status: CREATED] }
        }
    }

    def edit(Titulacao titulacaoInstance) {
        respond titulacaoInstance
    }

    @Transactional
    def update(Titulacao titulacaoInstance) {
        if (titulacaoInstance == null) {
            notFound()
            return
        }

        if (titulacaoInstance.hasErrors()) {
            respond titulacaoInstance.errors, view:'edit'
            return
        }

        titulacaoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Titulacao.label', default: 'Titulacao'), titulacaoInstance.id])
                redirect titulacaoInstance
            }
            '*'{ respond titulacaoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Titulacao titulacaoInstance) {

        if (titulacaoInstance == null) {
            notFound()
            return
        }

        titulacaoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Titulacao.label', default: 'Titulacao'), titulacaoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'titulacao.label', default: 'Titulacao'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

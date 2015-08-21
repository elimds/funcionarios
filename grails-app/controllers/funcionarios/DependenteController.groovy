package funcionarios


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DependenteController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Dependente.list(params), model:[dependenteInstanceCount: Dependente.count()]
    }

    def show(Dependente dependenteInstance) {
        respond dependenteInstance
    }

    def create() {
        respond new Dependente(params)
    }

    @Transactional
    def save(Dependente dependenteInstance) {
        if (dependenteInstance == null) {
            notFound()
            return
        }

        if (dependenteInstance.hasErrors()) {
            respond dependenteInstance.errors, view:'create'
            return
        }

        dependenteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'dependente.label', default: 'Dependente'), dependenteInstance.id])
                redirect dependenteInstance
            }
            '*' { respond dependenteInstance, [status: CREATED] }
        }
    }

    def edit(Dependente dependenteInstance) {
        respond dependenteInstance
    }

    @Transactional
    def update(Dependente dependenteInstance) {
        if (dependenteInstance == null) {
            notFound()
            return
        }

        if (dependenteInstance.hasErrors()) {
            respond dependenteInstance.errors, view:'edit'
            return
        }

        dependenteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Dependente.label', default: 'Dependente'), dependenteInstance.id])
                redirect dependenteInstance
            }
            '*'{ respond dependenteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Dependente dependenteInstance) {

        if (dependenteInstance == null) {
            notFound()
            return
        }

        dependenteInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Dependente.label', default: 'Dependente'), dependenteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dependente.label', default: 'Dependente'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

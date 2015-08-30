package funcionarios



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'create'
            return
        }

        userInstance.password = userInstance.password.encodeAsPassword()

        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
		if (session.user.login == "admin" || userInstance.id == session.user.id){
			respond userInstance
		} else {
			flash.message = "Desculpe, você não tem permissão para realizar esta ação. =("
			redirect(action: index)
		}
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }
		
		userInstance.password = userInstance.password.encodeAsPassword()
        userInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.name])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }







  def beforeInterceptor = [action:this.&auth, except:["logout", "login", "index", "show", "edit"]]

  def auth() {
    if(session.user && session.user.login != "admin") {
      flash.message = "Desculpe, você não tem permissão para realizar esta ação. =("
      redirect(controller:"funcionario", action:"index")
      return false
    }
  }  

  def login = {}

  def authenticate = {
    def passwordHashed = params.password.encodeAsPassword()
    def user = User.findByLoginAndPassword(params.login, passwordHashed)
    if(user){
      session.user = user
	  println("session.user.id: ${ session.user.id }")

      //def usuario = User.find(session.user.id.toInteger())
      def funcionario = Funcionario.countByUsuario(user)
     
      //Verifica se o usuario ja possui cadastro de funcionario, se não redireciona para preencher form
      if(funcionario < 1 && session.user.login != "admin"){
        flash.message = "Olá ${user.name}! Por favor, cadastre os seus dados pessoais."
        redirect(controller:"funcionario", action:"create")  
      }else{
        flash.message = "Olá ${user.name}!"
        redirect(controller:"funcionario", action:"index")
      }

    }else{
      flash.message = "Desculpe, ${params.login}. Tente outra vez."
      redirect(action:"login")
    }
  }

  def logout = {
    flash.message = "Até mais ${session.user.name}!"
    session.user = null
    redirect(controller:"user", action:"login")
  }






}

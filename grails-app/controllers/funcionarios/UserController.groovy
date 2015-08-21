package funcionarios

class UserController {

  def beforeInterceptor = [action:this.&auth, except:["logout", "login"]]

  def auth() {
    if(session.user && session.user.login != "admin") {
      flash.message = "Desculpe, você não tem permissão para realizar esta ação. =("
      redirect(controller:"funcionario", action:"index")
      return false
    }
  }  

  def scaffold = User

  def login = {}

  def authenticate = {
    def user = User.findByLoginAndPassword(params.login, params.password)
    if(user){
      session.user = user
      flash.message = "Olá ${user.name}!"
      redirect(controller:"funcionario", action:"index")
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
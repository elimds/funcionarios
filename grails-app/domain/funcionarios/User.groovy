package funcionarios

class User {

  String login
  String password
  String name

  static constraints = {
    login(unique:true)
    password(password:true)
    name()
  }

  String toString(){
    name
  }

}
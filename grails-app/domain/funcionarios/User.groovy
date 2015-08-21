package funcionarios

import com.bloomhealthco.jasypt.GormEncryptedStringType

class User {
  static constraints = {
    login(unique:true)
    password(password:true)
    name()
  }
  
  //static hasMany = [entries:Entry]
  
  String login
  String password
  String name

  // static mapping = {
  // 	password type: GormEncryptedStringType
  // }  
  
  String toString(){
    name
  }
}
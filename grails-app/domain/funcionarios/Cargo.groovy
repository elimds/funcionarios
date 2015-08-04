package funcionarios

class Cargo {
	String nome
	String classe
	static hasMany = [funcionarios:Funcionario]
	
    static constraints = {
    }
}

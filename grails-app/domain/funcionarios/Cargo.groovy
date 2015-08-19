package funcionarios

class Cargo {
	String nome
	String classe
	static hasMany = [funcionarios:Funcionario]
	
	String toString(){
		this.nome
	}
	
    static constraints = {
    }
}

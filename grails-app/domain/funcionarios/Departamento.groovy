package funcionarios

class Departamento {
	String nome
	String sigla
	String ramal
	String email
	String chefe
	//Funcionario chefe

	//static belongsTo = [chefe:Funcionario]

	static hasMany = [historicos:HistoricoFuncional, funcionarios:Funcionario]

    static constraints = {
		chefe(nullable:true, blank:true)
		email(nullable:true, blank:true, email:true)
		ramal(nullable:true, blank:true)
    }
	
	String toString(){
		this.nome
	}

}

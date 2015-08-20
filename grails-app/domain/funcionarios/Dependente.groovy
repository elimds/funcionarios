package funcionarios

class Dependente {
	String nome
	Date dataNascimento
	String identidade
	String cpf
	Funcionario funcionario

	static belongsTo = [funcionario:Funcionario]

    static constraints = {
		identidade(nullable:true, blank:true)
		cpf(cpf:true)
    }

	String toString(){
		this.nome
	}

}

package funcionarios

class Dependente {
	String nome
	Date dataNascimento
	String identidade
	String cpf
	Funcionario funcionario

	static belongsTo = [funcionario:Funcionario]

    static constraints = {
    }

	String toString(){
		this.nome
	}

}

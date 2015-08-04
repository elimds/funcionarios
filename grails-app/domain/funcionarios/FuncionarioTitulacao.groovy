package funcionarios

class FuncionarioTitulacao {
	Funcionario funcionario
	Titulacao titulacao
	Date data

	static belongsTo = [funcionario:Funcionario, titulacao:Titulacao]
//	static hasMany = [funcionarios:Funcionario, titulacoes:Titulacao]

    static constraints = {
    }
}

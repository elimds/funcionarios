package funcionarios

class Contato {
	Enum tipo
	String valor
	Funcionario funcionario

	static belongsTo = [funcionario:Funcionario]

    static constraints = {
    }
}

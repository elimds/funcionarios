package funcionarios

class Departamento {
	String nome
	String sigla
	String ramal
	String email
	Funcionario chefe

	static belongsTo = [chefe:Funcionario]

	static hasMany = [historicos:HistoricoFuncional, funcionarios:Funcionario]

    static constraints = {
    }
}

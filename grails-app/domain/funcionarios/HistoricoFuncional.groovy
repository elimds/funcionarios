package funcionarios

class HistoricoFuncional {
	Departamento departamento
	Funcionario funcionario
	Date dataInicio
	Date dataFim
	FuncaoEnum funcaoGratificada

	static belongsTo = [departamento:Departamento, funcionario:Funcionario]

    static constraints = {
    }
}

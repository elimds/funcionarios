package funcionarios

class Funcionario {
	String nome
	String cpf
	Date dataNascimento
	EstadoCivilEnum estadoCivil
	String naturalidade
	SexoEnum sexo
	String pis
	String identidade
	String tituloEleitor
	Integer matricula
	EscolaridadeEnum escolaridade
	String lattes
	Cargo cargo
	RegimeJuridicoEnum regimeJuridico
	Departamento lotacao
	JornadaEnum jornadaTrabalho
	SituacaoEnum situacao
	FuncaoEnum funcaoGratificada
	String contaBancaria
	Integer banco
	String nomeBanco

	//static hasOne = [chefia:Departamento]
	static belongsTo = [cargo:Cargo, departamento:Departamento]
	static hasMany = [enderecos:Endereco, contatos:Contato, historicosFuncional:HistoricoFuncional, titulacoes:FuncionarioTitulacao, dependentes: Dependente]
	
	String toString(){
		this.nome
	}
	
    static constraints = {
		pis(nullable:true, blank:true)
		lattes(nullable:true, blank:true, url: true)
		cpf(cpf:true)
		tituloEleitor(nullable:true, blank:true)
    }
}

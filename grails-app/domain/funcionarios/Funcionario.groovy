package funcionarios

class Funcionario {
	String nome
	String cpf
	Date dataNascimento
	EstadoCivilEnum estadoCivil
	String Naturalidade
	SexoEnum Sexo
	String pis
	String identidade
	String tituloEleitor
	Integer matricula
	EscolaridadeEnum escolaridade
	Integer lattes
	Cargo cargo
	RegimeJuridicoEnum regimeJuridico
	Departamento lotacao
	JornadaEnum jornadaTrabalho
	SituacaoEnum situacao
	FuncaoEnum funcaoGratificada
	String contaBancaria
	Integer banco
	String nomeBanco

    static constraints = {
    }
}

package funcionarios

class Endereco {
	String rua
	Integer numero
	String complemento
	String bairro
	Cidade cidade
	Estado estado
	String cep
	Funcionario funcionario

	static belongsTo = [funcionario:Funcionario, cidade:Cidade, estado:Estado]

    static constraints = {
    }
	
}

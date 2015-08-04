package funcionarios

class Cidade {
	String nome
	Estado estado

	static belongsTo = [estado:Estado]
	static hasMany = [enderecos:Endereco]

    static constraints = {
    }
}

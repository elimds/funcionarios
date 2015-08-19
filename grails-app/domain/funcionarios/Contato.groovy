package funcionarios

class Contato {
	TipoContatoEnum tipo
	String valor
	Funcionario funcionario

	static belongsTo = [funcionario:Funcionario]

    static constraints = {
    }
	
	String toString(){
		this.valor
	}

}

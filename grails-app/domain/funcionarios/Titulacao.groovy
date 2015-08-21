package funcionarios

class Titulacao {
	String descricao
	GrauEnum grau
	Integer cargaHoraria
	String instituicao
	Funcionario funcionario

	static belongsTo = [funcionario:Funcionario]

    static constraints = {
    }
	
	String toString(){
		this.descricao
	}

}

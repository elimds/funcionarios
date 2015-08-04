package funcionarios

class Titulacao {
	String descricao
	GrauEnum grau
	Integer cargaHoraria
	String instituicao

	static hasMany = [funcionarios:FuncionarioTitulacao]

    static constraints = {
    }
}

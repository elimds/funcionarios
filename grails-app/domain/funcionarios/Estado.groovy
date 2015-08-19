package funcionarios

class Estado {
	String nome
	String sigla

	static hasMany = [cidades:Cidade, enderecos:Endereco]

    static constraints = {
    }
	
	String toString(){
		this.nome
	}

}

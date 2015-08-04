package funcionarios

public enum EscolaridadeEnum {
	FUNDAMENTAL('Ensino Fundamental'),
	MEDIO('Ensino Médio'),
	GRADUACAO('Graduação'),
	ESPECIALISTA('Especialização'),
	MESTRE('Mestrado'),
	DOUTOR('Doutorado'),
	POSDOC('Pós Doutorado'),
	String id

	EscolaridadeEnum(String id){
		this.id = id
	}
} 
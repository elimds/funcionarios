public enum GrauEnum {
	GRADUACAO('Graduação'),
	ESPECIALIZACAO('Especialização'),
	MESTRADO('Mestrato'),
	DOUTORADO('Doutorado'),
	POSDOUTORADO('Pós-Doutorado'),
	CAPACITACAO('Capacitação')
	String id

	GrauEnum(String id){
		this.id = id
	}
}
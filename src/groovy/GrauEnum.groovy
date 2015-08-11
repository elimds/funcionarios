
public enum GrauEnum {
	GRADUAÇÃO ("Graduação"),
	ESPECIALIZAÇÃO ("Especialização"),
	MESTRADO ("Mestrado"),
	DOUTORADO ("Doutorado"),
	POSDOUTORADO ("Pós-Doutorado"),
	CAPACITACAO ("Capacitação")
	
	final String value

	GrauEnum(String value){
		this.value = value
	}
	
	@Override
	String toString(){
		value
	}
	
	String getKey() {
		name()
	}
	

}
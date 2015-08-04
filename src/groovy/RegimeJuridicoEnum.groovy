package funcionarios

public enum RegimeJuridicoEnum{
	UNICO('Regime Único'),
	TEMPORARIO('Temporário'),
	SUBSTITUTO('Substituto'),
	SELETISTA('Seletista'),
	TERCEIRIZADO('Terceirizado'),
	String id

	RegimeJuridicoEnum(String id){
		this.id = id
	}
}
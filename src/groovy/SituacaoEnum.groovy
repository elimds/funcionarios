public enum SituacaoEnum {
	ATIVO('Ativo'),
	INATIVO('Inativo'),
	APOSENTADO('Aposentado'),
	LICENCIADO('Licenciado'),
	String id

	SituacaoEnum(String id){
		this.id = id
	}
}
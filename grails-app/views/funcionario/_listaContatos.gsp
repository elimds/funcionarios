<table id="tblDepartamentos">
		<colgroup>
			<col width="30%">
			<col width="30%">
			<col width="15%">
		</colgroup>
	<thead>
		<tr>
			<th>Tipo</th>
			<th>Contato</th>
			<th>Ações</th>
		</tr>
	</thead>
	<tbody>
		<g:if test="${funcionarioInstance?.contatos?.size() >0 }">
			<g:each var="contato" in="${funcionarioInstance?.contatos}">
			<tr>
				<td>${contato?.tipo}</td>
				<td>${contato?.valor}</td>
				<td>
					<nav>
						<g:remoteLink controller="contato" action="editar" id="${contato.id }" 
								update="contatoCreation" >Editar</g:remoteLink>
						<g:remoteLink controller="contato" action="excluir" id="${contato.id }" 
								update="dvMensagem" before="if(!confirm('Você tem certeza que deseja excluir este registro?')) return false" 
								onSuccess="carregarListaContatos()" method="DELETE" >Excluir</g:remoteLink>
					</nav>
				</td>
			</tr>
			</g:each>
		</g:if>
		<g:else>
			<tr><td colspan="4"><p>Nenhum registro na tabela</p></td></tr>
		</g:else>
	</tbody>
</table>

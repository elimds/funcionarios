<div class="top-bar">
	<h3><i class="icon-list"></i> Dependentes</h3>
</div>
<div class="well no-padding">
	<table id="tblDependentes" class="data-table">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Data de Nascimento</th>
				<th>Identidade</th>
				<th>Cpf</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<g:each var="dependente" in="${funcionarioInstance?.dependentes}">
				<tr>
					<td>${dependente?.nome}</td>
					<td><g:formatDate format="dd/MM/yyyy" date="${dependente?.dataNascimento}" /></td>
					<td>${dependente?.identidade}</td>
					<td>${dependente?.cpf}</td>
					<td>
						<nav>
							<g:remoteLink controller="funcionario" action="editarDependente" id="${dependente.id }" 
									update="dependenteCreate" title="Editar"><i class="icon-edit-sign icon-2x icon-black"></i></g:remoteLink>&nbsp;&nbsp;
							<g:remoteLink controller="funcionario" action="excluirDependente" id="${dependente.id }" 
									update="dvMensagemDependente" before="if(!confirm('Você tem certeza que deseja excluir este registro?')) return false" 
									onSuccess="carregarListaDependentes()" method="DELETE" title="Excluir"><i class="icon-remove icon-2x icon-black"></i></g:remoteLink>
						</nav>
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>

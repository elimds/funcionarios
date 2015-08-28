
<%@ page import="funcionarios.Funcionario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="avocado">
		<g:set var="entityName" value="${message(code: 'funcionario.label', default: 'Funcionario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-funcionario" class="content scaffold-list" role="main">
			<div class="row-fluid">
				<div class="span12">
					<g:if test="${flash.message}">
						<div id="dvMensagem" class="message alert" role="status" style="display: block;">${flash.message}</div>
					</g:if>
					<g:if test="${session?.user?.login == "admin" }">
						<div class="link-add">
							<g:link class="create" action="create"><i class="icon-plus"></i>Novo Funcionário</g:link>
						</div>
					</g:if>
					<div class="top-bar">
						<h3><i class="icon-list"></i> Funcionários</h3>
					</div>
					<div class="well no-padding">
						<table class="data-table">
							<thead>
								<tr>
									<th>Matrícula</th>
									<th>Nome</th>
									<th>Cargo</th>
									<th>Departamento</th>
									<th>CPF</th>
									<th>Data de Nascimento</th>
									<th>Ações</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${funcionarioInstanceList}" var="funcionarioInstance">
									<tr>
										<td>${funcionarioInstance?.id}</td>
										<td>${funcionarioInstance?.nome}</td>
										<td>${funcionarioInstance?.cargo.nome}</td>
										<td>${funcionarioInstance?.departamento.nome}</td>
										<td>${funcionarioInstance?.cpf}</td>
										<td><g:formatDate format="dd/MM/yyyy" date="${funcionarioInstance?.dataNascimento}" /></td>
										<td>
											<nav>
												<g:if test="${session?.user?.login == "admin" || funcionarioInstance?.usuario?.id == session?.user?.id }">
													<g:link class="edit" action="edit" id="${funcionarioInstance.id}" resource="${funcionarioInstance}" title="Editar"><i class="icon-edit-sign icon-2x icon-black"></i></g:link>&nbsp;&nbsp;
												</g:if>
												<g:if test="${session?.user?.login == "admin" }">
													<g:link class="delete" action="delete" id="${funcionarioInstance.id}" resource="${funcionarioInstance}" before="if(!confirm('Você tem certeza que deseja excluir este registro?')) return false" title="Excluir"><i class="icon-remove icon-2x icon-black"></i></g:link>
												</g:if>
											</nav>
										</td>
									</tr>
								</g:each>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

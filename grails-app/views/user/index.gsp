
<%@ page import="funcionarios.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="avocado">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-user" class="content scaffold-list" role="main">
			<div class="row-fluid">
				<div class="span12">
					<g:if test="${flash.message}">
						<div id="dvMensagem" class="message alert" role="status" style="display: block;">${flash.message}</div>
					</g:if>
					<div class="top-bar">
						<h3><i class="icon-list"></i> Usuários</h3>
					</div>
					<div class="well no-padding">
						<table class="data-table">
							<thead>
								<tr>
									<th>Usuário</th>
									<th>Nome</th>
									<th>Ações</th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${userInstanceList}" status="i" var="userInstance">
									<tr>
										<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "login")}</g:link></td>
										<td>${fieldValue(bean: userInstance, field: "name")}</td>
										<td>
											<nav>
												<g:if test="${session?.user?.login == "admin" || userInstance?.id == session?.user?.id }">
													<g:link class="edit" action="edit" id="${userInstance.id}" resource="${userInstance}" title="Editar"><i class="icon-edit-sign icon-2x icon-black"></i></g:link>&nbsp;&nbsp;
												</g:if>
												<g:if test="${session?.user?.login == "admin" }">
													<g:link class="delete" action="delete" id="${userInstance.id}" resource="${userInstance}" before="if(!confirm('Você tem certeza que deseja excluir este registro?')) return false" title="Excluir"><i class="icon-remove icon-2x icon-black"></i></g:link>
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

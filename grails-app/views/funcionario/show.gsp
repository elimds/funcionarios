
<%@ page import="funcionarios.Funcionario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="avocado">
		<g:set var="entityName" value="${message(code: 'funcionario.label', default: 'Funcionario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-funcionario" class="content scaffold-show" role="main">
			<div class="row-fluid">
				<div class="span12">
					<g:if test="${flash.message}">
						<div id="dvMensagem" class="message alert" role="status" style="display: block;">${flash.message}</div>
					</g:if>
					<div class="top-bar">
						<h3><i class="icon-user"></i> Funcionário</h3>
					</div>
					<div class="well no-padding">
						<div class="control-group span12 sem-margin-left">
							<label class="control-label">Nome:</label>
							<div class="controls"><g:fieldValue bean="${funcionarioInstance}" field="nome"/></div>
						</div>
						<div class="control-group span12 sem-margin-left">
							<label class="control-label">Cargo:</label>
							<div class="controls"><g:fieldValue bean="${funcionarioInstance}" field="cargo.nome"/></div>
						</div>
						<div class="control-group span12 sem-margin-left">
							<label class="control-label">Departamento:</label>
							<div class="controls"><g:fieldValue bean="${funcionarioInstance}" field="departamento.nome"/></div>
						</div>
					</div>
					<g:form url="[resource:funcionarioInstance, action:'delete']" method="DELETE">
						<div class="form-actions">
							<g:if test="${session?.user?.login == "admin" || funcionarioInstance?.usuario?.id == session?.user?.id }">
								<g:link class="btn btn-primary" action="edit" resource="${funcionarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>&nbsp;&nbsp;
							</g:if>
							<g:if test="${session?.user?.login == "admin" }">
								<g:actionSubmit class="btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
							</g:if>
						
						</div>
					</g:form>

					<div class="top-bar">
						<ul class="tab-container">
						  <li class="active"><a href="#tab1"><i class="icon-phone"></i> Contatos</a></li>
						  <li><a href="#tab2"><i class="icon-group"></i> Dependentes</a></li>
						  <li><a href="#tab3"><i class="icon-certificate"></i> Titulações</a></li>
						  <li><a href="#tab4"><i class="icon-envelope"></i> Endereços</a></li>
						</ul>
					</div>

					<div class="well">
						<div class="tab-content">
						  	<div class="tab-pane active" id="tab1">
						  		<!--  formContato agrupa o código HTML para tratar os contatos do Funcionário  -->
								<div id="formContato">
									<div id="dvMensagem" class="alert"></div>
									<section id="contatoCreate">
										<g:render template="contato" />
									</section>
									<section id="contatoList">
										<g:render template="listaContatos" />
									</section>
								</div>
								<!-- FIM do formContato -->
						  	</div>
						  	<div class="tab-pane" id="tab2">
						  		<!--  formDependente agrupo o código HTML para tratar os dependentes do Funcionário  -->
								<div id="formDependente">
									<div id="dvMensagemDependente" class="alert"></div>
									<section id="dependenteCreate">
										<g:render template="dependente" />
									</section>
									<section id="dependenteList">
										<g:render template="listaDependentes" />
									</section>
								</div>
								<!-- FIM do formDependente -->
						  	</div>
						  	<div class="tab-pane" id="tab3">
						  		<!--  formTitulacao agrupo o código HTML para tratar as titulações do Funcionário  -->
								<div id="formTitulacao">
									<div id="dvMensagemTitulacao" class="alert"></div>
									<section id="titulacaoCreate">
										<g:render template="titulacao" />
									</section>
									<section id="titulacaoList">
										<g:render template="listaTitulacoes" />
									</section>
								</div>
								<!-- FIM do formTitulacao -->
						  	</div>
						  	<div class="tab-pane" id="tab4">
						  		<!--  formEndereco agrupa o código HTML para tratar os endereços do Funcionário  -->
								<div id="formEndereco">
									<div id="dvMensagemEndereco" class="alert"></div>
									<section id="enderecoCreate">
										<g:render template="endereco" />
									</section>
									<section id="enderecoList">
										<g:render template="listaEnderecos" />
									</section>
								</div>
								<!-- FIM do formContato -->
						  	</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</body>
</html>

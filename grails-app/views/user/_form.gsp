<%@ page import="funcionarios.User" %>

<div class="well no-padding">
	<div class="control-group span4 sem-margin-left ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
		<label class="control-label" for="name">Nome:</label>
		<div class="controls">
			<g:textField name="name" required="" value="${userInstance?.name}" class="span12" />
		</div>
	</div>
	<div class="control-group span4 ${hasErrors(bean: userInstance, field: 'login', 'error')} required">
		<label class="control-label" for="login">Login:</label>
		<div class="controls">
			<g:textField name="login" required="" value="${userInstance?.login}" class="span12" />
		</div>
	</div>
	<div class="control-group span4 ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
		<label class="control-label" for="password">Senha:</label>
		<div class="controls">
			<g:field type="password" name="password" required="" value="${userInstance?.password}" class="span12" />
		</div>
	</div>

	<div class="clearfix"></div>
	<div class="form-actions">
		<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
	</div>
</div>

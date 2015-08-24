<html>
  <head>
    <meta name="layout" content="avocadologin" />
    <title>Login</title>
  </head>
  <body>
    <div class="row-fluid">
        <div class="span12">
            <g:if test="${flash.message}">
                <div class="alert">${flash.message}</div>
            </g:if>
            <div class="span8 sem-margin-left">
                <div class="top-bar">
                    <ul class="tab-container">
                      <li class="active"><a href="#tab1"><i class="icon-question-sign"></i> O que é?</a></li>
                      <li><a href="#tab2"><i class="icon-group"></i> Quem somos</a></li>
                    </ul>
                </div>

                <div class="well">
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab1">
                            <div class="span5 sem-margin-left">
                                <img src="${request.contextPath}/avocado/img/logo_censo_transparente.png" alt="">
                            </div>
                            <div class="span7"><p>Sistema para a realização do Censo Funcional.</p></div>
                        </div>
                        <div class="tab-pane" id="tab2">
                            <p align="justify">Este é um Projeto desenvolvido para a disciplina de Tecnologias de Programação para a Internet Ministrada pelo Prof. Leopoldo Teixeira.</p>
                            <p>Produzido por: </p>
                            <ul>
                                <li>Anderson Maia de Albuquerque</li>
                                <li>Carine Calixto Aguena</li>
                                <li>Eli Medeiros Sousa</li>
                                <li>Karina Moreira Azevedo</li>
                                <li>Paulo Roberto de Souza Mesquita Jr</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="span4">
                <div class="top-bar">
                    <h3><i class="icon-signin"></i> Efetuar Login</h3>
                </div>
                <div class="well no-padding">
                    <g:form action="authenticate" method="post" class="form-horizontal">
                        <div class="control-group span12 sem-margin-left">
                            <label class="control-label" for="login">Usuário:</label>
                            <div class="controls">
                                <input type="text" id="login" name="login" class="span12" />
                            </div>
                        </div>
                        <div class="control-group span12 sem-margin-left">
                            <label class="control-label" for="password">Senha:</label>
                            <div class="controls">
                                <input type="password" id="password" name="password" class="span12" />
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="form-actions">
                            <input type="submit" value="Enviar" class="btn btn-primary" />
                        </div>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</html>
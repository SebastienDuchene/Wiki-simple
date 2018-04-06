<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Wiki</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-" crossorigin="anonymous">
        <link rel="stylesheet" href="${resource(dir:'stylesheets',file:'side-menu.css')}">
    </head>

    <body>

    <div id="menu">
        <div class="pure-menu">
            <ul class="pure-menu-list">
                <li class="pure-menu-item menu-item-divided pure-menu-selected"><g:link controller="wiki" class="pure-menu-link" action="index"><g:message code="default.Menu" /></g:link></li>
            </ul>
        </div>
    </div>

        <div id="create-page" class="content scaffold-create" role="main">
            <h1><g:message code="default.createPage.label"/></h1>

            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:hasErrors bean="${this.page}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.page}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>

            <g:form action="savePage" method="POST">
                <fieldset class="form">
                    <input name="title" placeholder="Title" required="" id="title" type="text">
                    <g:textArea  name="content" placeholder ="Content" value="${page?.content}" required="" rows="15" cols="100"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="savePage" placeholder="Content" action="savePage" value="Create Page" ></g:submitButton>
                </fieldset>
            </g:form>

        </div>
    </body>
</html>

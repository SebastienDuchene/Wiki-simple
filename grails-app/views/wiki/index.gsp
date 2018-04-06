<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Simple Wiki</title>

    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css" integrity="sha384-" crossorigin="anonymous">
    <link rel="stylesheet" href="${resource(dir:'stylesheets',file:'side-menu.css')}">

</head>

<body>
<div id="layout">
    <!-- Menu toggle -->
    <a href="#menu" id="menuLink" class="menu-link">
        <!-- Hamburger icon -->
        <span></span>
    </a>

    <div id="menu">
        <div class="pure-menu">
            <ul class="pure-menu-list">
                <li class="pure-menu-item menu-item-divided pure-menu-selected"><g:link controller="wiki" class="pure-menu-link" action="createPage"><g:message code="default.createPage.label" /></g:link></li>
                <g:if test="${article?.id}">
                    <li class="pure-menu-item menu-item-divided pure-menu-selected"><g:link controller="wiki" class="pure-menu-link" action="editPage" params="[id: article?.id]"><g:message code="default.editPage" /></g:link></li>
                    <li class="menu-item-divided pure-menu-selected"><g:link controller="wiki" class="pure-menu-link" action="deletePage" params="[id: article?.id]"><g:message code="default.deletePage.label" /></g:link></li>
                </g:if>

                <li> <h1>Articles</h1></li>
                <g:each in="${pages}">
                    <li><a href="${createLink(action:"article", id:"${it.id}")}"> ${it.title} </a> </li>
                </g:each>
            </ul>
        </div>
    </div>




    <div id="main">
        <div class="header">
                    <img class="pure-img-responsive" src="https://gladys.com/attachment/get/0146d255d5b1457516c89a37b51762e3"  align="center">
                    <h2>Simply the best</h2>
        </div>
        <div class="content">
            <h1 class="content-subhead" style="text-align: center">${article?.title}</h1>
            <p>
            ${article?.content}
            </p>
        </div>
    </div>
</div>


</body>
</html>

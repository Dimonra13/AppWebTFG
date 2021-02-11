<%--
  Created by IntelliJ IDEA.
  User: dimonra13
  Date: 11/2/21
  Time: 14:44
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Provisional</title>
</head>

<body>
    <p>${courseList.name}</p>
    <g:if test="${user}">
        <p>Usuario logueado</p>
    </g:if>
    <g:else>
        <p>Usuario no logueado</p>
    </g:else>
</body>
</html>
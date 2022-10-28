<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="WEB-INF/jspf/conectbs.jspf" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="Description" content="Enter your description here" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>

    <c:if test="${param.user != null}">
        <sql:query var="result" dataSource="${parcial}">
            SELECT * from usuarios WHERE user = '${param.user}' and pass = ${param.pass} and rol = '${param.rol}' 
        </sql:query>
        <c:set var="login" value="${result.rowCount}"/>
        <c:if test="${login == 1}">
        <c:set var = "roles" value = "${param.rol}"/>
        <c:forEach var="fila" items="${result.rows}">
        <c:choose> 
            <c:when test = "${roles == 'Administrador'}">
                <script type="text/javascript">
                    window.location.href = "administrador/admin.jsp?id=${fila.id}";
                </script>
            </c:when>
            <c:when test = "${roles == 'Coordinador'}">
                <script type="text/javascript">
                    window.location.href = "coordinador/coordinador.jsp?id=${fila.id}";
                </script>
            </c:when>
            <c:when test = "${roles == 'Docente'}">
                <script type="text/javascript">
                    window.location.href = "docentes/index_doc.jsp?id=${fila.id}";
                </script>
            </c:when>
            <c:when test = "${roles == 'Estudiante'}">
                <script type="text/javascript">
                    window.location.href = "estudiantes/estudiante.jsp?id=${fila.id}";
                </script>
            </c:when>
        </c:choose>
        </c:forEach>
        </c:if>
        <c:if test="${login == 0}">
        <script>
		    window.alert("Error");
		    window.location.href = "index.html";
	    </script>
        </c:if>
    </c:if>
    
</body>
</html>
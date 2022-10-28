<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="../../WEB-INF/jspf/conectbs.jspf" %>
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
    <title>Sistema Universitario</title>
</head>

<body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
    <c:if test="${param.id != null}">
        <sql:query var="rsCategoria" dataSource="${parcial}">
            Select * from estudiantes where id_user = '${param.id}'           
        </sql:query>
        <c:forEach var="categoria" items="${rsCategoria.rows}">
            <sql:update var="result2" dataSource="${parcial}">
            delete from proyectos
            where id_est = ${categoria.id}
        </sql:update>
        </c:forEach>
        <c:if test="${result2 == 1}">
        <script>
		    window.alert("Anteproyecto eliminado correctamente");
		    window.location.href = "../estudiante.jsp?id=${param.id}";
	    </script>
        </c:if>
        <c:if test="${result2 == 0}">
        <script>
		    window.alert("Error");
	    </script>
        </c:if>
    </c:if>
    
</body>
</html>
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
    <link rel="stylesheet" href="../../css/pag.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <title>Sistema Universitario</title>
</head>

<body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
    <h1 class="mt-5"><center>Sistema Universitario</center></h1>
    <h2><center>Agregar Estudiante</center></h2>
    <c:if test="${param.nombre == null}">
    <div class="container-xl">
		<form method="post">
			<div class="form-group">
				<label for="user"><strong>Usuario: </strong></label>
				<input type="text" class="form-control" name="user" required>
			</div>
			<div class="form-group">
				<label for="pass"><strong>Clave:</strong> </label>
				<input type="text" class="form-control" name="pass" required>
			</div>
        <br>
        <button type="submit" class="btn btn-primary">Registrar</button>
        </form>
    <sql:query var="rsCategoria" dataSource="${parcial}">
        Select * from usuarios           
    </sql:query>
    <c:forEach var="categoria" items="${rsCategoria.rows}">
        <c:if test="${param.user == categoria.user}">
           <c:redirect url="agregar_usu.jsp"/>
        </c:if>
    </c:forEach>                      
    </c:if>
    </div>
    <c:if test="${param.user != null}">
    <sql:update var="result" dataSource="${parcial}">
        INSERT INTO
        usuarios (user,pass,rol)
        values ('${param.user}',
        ${param.pass},
        'Estudiante')
    </sql:update>
    <c:if test="${result == 1}">
        <script>
	        window.location.href = "agregar_est.jsp?user=${param.user}";
        </script>
    </c:if>
    </c:if> 
</body>
</html>
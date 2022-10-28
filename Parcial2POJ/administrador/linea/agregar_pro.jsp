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
    <h1 class="mt-5">
        <center>Sistema Universitario</center>
    </h1>
    <h2>
        <center>Agregar Proyecto</center>
    </h2>               
    <c:if test="${param.nombre == null}">
    <div class="container-xl">
    	<form class="bg-white formulario border border-primary border-4 shadow-lg p-5 mb-5 rounded" method="post">
            <div class="form-group">
			    <input type="hidden" name="id" value="${fila.id}" required>
			</div>
            <div class="form-group">
			    <label for="nombre" class="form-label">Linea de Investigacion: </label>
			    <input type="text" class="form-control" name="nombre" value="${fila.nombre}" required>
			</div>
            <div class="form-group">
			    <label for="area" class="form-label">Area de desarrollo: </label>
			    <input type="text" class="form-control" name="area" value="${fila.area}" required>
			</div>
        <br>
        <button type="submit" class="btn btn-primary">Insertar</button>
        </form>
    </c:if>
    </div>
    <c:if test="${param.nombre != null}">
        <sql:update var="result" dataSource="${parcial}">
            INSERT INTO
            linea_investigacion (nombre,area)
            values ('${param.nombre}',
            '${param.area}'
        )
        </sql:update>
        <c:if test="${result == 1}">
            <script>
            	window.alert("Informacion registrada correctamente");
		        window.location.href = "index_pro.jsp";
	        </script>
        </c:if>
    </c:if>
</body>
</html>
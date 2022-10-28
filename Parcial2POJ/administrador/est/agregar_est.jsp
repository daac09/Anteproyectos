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
    <sql:query var="rsCategoria" dataSource="${parcial}">
        Select * from usuarios where user = '${param.user}'           
    </sql:query>
    <c:forEach var="categoria" items="${rsCategoria.rows}">                        
    <c:if test="${param.nombre == null}">
    <div class="container-xl">
    	<form class="bg-white formulario border border-primary border-4 shadow-lg p-5 mb-5 rounded" method="post">
            <div class="form-group">
			    <label for="id_user" class="form-label">ID de Usuario: </label>
			    <input type="text" class="form-control" name="id_user" readonly=»readonly» value="${categoria.id}" required>
			</div>
            <hr>
            <div class="form-group">
			    <input type="hidden" name="id" value="${fila.id}" required>
			</div>
            <div class="form-group">
			    <label for="cedula" class="form-label">Cedula: </label>
			    <input type="text" class="form-control" name="cedula" value="${fila.cedula}" required>
			</div>
            <div class="form-group">
			    <label for="nombre" class="form-label">Nombre Completo: </label>
			    <input type="text" class="form-control" name="nombre" value="${fila.nombre}" required>
			</div>
            <div class="form-group">
			    <label for="prog" class="form-label">Programa: </label>
			    <input type="text" class="form-control" name="prog" value="${fila.programa}" required>
			</div>
            <div class="form-group">
			    <label for="sem" class="form-label">Semestre: </label>
			    <input type="text" class="form-control" name="sem" value="${fila.semestre}" required>
			</div>
            <div class="form-group">
			    <label for="fecha_nac" class="form-label">Fecha de nacimiento: </label>
			    <input type="date" max="2001-12-30" class="form-control" name="fecha_nac" value="${fila.fecha_nac}" required>
			</div>
        <br>
        <button type="submit" class="btn btn-primary">Insertar</button>
        </form>
    </c:if>
    </c:forEach>
    </div>
    <c:if test="${param.nombre != null}">
        <sql:update var="result" dataSource="${parcial}">
            INSERT INTO
            estudiantes (cedula,nombre,programa,semestre,fecha_nac,id_user)
            values ('${param.cedula}',
            '${param.nombre}',
            '${param.prog}',
            ${param.sem},
            '${param.fecha_nac}',
            ${param.id_user})
        </sql:update>
        <c:if test="${result == 1}">
            <script>
            	window.alert("Informacion registrada correctamente");
		        window.location.href = "index_est.jsp";
	        </script>
        </c:if>
    </c:if>
</body>
</html>
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
    <title>Actualizar Anteproyecto</title>
    
</head>

<body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
    <h1><center>Sistema Universitario</center></h1>
    <c:if test="${param.modifica == null}">
        <sql:query var="estudiantes" dataSource="${parcial}">
        Select * from proyectos where id_pro = ${param.id}
        </sql:query>
    <div class="container">
    <c:forEach var="fila" items="${estudiantes.rows}">
    	<form class="bg-white formulario border border-primary border-4 shadow-lg p-5 mb-5 rounded" method="post">
            <div class="form-group">
			    <input type="hidden" name="id" value="${fila.id_pro}" required>
			</div>
            <div class="form-group">
			    <input type="hidden" class="form-control" name="id_pro" value="${fila.id_pro}" required>
			</div>
            <div class="form-group">
			    <label for="titulo" class="form-label">Titulo de Anteproyecto: </label>
			    <input type="text" class="form-control" name="titulo" value="${fila.titulo}" readonly>
			</div>
            <div class="form-group">
			    <label for="facul" class="form-label">Facultad: </label>
			    <input type="text" class="form-control" name="facul" value="${fila.facul}" readonly>
			</div>
            <sql:query var="rsCategoria" dataSource="${parcial}">
                Select * from linea_investigacion WHERE id = ${fila.linea_invg}
            </sql:query> 
            <c:forEach var="item" items="${rsCategoria.rows}">
            <div class="form-group">
			    <label for="facul" class="form-label">Linea de Investigacion: </label>
			    <input type="text" class="form-control" name="facul" value="${item.nombre}" readonly>
			</div> 
            </c:forEach>
            <div class="form-group">
			    <label for="area" class="form-label">Programa: </label>
			    <input type="text" class="form-control" name="area" value="${fila.prog}" readonly>
			</div>
			<label for="fmt" class="form-label">Formato F-DC-124: </label>
            <div class="custom-file mb-3">
                <input type="file" class="custom-file-input" name="fmt" lang="es">
                <label class="custom-file-label" for="fmt">Seleccione el archivo</label>
            </div> 
            <div class="form-group">
			    <label for="url_fmt" class="form-label">Ubicacion del Formato en la nube: </label>
			    <input type="url" class="form-control" name="url_fmt" value="${fila.url_fmt}">
			</div> 
        <br>
        <sql:query var="est" dataSource="${parcial}">
        Select * from estudiantes where id = ${fila.id_est}
        </sql:query>
        <c:forEach var="item2" items="${est.rows}">
        <button type="button" class="btn btn-dark" onclick="window.location.href='../estudiante.jsp?id=${item2.id_user}'">Volver</button>
        <input type="hidden" name="id_user" value="${item2.id_user}"/>
        <button type="button" class="btn btn-danger" onclick="window.location.href='eliminar_pro.jsp?id=${item2.id_user}'">Eliminar</button>
        </c:forEach>
        <input type="hidden" name="modifica" value="SI"/>
        <button type="submit" class="btn btn-primary">Actualizar</button> 
        </form>
    </c:forEach>
    </c:if>
    <c:if test="${param.modifica != null}">
        <sql:update var="result" dataSource="${parcial}">
        update proyectos
        set url_fmt = '${param.url_fmt}',
        estado = 'Actualizado'
        where id_pro = ${param.id_pro}
        </sql:update>
        <c:if test="${result == 1}">
        <script>
		    window.alert("Informacion actualizada correctamente");
		    window.location.href = "../estudiante.jsp?id=${param.id_user}";
	    </script>
        </c:if>
    </c:if>
</body>
</html>
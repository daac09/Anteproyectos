<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="../../WEB-INF/jspf/conectbs.jspf" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="Description" content="Enter your description here" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="../../css/pag.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <title>Registrar Anteproyecto</title>
</head>

<body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
     <header class="p-3 bg-dark text-white">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <div class="text-end">
                        <img src="../../img/Logo-UTS-1 (1).png" alt="..." class="img-thumbnail">
                    </div>
                </div>
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-center">
                    <div class="text-end">
                        <center>Enviar Anteproyecto</center>
                    </div>
                </div>
            </div>
        </header>
    <h2>
    </h2> 
    <sql:query var="Estudiante" dataSource="${parcial}">
        Select * from estudiantes where id_user = ${param.id}           
    </sql:query> 
    <c:forEach var="fila2" items="${Estudiante.rows}">             
    <sql:query var="proyec" dataSource="${parcial}">
        Select * from proyectos where id_est = ${fila2.id}           
    </sql:query>
    <c:forEach var="fila3" items="${proyec.rows}">
        <c:if test="${fila3.id_pro != null}">
            <script>
		        window.alert("Ya existe un anteproyecto");
		        window.location.href = "actualizar_pro.jsp?id=${fila3.id_pro}";
	        </script>
        </c:if>
    </c:forEach>
    <c:if test="${param.titulo == null}">
    <div class="container-xl">
    	<form class="bg-white formulario border border-primary border-4 shadow-lg p-5 mb-5 rounded" method="post">
            <div class="form-group">
			    <input type="hidden" name="id" value="${fila.id}" required>
			</div>
            <div class="form-group">
			    <input type="hidden" class="form-control" name="id_est" value="${fila2.id}" required>
			</div>
            <div class="form-group">
			    <label for="titulo" class="form-label">Titulo de Anteproyecto: </label>
			    <input type="text" class="form-control" name="titulo" value="${fila.titulo}" required>
			</div>
            <div class="form-group">
			    <label for="facul" class="form-label">Facultad: </label>
            <select class="form-control" name="facul">
                <option value="0">--Seleccione--</option>
                <option value="FCNI">FCNI</option>
                <option value="FCSE">FCSE</option>
            </select>  
			</div>
            <sql:query var="rsLineas" dataSource="${parcial}">
                Select * from linea_investigacion where area = '${fila2.programa}'           
            </sql:query>
            <label for="linea_invg" class="form-label">Linea de Investigacion: </label>
            <select class="form-control" name="linea_invg">
                <option value="0">--Seleccione--</option>
                <c:forEach var="item" items="${rsLineas.rows}">
                    <option value="${item.id}">
                        <c:out value="${item.nombre}" />
                    </option>
                </c:forEach>
            </select>  
            <div class="form-group">
			    <label for="area" class="form-label">Programa: </label>
			    <input type="text" class="form-control" name="area" value="${fila2.programa}" readonly>
			</div>
			<label for="fmt" class="form-label">Formato F-DC-124: </label>
            <div class="custom-file mb-3">
                <input type="file" class="custom-file-input" name="fmt" lang="es">
                <label class="custom-file-label" for="fmt">Seleccione el archivo</label>
            </div> 
            <div class="form-group">
			    <label for="url_fmt" class="form-label">Ubicacion del Formato en la Nube: </label>
			    <input type="url" class="form-control" name="url_fmt" value="${fila2.url_fmt}">
			</div> 
        <br>
        <button type="submit" class="btn btn-primary">Insertar</button>
        <button type="button" class="btn btn-dark" onclick="window.location.href='../estudiante.jsp?id=${fila2.id_user}'">Volver</button>
        </form>
    </c:if>
    </div>
    </c:forEach>
    <c:if test="${param.titulo != null}">
        <sql:update var="result" dataSource="${parcial}">
            INSERT INTO
            proyectos (titulo,linea_invg,facul,prog,fmt,id_est,url_fmt,estado)
            values ('${param.titulo}',
            '${param.linea_invg}',
            '${param.facul}',
            '${param.area}',
            '${param.fmt}',
            ${param.id_est},
            '${param.url_fmt}',
            'Enviado'
        )
        </sql:update>
        <c:if test="${result == 1}">
            <script>
            	window.alert("Proyecto enviado correctamente");
		        window.location.href = "../estudiante.jsp?id=${param.id}";
	        </script>
        </c:if>
    </c:if>
</body>
</html>
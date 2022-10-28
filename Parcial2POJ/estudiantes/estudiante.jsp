<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="../WEB-INF/jspf/conectbs.jspf" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="Description" content="Enter your description here" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="../css/pag.css">
    <title>Estudiante</title>
</head>

<body >

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
    <header>
        <!-- Intro settings -->
        <style>
            /* Default height for small devices */
            #intro-example {
                height: 400px;
            }

            /* Height for devices larger than 992px */
            @media (min-width: 992px) {
                #intro-example {
                    height: 600px;
                }
            }
        </style>

        <!-- Navbar -->
        <header class="p-3 bg-dark text-white">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-end">
                    <div class="text-end">
                        <a href="../index.html"><button type="button" class="btn btn-danger">Cerrar Sesion</button></a>
                    </div>
                </div>
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <div class="text-end">
                        <img src="../img/Logo-UTS-1 (1).png" alt="..." class="img-thumbnail">
                    </div>
                </div>
            </div>
        </header>
        <!-- Navbar -->
        <sql:query var="result" scope="request" dataSource="${parcial}">
        Select * from estudiantes WHERE id_user = ${param.id}
        </sql:query>    
        <c:forEach var="fila" items="${result.rows}">
        <!-- Background image -->
        <div id="intro-example" class="p-5 text-center bg-image">
            <div class="mask" style="background-color: rgba(0, 0, 0, 0.7);">
                <div class="d-flex justify-content-center align-items-center h-100">
                    <div class="text-white">
                        <h1>Unidades Tecnologicas de Santander</h1>
                        <h1 class="mb-3">Anteproyectos de grado</h1>
                        <h5 class="mb-4">Estudiante: <c:out value = "${fila.nombre}" /></h5>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="btn-group btn-group-justified mt-5">
                    <a href="proyec/index_pro.jsp?id=${param.id}" class="btn btn-primary btn-lg">Ver Calificacion</a>
                    <a href="proyec/agregar_pro.jsp?id=${param.id}" class="btn btn-primary btn-lg">Enviar Anteproyecto</a>
                </div>
            </div>
            </c:forEach> 
            <div class="container">
                <div class="btn-group btn-group-justified mt-5">
                <sql:query var="result2" dataSource="${parcial}">
                Select * from calendario
                </sql:query>
                <c:forEach var="fila2" items="${result2.rows}">
                <a class="btn btn-primary btn-lg" href="${fila2.archivo}" target="_blank" role="button">Calendario Academico</a>
                <a class="btn btn-primary btn-lg" href="${fila2.fmt}" target="_blank" role="button">Formatos de trabajo</a>
                </c:forEach>
                </div>
            </div>
        </div>
        
        
        <!-- Background image -->
    </header>
    


</body>

</html>
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
    <link rel="stylesheet" href="../css/pag.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <title>Sistema Universitario</title>
</head>
<body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
    <header>               
        <header class="p-3 bg-dark text-white">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <div class="text-end">
                        <img src="../img/Logo-UTS-1 (1).png" alt="..." class="img-thumbnail">
                    </div>
                </div>
            </div>
                    </header>
                    <!-- Background image -->
                    <div id="intro-example" class="p-5 text-center bg-image">
                        <div class="mask" style="background-color: rgba(0, 0, 0, 0.7);">
                            <div class="d-flex justify-content-center align-items-center h-100">
                                <div class="text-white">
                                    <h1>Unidades Tecnologicas de Santander</h1>
                                    <h1 class="mb-3">Control de Anteproyectos de grado</h1>
                                    <h5 class="mb-4">Formatos</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
                <c:if test="${param.link == null}">
                    <div class="container-xl">
                        <form class="bg-white formulario border border-primary border-4 shadow-lg p-5 mb-5 rounded"
                            method="post">
                            <div class="form-group">
                                <label for="link" class="form-label">Url de los formatos academicos: </label>
                                <input type="url" class="form-control" name="link" value="${fila.link}" required>
                            </div>
                            <br>
                            <button type="submit" class="btn btn-primary">Actualizar</button>
                            <sql:query var="result2" dataSource="${parcial}">
                                Select * from calendario
                            </sql:query>
                            <c:forEach var="fila2" items="${result2.rows}">
                                <a class="btn btn-primary" href="${fila2.fmt}" target="_blank" role="button">Ver</a>
                            </c:forEach>
                            <button type="button" class="btn btn-dark"
                                onclick="window.location.href='../administrador/admin.jsp'">Volver</button>
                        </form>
                </c:if>
                </div>
                <c:if test="${param.link != null}">
                    <sql:update var="result" dataSource="${parcial}">
                        UPDATE calendario SET fmt='${param.link}';
                    </sql:update>
                    <c:if test="${result == 1}">
                        <script>
                            window.alert("URL asignada correctamente");
                            window.location.href = "formatos.jsp";
                        </script>
                    </c:if>
                </c:if>
</body>
</html>
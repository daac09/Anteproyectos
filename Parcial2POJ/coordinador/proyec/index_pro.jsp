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
    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="../../css/pag.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <title>Proyectos</title>

</head>
        
    <body>

                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
                <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
                <header>

                    <header class="p-3 bg-dark text-white">
                        <div class="container">
                            <div
                                class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                                <div class="text-end">
                                    <img src="../../img/Logo-UTS-1 (1).png" alt="..." class="img-thumbnail">
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
                                    <h5 class="mb-4">Listado de Proyectos</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>
                
                <sql:query var="result" scope="request" dataSource="${parcial}">
                    Select * from proyectos
                </sql:query>
                <div class="container">
                <div class="mask container" style="background-color: rgba(0, 0, 0, 0.7);">
                    <div class="d-flex justify-content-center align-items-center h-100">
                        <div class="text-white">
                            <h1>No aprobados</h1>
                        </div>
                    </div>
                </div>
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Linea de Investigacion</th>
                                <th>Facultad</th>
                                <th>Programa</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="fila" items="${result.rows}">
                                <c:if test="${fila.apro == null}">
                                    <tr>
                                        <td>
                                            <c:out value="${fila.id_pro}" />
                                        </td>
                                        <td>
                                            <c:out value="${fila.titulo}" />
                                        </td>
                                        <td>
                                            <sql:query var="rsCategoria" dataSource="${parcial}">
                                                Select * from linea_investigacion WHERE id = ${fila.linea_invg}
                                            </sql:query> 
                                            <c:forEach var="item" items="${rsCategoria.rows}">
                                                <c:out value="${item.nombre}" />
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:out value="${fila.facul}" />
                                        </td>
                                        <td>
                                            <c:out value="${fila.prog}" />
                                        </td>
                                        <td>
                                            <a href="aprob_pro.jsp?id=${fila.id_pro}" class="edit" title="Editar"
                                                data-toggle="tooltip"><i class="material-icons">check</i></a>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="mask" style="background-color: rgba(0, 0, 0, 0.7);">
                    <div class="d-flex justify-content-center align-items-center h-100">
                        <div class="text-white">
                            <h1>Aprobados</h1>
                        </div>
                    </div>
                </div>
                    <table class="table table-dark">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Linea de Investigacion</th>
                                <th>Facultad</th>
                                <th>Programa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="fila" items="${result.rows}">
                                <c:if test="${fila.apro != null}">
                                    <tr>
                                        <td>
                                            <c:out value="${fila.id_pro}" />
                                        </td>
                                        <td>
                                            <c:out value="${fila.titulo}" />
                                        </td>
                                        <td>
                                           <sql:query var="rsCategoria" dataSource="${parcial}">
                                                Select * from linea_investigacion WHERE id = ${fila.linea_invg}
                                            </sql:query> 
                                            <c:forEach var="item" items="${rsCategoria.rows}">
                                                <c:out value="${item.nombre}" />
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:out value="${fila.facul}" />
                                        </td>
                                        <td>
                                            <c:out value="${fila.prog}" />
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                    <br>
                    <button type="button" class="btn btn-dark"
                        onclick="window.location.href='../coordinador.jsp?id=${param.id}'">Volver</button>
                </div>
    </body>
</html>
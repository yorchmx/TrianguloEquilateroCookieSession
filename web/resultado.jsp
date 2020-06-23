<%-- 
    Document   : resultado
    Created on : 22-jun-2020, 0:29:40
    Author     : Memo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.Triangulo" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Resultado calculado</title>
        <%
            String area = request.getAttribute("area").toString();
            String perimetro = request.getAttribute("perimetro").toString();
        %>
    </head>
    <body>
        <h1>Resultado</h1>
        <form method="post" name="formulario" onsubmit="return validar();" action="index.jsp">
            <table border="0">
                <tbody>
                    <tr>
                        <td>El Área es de: </td>
                        <td> <%= area %> </td>
                    </tr>
                    <tr>
                        <td>El Perimetro es de: </td>
                        <td> <%= perimetro %> </td>
                    </tr>
                    <tr>
                        <td> </td>
                        <td><input type="submit" value="Regresar" name="btnRegresar" /> </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>

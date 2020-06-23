<%-- 
    Document   : index
    Created on : 22-jun-2020, 0:29:03
    Author     : Memo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ejercicio 3</title>
    </head>
    <body>
        <h1>Calcular el área y perimetro de un triangulo equilatero</h1>
        <%!
            boolean pedirNombre = false;
            boolean hayCookie = false;
        %>
        <%
            /*Se valida si hay valores en la sesion*/
            HttpSession sesion = request.getSession(false);
            Enumeration e=sesion.getAttributeNames();
            if(e.hasMoreElements()){
                pedirNombre=false;
            }
            else{
                pedirNombre=true;
            }
            /*Validamos si hay cookies*/
            Cookie k[]=request.getCookies();
            if(k!=null){
                hayCookie = true;
            }
            else{
                hayCookie = false;
            }
        %>
        <form method="post" name="formulario" onsubmit="return validar();" action="modeloTriangulo">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Nombre: </td>
                        <td>
                            <%if(pedirNombre==true){%>
                                <input type="text" id="txtNombre" name="txtNombre" placeholder="Ingresa tu nombre" />
                            <%}
                            else{
                                out.print("Hola! " + session.getAttribute("nombre").toString());
                            }
                            %>
                        </td>
                    </tr>
                    <%
                    if(hayCookie){
                        for(int i=0;i<k.length;i++){
                    %>
                    <%if(k[i].getName().equals("base")){%>
                    <tr>
                        <td>
                            La Base anterior fue:
                        </td>
                        <td>
                            <% out.print(k[i].getValue()); %>
                        </td>
                    </tr>
                    <%}%>
                    <%if(k[i].getName().equals("altura")){%>
                    <tr>
                        <td>
                            La Altura anterior fue:
                        </td>
                        <td>
                            <% out.print(k[i].getValue()); %>
                        </td>
                    </tr>
                    <%}%>
                    <%if(k[i].getName().equals("area")){%>
                    <tr>
                        <td>
                            El Área anterior fue:
                        </td>
                        <td>
                            <% out.print(k[i].getValue()); %>
                        </td>
                    </tr>
                    <%}%>
                    <%if(k[i].getName().equals("perimetro")){%>
                    <tr>
                        <td>
                            El Perimetro anterior fue:
                        </td>
                        <td>
                            <% out.print(k[i].getValue()); %>
                        </td>
                    </tr>
                    <%}%>
            <%  }
            }
            %>
            <tr>
                <td>Altura: </td>
                <td> <input type="text" id="txtAltura" name="txtAltura" placeholder="Ingresa la altura" /></td>
            </tr>
            <tr>
                <td>Base: </td>
                <td> <input type="text" id="txtBase" name="txtBase" placeholder="Ingresa la base" /></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Calcular" name="btnEnviar" /></td>
            </tr>
        </tbody>
    </table>
    </form>
            <script type="text/javascript">
                function validar(){
                    var altura = document.getElementById("txtAltura").value;
                    var base = document.getElementById("txtBase").value;
                    
                    if(altura === "" || base === ""){
                        alert("Los campos altura y base son requeridos");
                        return false;
                    }
                    else if(isNaN(altura)){
                        alert("La altura ingresada no es número");
                        return false;
                    }
                    else if(isNaN(base)){
                        alert("La base ingresada no es número");
                    }
                    else{
                        return true;
                    }
                }
            </script>
    </body>
</html>

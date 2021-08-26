<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <title>View</title>
    </head>
    <body>
        <table>
            <tbody>
                <c:forEach items="${coffees}" var="cf">
                    <tr>
                        <td>${cf.deQ()}</td>
                        <td>${cf.deT()}</td>
                        <td>${cf.deD()}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>

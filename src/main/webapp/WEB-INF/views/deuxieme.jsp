<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

    <head>
        <title>View</title>
    </head>
    <body>
        <table>
            <tbody>
<tr>
                <c:forEach items="${poster}" var="peinture">
                    
                        <td>${peinture.key}</td>
<c:forEach items="${peinture.value}" var = "pv">
                        <td>${pv.getName()}</td>
                        <td>${pv.getPoster()}</td>
</c:forEach>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>

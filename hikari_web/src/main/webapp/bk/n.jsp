<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<body>
 //  <form:form action="${pageContext.request.contextPath}/findProcess" modelAttribute="userPlus" method='post'>
<table>
                        <tr>
                                <td><form:label path="name">name</form:label></td>
                                <td><form:input path="name" /></td>
                        </tr>
                        <tr>
                                <td><form:label path="email">email</form:label></td>
                                <td><form:input path="email" /></td>
                        </tr>
            <tr>
                <td><input type="submit" value="Submit" /></td>
            </tr>
        </table>
//</form:form>
</body>

</html>
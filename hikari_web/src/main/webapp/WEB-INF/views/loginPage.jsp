<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<body>
   <form:form action="${pageContext.request.contextPath}/loginAuth" modelAttribute="userBasic" method='post'>
<table>
                        <tr>
                                <td><form:label path="nick">nick</form:label></td>
                                <td><form:input path="nick" /></td>
                        </tr>

			<tr>
				<td><form:label path="passWd">passWd</form:label></td>
				<td><form:input path="passWd" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit" /></td>
			</tr>
		</table>
</form:form>
<table><a href ="${pageContext.request.contextPath}/signup">signUp <a></table>
<table><a href ="${pageContext.request.contextPath}/trouver">find<a></table>
</body>

</html>




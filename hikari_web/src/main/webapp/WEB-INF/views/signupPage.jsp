<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<body>
   <form:form action="${pageContext.request.contextPath}/entryProcess" modelAttribute="userPrelude" method='post'>
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
                                <td><form:label path="pwVrf">pwVrf</form:label></td>
                                <td><form:input path="pwVrf" /></td>
                        </tr>
                        <tr>
                                <td><form:label path="name">name</form:label></td>
                                <td><form:input path="name" /></td>
                        </tr>
                        <tr>
                                <td><form:label path="pref">pref</form:label></td>
                                <td><form:input path="pref" /></td>
                        </tr>
<td>@</td>
 <tr>
                                <td><form:label path="suf">suf</form:label></td>
                                <td><form:input path="suf" /></td>
                        </tr>
			<tr>
				<td><input type="submit" value="Submit" /></td>
			</tr>
		</table>
</form:form>
</body>

</html>




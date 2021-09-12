<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<body>

<table>
<c:set value = "${pageContext.request.contextPath}/sixieme_?want=${movieInfo.getId().substring(1, 10)}" var = "href"/>
<a href = ${href} >
<image src = ${movieInfo.getPoster()} alt = "image" sizes="(min-width: 600px) 200px, 50vw">
</a>
<tr>${movieInfo.getName()}</tr>
<tr>${movieInfo.getRating()}</tr>
<tr>${movieInfo.getYear()}</tr>
<tr>${movieInfo.getReleased()}</tr>
<tr>${movieInfo.getRuntime()}</tr>
<tr>${movieInfo.getPlot()}</tr>
<tr>${movieInfo.getCountry()}</tr>
<tr>Actors:
<c:forEach items = "${aC}" var = "ac"><td>${ac.getValue()}</td>
</c:forEach>
</tr>
<tr>Directors:
<c:forEach items = "${dC}" var = "dc"><td> ${dc.getValue()}</td></c:forEach>
</tr>
<tr>Genre:
<c:forEach items = "${gC}" var = "gc"><td>${gc.getValue()}</td></c:forEach>
</tr>
</table>
</body>
<tbody>

<c:set value = "${pageContext.request.contextPath}/huitieme_?title=${want}&bool=${ouNon}&user=${userId}" var = "likeref"/>  
<form action = ${likeref} method = "post"  >
<input type="submit" id="myButton" value = "${lon}">
</form>

<p1><a href = "${pageContext.request.contextPath}/deuxieme_?req=${userId}">return to search</a></p1>
</tbody>

</html>

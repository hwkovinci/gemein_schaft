<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>Spring MVC Autocomplete with JQuery & JSON example</title>
	<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />

	<script type="text/javascript" 
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript" 
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.min.js"></script>

</head>
<body>

<h2>Spring MVC Autocomplete with JQuery & JSON example</h2>
<form:form method="post" action="${pageContext.request.contextPath}/redirect" modelAttribute="userForm">
<table>
	<tr>
		<th>Country</th>
		<td><form:input path="" id="actor" /></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit"/>
		</td>
	</tr>
</table>	
<br />
	
</form:form>

<script type="text/javascript">
function split(val) {
    return val.split(/,\s*/);
}
function extractLast(term) {
    return split(term).pop();
}

$(document).ready(function() {

	$( "#actor" ).autocomplete({
		source: '${pageContext. request. contextPath}/premiere'
	});
	
	
});
</script>

</body>
</html>

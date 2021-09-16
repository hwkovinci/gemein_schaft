<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

   <head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
* {
  box-sizing: border-box;
}

body {
  font: 16px Arial;  
}

/*the container must be positioned relative:*/
.autocomplete {
  position: relative;
  display: inline-block;
}

input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}

input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
}

input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
}

.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

/*when hovering an item:*/
.autocomplete-items div:hover {
  background-color: #e9e9e9; 
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
</style>

  </head>
<body>
<table><c:forEach items="${timeInfo}" var = "chronologie">
<tbody>${chronologie.key}</tbody><tr>
<c:forEach items="${chronologie.value}" var ="cv">

<c:set value = "${pageContext.request.contextPath}/sixieme_?want=${cv.getId().substring(1, 10)}${req}" var = "href"/>
<a href = ${href} >

<image src = ${cv.getPoster()} alt = "image" sizes="(min-width: 600px) 200px, 50vw">
</a>
<td>${cv.getName()}</td>
<td>${cv.getRating()}</td>
<td>${cv.getYear()}</td>
<td>${cv.getReleased()}</td>
<td>${cv.getRuntime()}</td>
<td>${cv.getPlot()}</td>
<td>${cv.getCountry()}</td>

</c:forEach>

</tr></c:forEach>
</table>
<p>you might also looking for
<tr>
<c:forEach items='${dC}' var = 'dirCon'>
<c:set value = "${dirCon.getValue()}" var="valeur"/>
<c:set value = "${dirCon.getKey()}" var="cle"/>
<c:set value ="${pageContext.request.contextPath}/director/${cle}${id}" var = "href"/>
<a href = ${href}>${valeur}</a>
</c:forEach></tr></p>
<p2>who's in there
<tr>
<c:forEach items='${tC}' var = 'titCon'>
<c:set value = "${titCon.getName()}" var="valeur"/>
<c:set value = "${titCon.getId().substring(1, 10)}" var="cle"/>
<c:set value ="${pageContext.request.contextPath}/title/${cle}${id}" var = "href"/>
<a href = ${href}>${valeur}</a>
</c:forEach></tr></p2>
</body>

<tbody>

<h2>Autocomplete</h2>

<p>Start typing:</p>

<!--Make sure the form has the autocomplete function switched off:-->
<form autocomplete="off" action="${pageContext.request.contextPath}/redirect${rq}">
  <div class="autocomplete" style="width:300px;">
    <input id="myInput" type="text" name="id" placeholder="bien venu">
  </div>
  <input type="submit">
</form>
 <script src = "<c:url value = "/js/jquery-1.9.1.js"/>"></script>
     <script src = "<c:url value = "/js/jquery-ui.min.js"/>"></script>
     <script src = "<c:url value = "/js/jquery-ui.js"/>"></script>
	 <script type="text/javascript">
	$(document).ready(function() {
		$('#myInput').autocomplete({
			source : '${pageContext.request.contextPath }/instant'
		});
	});
</script>



</tbody>

</html>

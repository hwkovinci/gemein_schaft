<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
   <head>

<!--Make sure the form has the autocomplete function switched off:-->
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
<c:forEach items="${poster}" var="genre">
<div class="content_wrapper">

<tr>${genre.key}#####################################################</tr>
<c:forEach items="${genre.value}" var = "tranche">

<br><c:set value = "sixieme_?want=${tranche.getId().substring(1, 10)}${req}" var = "href"/>
<a href = ${href}><image src = ${tranche.getPoster()} alt = "image" sizes="(min-width: 600px) 200px, 50vw" ></a>
<br>${tranche.getName()}
<br>${tranche.getRating()}
<br>${tranche.getYear()}
<br>

</c:forEach> 
</div>  
</c:forEach>    



</body>



<tbody>
<script src = "<c:url value = "/js/jquery-1.9.1.js"/>"></script>
<script src = "<c:url value = "/js/jquery-ui.min.js"/>"></script>
<script src = "<c:url value = "/js/jquery-ui.js"/>"></script>
<h2>Autocomplete</h2>

<p>Start typing:</p>
<form autocomplete="off" action="${pageContext.request.contextPath}/redirect${rq}">
  <div class="autocomplete" style="width:300px;">
    <input id="myInput" type="text" name="id" placeholder="bien venu">
  </div>
  <input type="submit">
</form>
<script type="text/javascript">
	$(document).ready(function() {
		$('#myInput').autocomplete({
			source : '${pageContext.request.contextPath }/instant'
		});
	});
</script>



</tbody>

</html>

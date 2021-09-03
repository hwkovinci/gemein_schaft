<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<>

<link rel = "stylesheet" href = "main.css"> 

<script src="https://ket.fontawesome.com/797356307.js"></script></head>

<body>
<c:set value = ${oui}+1  var = "ouNon"/>


<div class = "container">
<i onclick="Toggle()" id = "btn" class = "far fa-heart">
<form:form action='/huitieme_' modelAttribuite="record" method = "post">
<form:input path="ouiOuNon" value = ${ouNon}>
<form:input path="userId" value = ${userId}>
<form:input path="titleId" value= "${want}">
<input onclick="Toggle()">
</form:form>
</i>
</div>

<script>
var btn = document.getElementById("btn");

function Toggle(){
if(${oui} == 0){
  btn.ClassList.add("fas");
  }
else{
  btn.ClassList.add("far");
  }
if(btn.ClassList.contains("far")){
btn.classList.remove("far");
btn.classList.add("fas");

}
else{
btn.classList.remove("fas");
btn.classList.add("far");
   } 

}

</script>
</body>

</html>




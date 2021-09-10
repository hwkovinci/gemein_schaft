<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
  <head>
  <style type="text/css">
  .two {
  background: #df5252;
  
}
h1 {
  margin: 0;
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  width: 100%;
  font-size: 80px;
  letter-spacing: 5px;
  color: #fff;
  text-transform: uppercase;
}
.nav-link{
  text-decoration: none;
  color: grey
}
</style>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <title>jQuery Horizontal Scroll Swap Demo</title>
  </head>
  <body>
    
    
    <header class="vh-100 d-flex flex-column align-items-center justify-content-center">
      <h1 class="text-center">Hello, world!<br>Scroll to see horiztonal scroll</h1>
    </header>


    <!-- Example of a horizontal video -->
 
<div class= "horizon">
<c:forEach items="${poster}" var="genre">
${genre.key}#######################################

<c:forEach items="${genre.value}" var = "tranche" varStatus = "i">
<div class="example">
<c:set value = "sixieme_?want=${tranche.getId().substring(1, 10)}" var = "href"/>
<a href = ${href}><image src = ${tranche.getPoster()} alt = "desk" class="img-fluid" ></a>
<p2>${genre.key}!!!!!! rank ${i.count} !!!!! </p2>>
<p><br>${tranche.getName()}
<br>${tranche.getRating()}
<br>${tranche.getYear()}
<br></p>
<section Class ="two" id = ><h1>${genre.key}</h1></section>
</div>
</c:forEach> 


</c:forEach>
</div>  

  <script src="<c:url value = "/js/jquery-3.4.1.min.js"/>" > </script>
<script src="<c:url value = "/js/jquery-horizontal-scroll.js"/>" > </script>
<script>
      $( document ).ready(function() {
        
        $( '.horizon' ).horizontalScroll({
          containerHeight: "300vh"
        });
        
      });
      

    </script> 
    
    
    <footer class="vh-100 p-5">Nothing here, just to demonstrate scrolling down.</footer>
    

    
  </body>
</html>
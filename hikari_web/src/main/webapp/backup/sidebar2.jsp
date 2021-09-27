<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>

<html lang="en">
<head>
<!-- ===================================== CSS ===================================== -->
<style>

input[id="menuicon"] {display:none;}
input[id="menuicon"] + label {display:block;margin:30px;width:25px;height:20px;position:relative;cursor:pointer;}
input[id="menuicon"] + label span {display:block;position:absolute;width:100%;height:3px;border-radius:30px;background:#000;transition:all .35s;}
input[id="menuicon"] + label span:nth-child(1) {top:0;}
input[id="menuicon"] + label span:nth-child(2) {top:50%;transform:translateY(-50%);}
input[id="menuicon"] + label span:nth-child(3) {bottom:0;}
input[id="menuicon"]:checked + label {z-index:2;}
input[id="menuicon"]:checked + label span {background:#fff;}
input[id="menuicon"]:checked + label span:nth-child(1) {top:50%;transform:translateY(-50%) rotate(45deg);}
input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
input[id="menuicon"]:checked + label span:nth-child(3) {bottom:50%;transform:translateY(50%) rotate(-45deg);}
div[class="sidebar"] {width:300px;height:100%;background:#0A0A0A;position:fixed;top:0;left:-300px;z-index:1;transition:all .35s;}
input[id="menuicon"]:checked + label + div {left:0;}



#main_skel{margin: 0; padding: 0; background-color: #0A0A0A; padding-top: 15px;}

.genre_title{font-size : 25px; font-weight :bold; margin-left : 20px; color: #B6B6B6;}

.genre_title:hover{color: white;}

.genre_movie_info{display:flex; margin:10px; text-align: center; margin-left: 300px;}

.movie_info_block{margin: 30px;}

.post_img{display: block; width:320px; height: 450px; left:0; right:0; margin: 0px auto;}
  
.movie_info{text-align : center;}

.movie_title {font-size : 20px; font-weight : bold; border:1px white; width: 320px; 
              height : 50px; margin-top : 30px; word-break : normal;}

.staricon {width:15px;}


button {background-color: transparent; background-repeat: no-repeat; border: none; cursor: pointer; overflow: hidden; outline: none;}


</style>
<!-- ===================================== CSS ===================================== -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon" href="https://github.com/notlelis/img-url/blob/main/favicon1.png?raw=true">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300&display=swap" rel="stylesheet">

<link href="netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<title>sidebar</title>
</head>
<body>

<script src = "<c:url value = "/js/jquery-1.9.1.js"/>"></script>
<script src = "<c:url value = "/js/jquery-ui.js"/>"></script>
<script src = "<c:url value = "/js/jquery-ui.min.js"/>"></script>

<script type="text/javascript">
  $(document).ready(function() {
    $('#myInput').autocomplete({
      source : '${pageContext.request.contextPath }/instant'
    });
  });
</script>



<input type="checkbox" id="menuicon">
<label for="menuicon">
  <span></span>
  <span></span>
  <span></span>
</label>
<div class="sidebar">
<!-- main genre -->

<div id= "main_skel">
<c:forEach items = "${poster}" var= "peint">
<div class="genre_block" >
<button id = "${peint.key}B"  class = "genre_title">${peint.key}</button>
<div class = "genre_movie_info" id = "${peint.key}" ><div></div> </div>
</div>
</c:forEach>
</div>     
<c:forEach items = "${poster}" var= "peint">
<script>
function htmlentities(str){
 return $("div").text(str).html();
}
</script>
<script type = "text/javascript">
$(document).ready(function(){
let preuve = 1;
$('${peint.value.getValue()}B').click(function(){
 $.getJSON("${pageContext.request.contextPath }/genre/${peint.value.getKey()}", function(donne){
if(preuve % 2  != 0){
   $('${peint.value.getValue()}').empty();
   for(var i = 0; i < donne.length ; i ++){
      
      console.log(donne[i]);
      console.log( preuve);
      trouver = false;
      
      trouver = true;
       $('${peint.value.getValue()}').append('<div class= "genre_movie_info">'
      +'<a href="${pageContext.request.contextPath}/sixieme_?want='
       +donne[i]['id'].substring(1, donne[i]['id'].length-1)
       +'${req}">'
      +'<image src =' 
      + donne[i]['poster']
      +' alt = "dest", class = "post_img"></a>'
      +'<div class = "movie_info">'
      +'<div class = "movie_title">'
      + donne[i]['name']
      +'</div>'
      +'<div class = "movie_rating">'
      +'<br><img class = "staricon" src = "https://github.com/hykim-king/NORAJO/blob/main/NORAJO/src/main/webapp/resources/img/redstar.png?raw=tre" alt = "Red Star">'
      + donne[i]['rating']
      +'</div>'
      +'<div class = "movie_year">'
      + donne[i]['year']
      +'</div></div></div>');
      }
     }
else{
console.log(preuve);
$('${peint.value.getValue()}').empty();

} 
preuve = preuve +1;

    });
});

});

</script>
</c:forEach>
  <!-- main genre end -->
</div>


</body>
</html>
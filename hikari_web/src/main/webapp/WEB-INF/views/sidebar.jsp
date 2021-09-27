<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
<!-- ===================================== CSS ===================================== -->
  <style type="text/css">
  *{margin: 0; padding: 0;}
  
  
input[id="menuicon"] {display:none;}
input[id="menuicon"] + ul {display:block; position:fixed; right:0; top:50%; transform:translateY(-50%); transition:all .35s; text-align:right;}
input[id="menuicon"] + ul > li {display:block; width:50px; height:50px; border:1px solid #f1f1f1; position:relative; margin-top:-1px;}
input[id="menuicon"] + ul > li > a {display:block; width:auto; height:50px; overflow:hidden; transition:all .35s;}
input[id="menuicon"] + ul > li > label {display:block; cursor:pointer; width:auto; height:50px; background:#dadada;}
input[id="menuicon"] + ul > li:nth-child(1) label span {display:block; position:absolute; width:50%; height:3px; border-radius:30px; background:#333; transition:all .35s;}
input[id="menuicon"] + ul > li:nth-child(1) label span:nth-child(1) {top:30%; left:50%; transform:translateX(-50%);}
input[id="menuicon"] + ul > li:nth-child(1) label span:nth-child(2) {top:50%; left:50%; transform:translate(-50%,-50%);}
input[id="menuicon"] + ul > li:nth-child(1) label span:nth-child(3) {bottom:30%; left:50%; transform:translateX(-50%);}
input[id="menuicon"] + ul > li:nth-child(2) a .icon {background-size:50%; display:inline-block; width:50px; height:50px; vertical-align:middle;}
input[id="menuicon"] + ul > li:nth-child(3) a .icon {background-size:50%; display:inline-block; width:50px; height:50px; vertical-align:middle;}
input[id="menuicon"]:checked + ul {z-index:2; right:300px;}
input[id="menuicon"]:checked + ul > li:nth-child(1) label {z-index:2; right:300px;}
input[id="menuicon"]:checked + ul > li:nth-child(1) label span:nth-child(1) {top:50%; left:50%; transform:translate(-50%,-50%) rotate(45deg);}
input[id="menuicon"]:checked + ul > li:nth-child(1) label span:nth-child(2) {opacity:0;}
input[id="menuicon"]:checked + ul > li:nth-child(1) label span:nth-child(3) {bottom:50%; left:50%; transform:translate(-50%,50%) rotate(-45deg);}
div[class="sidebar"] {width:300px; height:100%; background:#f5f5f5; position:fixed; top:0; right:-300px; z-index:1; transition:all .35s;}
input[id="menuicon"]:checked + ul + div {right:0;}



#main_skel{margin: 0; padding: 0; background-color: #0A0A0A; height: 100%; padding-top: 30px;}

.genre_title{font-size : 18px; font-weight :bold; margin-left : 50px; color: #B6B6B6; border: none; background-color: transparent; outline: none;}

.genre_title:hover{color: white;font-size : 20px;}

.genre_movie_info{margin:10px; text-align: center;}

.movie_info_block{margin: 30px;}

.post_img{display: block; width:200px; height: 260px; left:0; right:0; margin: 0px auto;}

.ranking{position:absolute; top:17px; left:0; width:50px; height:50px; line-height:50px;
         background-color : orange; text-align: center;}
  
.movie_info{text-align : center;}

.movie_title {font-size : 20px; font-weight : bold; border:1px white; width: 320px; 
              height : 50px; margin-top : 30px; word-break : normal;}

.staricon {width:15px;}

  </style>
<!-- ===================================== CSS ===================================== -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon" href="https://github.com/notlelis/img-url/blob/main/favicon1.png?raw=true">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<title>NORAJO</title>
</head>
<body id="bod" onload="backgr()">

<script src = "<c:url value = "/js/background.js"/>"></script>


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
<!-- ===================================== checkbox ===================================== -->

<input type="checkbox" id="menuicon">
<ul>
  <li>
    <label for="menuicon">
      <span></span><span></span><span></span>
    </label>
  </li>
</ul>

<div class="sidebar">

<!-- ===================================== checkbox ===================================== -->


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

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>

<html lang="en">
<head>
<!-- ===================================== CSS ===================================== -->
  <style type="text/css">
  *{margin: 0; padding: 0;}
  body{background: no-repeat center center fixed; 
        -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover; overflow: hidden;}
  a{text-decoration: none;}
  ul{list-style: none; height: 300px; overflow-x: hidden; overflow-y: scroll hidden; width: 100%; min-width: 450px; }
  li{list-style: none; color: white; background-color: rgb(58, 61, 66, 0.5); width: 39%;
     min-width: 450px; cursor: pointer; height: 30px; padding-left: 20px; padding-top: 20px;}
  
.bg1  {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/1.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg2  {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/2.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg3  {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/3.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg4  {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/4.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg5  {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/5.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg6  {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/6.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg7  {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/7.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg8  {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/8.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg9  {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/9.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg10 {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/10.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg11 {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/11.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg12 {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/12.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg13 {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/13.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg14 {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/14.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg15 {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/15.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg16 {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/16.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg17 {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/17.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg18 {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/18.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg19 {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/19.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg20 {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/20.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg21 {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/21.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg22 {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/22.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}
.bg23 {background-image: url("https://github.com/notlelis/img-url/blob/main/new%20hd%20mov%20pos/23.jpg?raw=true"); image-rendering: -webkit-optimize-contrast;}


/*──────────────────────────────────────────────────────────────────────────────*/

input[id="menuicon"] {display:none;}
input[id="menuicon"] + label {display:block; margin:30px; width:25px; height:20px; position:relative; cursor:pointer;}
input[id="menuicon"] + label span {display:block; position:absolute; width:100%; height:3px; border-radius:30px; background:white; transition:all .35s;}
input[id="menuicon"] + label span:nth-child(1) {top:0;}
input[id="menuicon"] + label span:nth-child(2) {top:50%; transform:translateY(-50%);}
input[id="menuicon"] + label span:nth-child(3) {bottom:0;}
input[id="menuicon"]:checked + label {z-index:2;}
input[id="menuicon"]:checked + label span {background:#fff;}
input[id="menuicon"]:checked + label span:nth-child(1) {top:50%; transform:translateY(-50%) rotate(45deg);}
input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
input[id="menuicon"]:checked + label span:nth-child(3) {bottom:50%; transform:translateY(50%) rotate(-45deg);}
div[class="sidebar"] {width:100%; height:100%; background:rgba(10,10,10,0.8); position:fixed; top:0; left:-100%; z-index:1; 
                      transition:all .35s; -ms-overflow-style: none; scrollbar-width: none; overflow-y: scroll; }
div[class="sidebar"]::-webkit-scrollbar {display: none;}                      
input[id="menuicon"]:checked + label + div {left:0;}



#main_skel{margin-top: 80px; margin-bottom: 100px;}

.genre_title{font-size : 18px; font-weight :bold; margin-left : 80px; color: #B6B6B6; 
             border: none; background-color: transparent; outline: none;}

.genre_title:hover{color: white;font-size : 20px;}

.genre_movie_info{margin:10px; text-align: center; display: inline-block; flex-direction: row; flex-wrap: wrap; justify-content: flex-end;}

.movie_info_block{margin: 30px;}

.post_img{display: block; width:200px; height: 260px; left:0; right:0; margin: 0px auto;}

.movie_title {font-size : 20px; font-weight : bold; width: 320px; color: white; margin-top: 15px;}
              
.movie_rating{font-size : 15px; font-weight : bold; border:1px white; width: 320px; color: white;}

.movie_year{font-size : 15px; font-weight : bold; border:1px white; width: 320px; color: white;}

.staricon {width:15px;}
/*──────────────────────────────────────────────────────────────────────────────*/
/*────────────────────────────────────header────────────────────────────────────*/

  .logo-wrapper{display: flex; width: 100%; height: 150px; justify-content: center; align-items: center; padding-top: 240px;}
  .logo{position: absolute; image-rendering: -webkit-optimize-contrast;}   

  ::-webkit-input-placeholder{color: gray;}
  ::-moz-placeholder{color: gray;}
  ::-ms-input-placeholder{color: gray;}
  
  
  .login_signup_wrapper{width: 100%; height: 24px; z-index: 99999; float: right; 
                        font-family: HelveticaNeueLT Std; color: white;}
     
     
  .login-area{float: right; text-align: center; padding-top: 12px; color: white;}
  .login-area a{color: #B6B6B6; font-size: 12px; padding-right: 30px; padding-left: 35px;
                display: block;  white-space: nowrap;}
  .login-area a:hover{cursor: pointer; color: white;}
  
  .signup-area{float: right; text-align: center; padding-top: 12px;}
  .signup-area a{color: #B6B6B6; font-size: 12px; padding-left: 20px; 
                 display: block; padding-right: 60px; white-space: nowrap;}
  .signup-area a:hover{cursor: pointer; color: white;}
  
  
  
  .search-wrapper{display: flex; width: 100%; height: 130px; justify-content: center; align-items: center;}

  .autocomplete{width: 40%; min-width: 450px;}
  .search-bar input[type="text"]{width: 100%; padding: 15px 20px 15px 20px; padding-right: 60px; box-sizing: border-box;
                                 background-color: rgb(58, 61, 66, 0.5); outline: none; 
                                 font-size: 16px; outline: none; border: 2.4px solid gray; color: white; font-family: 'Roboto', sans-serif;}    
                                 
  .search-bar{position: relative;}                    
  .search-bar input:hover{border: 2.4px solid white; transition: 1s;}
                                       
  .search-bar input[type="submit"]{background: transparent; cursor: pointer; border: 0; text-indent: -9999em;
                                   width: 70px; height: 39px; position: absolute; right: 0; font-size: 18px;}     
                                   
  .fa-search{position: absolute; top: 31%; right: 26px; font-size: 21px; color: #C9C9C9; pointer-events: none;}

  .ui-helper-hidden-accessible{text-indent: -9999em;}


/*────────────────────────────────────header────────────────────────────────────*/


/*────────────────────────────────────footer────────────────────────────────────*/
  
  .footer-wrapper {color: #EDEDED; bottom: 0; position: fixed; width: 100%;
                   background-color: #0A0A0A; padding: 15px;}
  
  .contact-line {white-space: nowrap; justify-content: center; align-items: center; display: flex;}

/*────────────────────────────────────footer────────────────────────────────────*/

  </style>
<!-- ===================================== CSS ===================================== -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon" href="https://github.com/notlelis/img-url/blob/main/favicon1.png?raw=true">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300&display=swap" rel="stylesheet">
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
  
  <div class="login_signup_wrapper">
     <div class="signup-area">
     <!-- 연결이 안되서 일단 꼼수 -->
   <a href="${pageContext.request.contextPath}/${cr}">${ck}</a>
     </div>
     
     <div class="login-area">
       <!-- 연결이 안되서 일단 꼼수 -->
       <a href="${pageContext.request.contextPath}/${ar}">${ak}</a>
       
     </div>
  </div>


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
      +'<br><img class = "staricon" src ="https://github.com/hykim-king/NORAJO/blob/main/NORAJO/target/redstar.png?raw=true"  alt="Red Star">'
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



<!-- ===================================== header ===================================== -->
  <div class="content">
  
  
    <div class="logo-wrapper">
      <div class="logo">
        <a href="http://localhost:8080/hikari_web/deuxieme_">
          <img src="https://github.com/notlelis/img-url/blob/main/NlogoWhite.png?raw=true" width="340px"></a>
      </div>
    </div>
  
  
    <div class="search-wrapper">
      <div class="autocomplete">
        <form class="search-bar" autocomplete = "off" action= "${pageContext.request.contextPath}/redirect${rq}">
          <input  id ="myInput" name = "id" class="form-search" type="text" placeholder="Type to search.." >
          <input class="btn_search" type="submit"><i class="fa fa-search"></i>
        </form> 
       </div>
    </div>
    
  </div>
  

<!-- ===================================== header ===================================== -->

<!-- ===================================== footer ===================================== -->
  <div class="container"></div>

   <footer>
     <div class="footer-wrapper">
       <div class="contact-line">
        <script id="_wau1ri">var _wau = _wau || []; _wau.push(["small", "vjjwicd5uc", "1ri"]);</script>
        <script class="count" async src="//waust.at/s.js"></script>
       </div>
     </div>
   </footer> 

<!-- ===================================== footer ===================================== -->
</body>

</html>

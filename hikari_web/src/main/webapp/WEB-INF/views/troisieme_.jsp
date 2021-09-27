<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<html>
<head>
<!-- ===================================== CSS ===================================== -->
  <style type="text/css">

  *{margin: 0; padding: 0;}
  body{background: no-repeat center center fixed; -webkit-background-size: cover; 
       -moz-background-size: cover; -o-background-size: cover; background-size: cover; overflow-x: hidden; }
  a{text-decoration: none;}
  ul{list-style: none; height: 300px; overflow-x: hidden; overflow-y: scroll hidden; width: 100%; min-width: 450px;}
  li{list-style: none; color: white; background-color: rgb(58, 61, 66, 0.8); width: 49.4%;
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
/*────────────────────────────────────header────────────────────────────────────*/

  .header_wrapper{color: #EDEDED; width: 100%; display: flex; position: relative;
                  background-color: #0A0A0A; padding: 10px 80px 10px 80px;}
  
  .logo_wrapper{width: 300px; float: left; white-space: nowrap; margin-right: 60px;}
  .logo{margin: 23px; image-rendering: -webkit-optimize-contrast;} 
  
  
  ::-webkit-input-placeholder{color: gray;}
  ::-moz-placeholder{color: gray;}
  ::-ms-input-placeholder{color: gray;}

  .autocomplete{width: 50%; min-width: 100px; margin: 27px; white-space: nowrap; float: left; padding-right: 60px;}
  .search-bar input[type="text"]{width: 100%; padding: 12px; padding-right: 60px; box-sizing: border-box;
                                 background-color: rgb(58, 61, 66, 0.5); outline: none; 
                                 font-size: 14px; outline: none; border: 2.4px solid gray; color: white; font-family: 'Roboto', sans-serif;}    
                                 
  .search-bar{position: relative;}                    
  .search-bar input:hover{border: 2.4px solid white; transition: 1s;}
                                       
  .search-bar input[type="submit"]{background: transparent; cursor: pointer; border: 0; text-indent: -9999em;
                                   width: 70px; height: 39px; position: absolute; right: 0; font-size: 16px;}     
                                   
  .fa-search{position: absolute; top: 28%; right: 26px; font-size: 21px; color: #C9C9C9; pointer-events: none;}

  .ui-helper-hidden-accessible{text-indent: -9999em;}
  
  
  .log_sign_wrapper{width: 260px; float: right; white-space: nowrap; margin-left: 60px; padding-top: 40px;}
  
  .login-area{float: right; text-align: center;}
  .login-area a{color: #B6B6B6; font-size: 12px; display: block; padding-right: 40px;}
  .login-area a:hover{cursor: pointer; color: white;}
  
  .signup-area{float: right; text-align: center;}
  .signup-area a{color: #B6B6B6; font-size: 12px; display: block; padding-right: 40px;}
  .signup-area a:hover{cursor: pointer; color: white;}
  
/*────────────────────────────────────header────────────────────────────────────*/
/*────────────────────────────────────content────────────────────────────────────*/
  .content_wrapper{width: 1100px; height: 900px; padding: 30px; margin: 40px 100px 100px 80px;}
  

  
  .search_result{font-size: 35px; font-family: 'Oswald',sans-serif; line-height: 27px; color: white; padding-bottom: 80px;}

  .movie_info{display: flex;}

  .poster_img{display: block; line-height: 300px; color: white; left:0; right:0;
             width:320px; height: 450px;  text-align: center; float: left; margin-top: 20px;}
  .mov_title{display: block; width: 700px; height: 50px; border-bottom: 2px solid white; font-family: 'Oswald',sans-serif; 
             float: right; margin-top: 50px; padding-left: 20px; font-size: 30px; color: white;}
  .info_detail_1{display: block; width: 300px; height: 300px; float: left; margin-top: 20px; 
                 padding-left: 47px; line-height: 34px; text-align: right; color: white; font-size: 18px;}   

  .info_detail_2{display: block; width: 530px; height: 300px; float: left; margin-top: 20px; 
                 line-height: 34px; text-align: left; color: white; font-size: 18px;} 
                 
  .staricon {width:15px;}
  
  .direc_act{ text-align: center;
        padding:10px;
        width: 500px;
        height: auto;
        border-radius:10px;
        left: 500px;
        position: relative;
        background-color: rgb(255, 255, 255, 0.5);
        }
  .side_title{border-bottom: 2px solid black;
              font-weight: bold;
              margin-bottom:20px;
              font-size: 20px;
              padding: 0px 10px 10px 10px;
              }       
  
  .director_list{font-weight:bold;}
  .direc a{}
  
  .actor_list{}
  .act a{}
/*────────────────────────────────────content────────────────────────────────────*/
/*────────────────────────────────────footer────────────────────────────────────*/

  .footer-wrapper{color: #EDEDED; width: 100%; display: flex; bottom: 0; position: relative;
                  background-color: #0A0A0A; padding: 35px 80px 35px 80px; margin-top: auto;}
  
  .lnb{padding-bottom: 20px;}
  
  .btb{line-height: 25px;}
  
  .project{width: 260px; float: left; white-space: nowrap; padding-right: 60px;}
  
  .front-end{width: 240px; float: left; white-space: nowrap; padding-right: 60px;}

  .was-data{width: 310px; float: left; white-space: nowrap; padding-right: 60px;}
  
  .back-end{width: 260px; float: left; white-space: nowrap; padding-right: 60px;}
  
  .contact-line{width: 510px; float: left; border-left: 2px solid #B6B6B6; 
                padding: 0 0 0 50px; white-space: nowrap; padding-right: 60px;}

/*────────────────────────────────────footer────────────────────────────────────*/

  </style>
<!-- ===================================== CSS ===================================== -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon" href="https://github.com/notlelis/img-url/blob/main/favicon1.png?raw=true">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@500&display=swap" rel="stylesheet">

<title>NORAJO</title>
</head>
<body id="bod" onload="backgr()">

  <script src = "<c:url value = "/js/background.js"/>"></script>
  
<!-- ===================================== header ===================================== -->
  <header>
    <div class="header_wrapper">
       
      <div class="logo_wrapper"> 
      <a href="${pageContext.request.contextPath}/${nr}">
        <img class="logo" src="https://github.com/notlelis/img-url/blob/main/NlogoWhite.png?raw=true" width="180px"></a>
      </div>
    
    
      <div class="autocomplete">
        <form class="search-bar" autocomplete = "off" action= "${pageContext.request.contextPath}/redirect${rq}">
          <input  id ="myInput" name = "id" class="form-search" type="text" placeholder="Type to search.." >
          <input class="btn_search" type="submit"><i class="fa fa-search"></i>
        </form> 
      </div>
      
      <div class="blank"></div>
    
      <div class="log_sign_wrapper">
        <div class="signup-area">
          <!-- 연결이 안되서 일단 꼼수 -->
     <a href="${pageContext.request.contextPath}/${cr}">${ck}</a>
        </div>
        <div class="login-area">
          <!-- 연결이 안되서 일단 꼼수 -->
        <a href="${pageContext.request.contextPath}/${ar}">${ak}</a>
        </div>
      </div>
    </div>
    
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
    
  </header>
  
<!-- ===================================== header ===================================== -->
<!-- ===================================== content ===================================== -->

  <div class="content_body">
    <div class="content_wrapper">
      
    <div>
      <table class="search_result">
        <tr>
          <td>Search result for title</td>
          <td>&nbsp;&nbsp;:&nbsp;</td>
          <td>${movieInfo.getName()}</td>
        </tr>
      </table>
    </div>
     <div class="movie_info">
      <c:set value = "${pageContext.request.contextPath}/sixieme_?want=${movieInfo.getId().substring(1, 10)}${req}" var = "href"/>
      <div class="poster_box">  
        <a href = ${href} ><img src = ${movieInfo.getPoster()} alt = "image" class="poster_img"></a>
          </div>
    
      
      <table class="info_detail_1">
        <tr class="r_date">
          <td>Release Date</td>
          <td>&nbsp;&nbsp;:&nbsp;</td> 
        </tr>
        <tr class="ratings">
          <td>Ratings</td>
          <td>&nbsp;&nbsp;:&nbsp;</td> 
        </tr>
        <tr class="country">
          <td>Country</td>
          <td>&nbsp;&nbsp;:&nbsp;</td> 
        </tr>
        <tr class="runtime">
          <td>Runtime</td>
          <td>&nbsp;&nbsp;:&nbsp;</td> 
        </tr>
      </table>
      
      <table class="info_detail_2">
        <tr class="r_date">
          <td>${movieInfo.getReleased()}</td>
        </tr>
        <tr class="ratings">
          <td><img class="staricon" src ="https://github.com/hykim-king/NORAJO/blob/main/NORAJO/target/redstar.png?raw=true"  alt="Red Star">${movieInfo.getRating()}</td>
        </tr>
        <tr class="country">
          <td>${movieInfo.getCountry()}</td>
        </tr>
        <tr class="runtime">
          <td>${movieInfo.getRuntime()}</td>
        </tr>
      </table>

  <div class="direc_act">
    <p class="side_title"> Related Search Terms <br></p>
    <table>
    <tr><th></th></tr>
    <tr class="director_list"><b>DIRECTOR</b></tr>
    <c:forEach items= "${dC}" var = "dirCon">
    <br>
    <c:set value = "${dirCon.getValue()}" var="valeur"/>
    <c:set value = "${dirCon.getKey()}" var="cle"/>
    <c:set value ="${pageContext.request.contextPath}/director/${cle}${id}" var = "href"/>
    <a class="direc" href = ${href}>${valeur}</a>
    <tr><th></th></tr> 
    </c:forEach>
    </table>
    
    <table>

    <tr class="actor_list"><b>ACTOR</b></tr>
    <c:forEach items='${aC}' var = 'actCon'>
    <br>
    <c:set value = "${actCon.getValue()}" var="valeur"/>
    <c:set value = "${actCon.getKey()}" var="cle"/>
    <c:set value ="${pageContext.request.contextPath}/actor/${cle}${id}" var = "href"/>
    <a class="act" href = ${href}>${valeur}</a>
    </c:forEach>
    </table>
  </div>

    </div>
  </div>
</div>
<!-- ===================================== content ===================================== -->
<!-- ===================================== footer ===================================== -->

  <footer>
    <div class="footer-wrapper">
      <div class="project">
        <p class="lnb" style="font-size: 18px">PROJECT NORAJO</p>
          <p class="btb" style="font-size: 12px">Jin Seo Kim</p>
          <p class="btb" style="font-size: 12px">Hyun Woo Ko</p>
          <p class="btb" style="font-size: 12px">Bo Seong Gwon</p>
          <p class="btb" style="font-size: 12px">Bo Sun Kim</p>
          <p class="btb" style="font-size: 12px">Chae Lynn Yoo</p>
      </div>
    
      <div class="front-end">
        <p class="lnb" style="font-size: 18px">FRONT END</p>
          <p class="btb" style="font-size: 12px">JAVASCRIPT</p>
          <p class="btb" style="font-size: 12px">HTML</p>
          <p class="btb" style="font-size: 12px">CSS</p>
          <p class="btb" style="font-size: 12px">JQEURY</p>
      </div>
      
      <div class="was-data">
        <p class="lnb" style="font-size: 18px">WAS/DATABASE</p>
          <p class="btb" style="font-size: 12px">Apache Tomcat</p>
          <p class="btb" style="font-size: 12px">ORACLE SQL DEVELOPER</p>
      </div>  
      
      <div class="back-end">
        <p class="lnb" style="font-size: 18px">BACK END</p>
          <p class="btb" style="font-size: 12px">SPRING</p>
          <p class="btb" style="font-size: 12px">JAVA</p>
      </div>  
      
      <div class="contact-line">
        <p class="lnb" style="font-size: 18px">CONTACT</p>
          <p class="btb" style="font-size: 12px">E-Mail : korea@norajo.com</p>
          <p class="btb" style="font-size: 12px">Address : 53, Yangsan-ro, Yeongdeungpo-gu, Seoul, Republic of Korea</p>
          <p class="btb" style="font-size: 12px">Copyright © 2021 NORAJO Corp. All rights reserved.</p>
      </div>  
    </div>
  </footer>
  
<!-- ===================================== footer ===================================== -->

</body>
</html>

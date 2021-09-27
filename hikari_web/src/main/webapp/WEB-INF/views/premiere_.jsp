<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
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
/*────────────────────────────────────contents────────────────────────────────────*/
/*★필독★ contents 영역 안이 빌 경우, 푸터가 헤더에 달라붙으니 꼭 컨텐츠 영역을 감싸는 부분은 height:100%를 줄것 */
.content_body {padding-top: 10px; padding-bottom: 10px;}

.content_wrapper {width: 1200px; height: 750px; padding: 30px; margin: 40px 100px 100px 80px;}

.top_box {width: 100%; height: 30px; display: flex;}

.c_box_s {width: 3%; height: 30px; background-color: #BA0003;}

.movie_info {width: 13%; height: 30px; text-align: center; font-size: 30px; 
             font-family: 'Oswald', sans-serif; color: white; line-height: 27px;}

.c_box_l {width: 72%; height: 30px; background-color: #BA0003;}

.mov_info {display: flex;}

.mov_title {display: block; width: 704px; height: 50px; border-bottom: 2px solid white;
            font-family: 'Oswald', sans-serif; color: white; margin-top: 50px; 
            padding-left: 20px; font-size: 30px; margin-bottom: 5px; margin-left: 20px;}

.poster_img {display: block; line-height: 300px; color: white; left: 0; right: 0; 
             width: 350px; height: 450px; text-align: center; float: left; margin-top: 50px;}

.img {display: block; line-height: 300px; color: white; left: 0; right: 0; 
             width: 350px; height: 450px; text-align: center; float: left;}

.info_detail {width: 1000px; height: 570px; margin: 1px;}

.r_date {display: block; width: 800px; margin-top: 20px;}

.director {display:flex; width: 800px; margin-top: 5px;}

.actor {display: flex; width: 800px; margin-top: 5px;}

.ratings {display: block; width: 800px; margin-top: 5px;}

.staricon {width: 15px; height: 15px;}

.genre {display: flex; width: 800px; margin-top: 5px;}

.country {display: block; width: 800px; margin-top: 5px;}

.runtime {display: block; width: 800px; margin-top: 5px;}
.info_block { display: inline-table;}

.info_left {width: 150px; height: auto; color: white; font-size: 18px;
            margin-right: 5px; text-align: right; display: inline-block;}

.info_right {width: 800px; height: auto; color : white; font-size: 18px; color: white;}

.movie_summary {color: white; width: 1245px; height: 150px;}

.mov_summary_title {font-family: 'Oswald', sans-serif; font-size: 30px; border-bottom: 2px solid white;
                    margin-bottom: 10px; width: 88%;}

.movie_summary_item {width: 70%;}


.like {margin: -91px 112px 0 0; border-radius: 10px; background-color: white; 
       text-align: center; width: 117px; height: 35px; float: right;}
       
.likeheart{width: 18px; height: 16.5px; position: absolute; top: 876px; left: 1158px; pointer-events: none; image-rendering: -webkit-optimize-contrast;}

#myButton{color: black; margin: 3px; margin-left: 19px; text-align: left; border: none; background: transparent; z-index: 1; width: 100px; height: 30px; font-size: 16px;}

/*────────────────────────────────────contents────────────────────────────────────*/

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
  
  
  <!-- ===================================== contents ===================================== -->

		<div class="content_body">
			<div class="content_wrapper">
			    <div class="top_box">
					<div class="c_box_s"></div>
					<div class="movie_info">MOVIE INFO</div>
					<div class="c_box_l"></div>
				</div>
				<div class="mov_info">
					<div class="poster_img">
						<img class="img" src=${movieInfo.getPoster()}>
					</div>
					<div class="info_detail">
						<div class="mov_title">${movieInfo.getName()}
						</div>
						<div class="r_date">
							<span class="info_left">Release Date :</span> 
							<span class="info_right">${movieInfo.getReleased()}</span>
						</div>
						<div class="director">
							<div class="info_block">
								<span class="info_left">Director :</span>
								<c:forEach items="${dC}" var="dc">
								<span class="info_right">${dc.getValue()}</span>
								</c:forEach>
							</div>	
						</div>
						<div class="actor">
							<span class="info_left">Actor :</span>
							<div class="info_block">
								<c:forEach items="${aC}" var="ac">
								<span class="info_right">${ac.getValue()}</span>
								</c:forEach>
							</div>
						</div>
						<div class="ratings">
							<span class="info_left">Ratings :</span> <span class="info_right">
							<img class="staricon" src="https://github.com/hykim-king/NORAJO/blob/main/NORAJO/target/redstar.png?raw=true" alt="Red Star">${movieInfo.getRating()}</span>
						</div>
						<div class="genre">
							<div class="info_block">
								<span class="info_left">Genre :</span>
								<c:forEach items="${gC}" var="gc">	
								<span class="info_right">${gc.getValue()}</span>
							</c:forEach>
							</div>
						</div>
						<div class="country">
							<span class="info_left">Country :</span> <span class="info_right">${movieInfo.getCountry()}</span>
						</div>
						<div class="runtime">
							<span class="info_left">Runtime :</span> <span class="info_right">${movieInfo.getRuntime()}</span>
						</div>
					</div>
				</div>
				<div class="movie_summary">
						<div class="mov_summary_title">SUMMARY</div>
						<div class="movie_summary_item">${movieInfo.getPlot()}</div>
					</div>
					
					<div class="like">
						<c:set value="${pageContext.request.contextPath}/huitieme_?title=${want}&bool=${ouNon}&user=${userId}" var="likeref" />
						<form action=${likeref } method="post">
						  <input type="submit" id="myButton" value="Like it?">
						  <img class="likeheart" src="${lon}">
					    </form>
					</div>
			</div>
		</div>
<!-- ===================================== contents ===================================== -->
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
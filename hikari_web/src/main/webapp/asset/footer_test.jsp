<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   


<html>
<head>
<!-- ===================================== CSS ===================================== -->
  <style type="text/css">

  html, body {width: 100%; height: 100%; overflow: hidden; font-family: Arial, Helvetica, sans-serif;}
  * {margin: 0;padding: 0; border: 0; vertical-align: baseline; box-sizing: border-box;
     background: transparent; font-style: normal;}
  li{list-style: none;}
  a{text-decoration: none;}

/*──────────────────────────────────── test-area ────────────────────────────────────*/

  .footer-wrapper{color: #EBEBEB; width: 100%; height: 260px; max-height: 400px; 
                  background-color: #0A0A0A; padding: 40px 90px 40px 90px; display: flex; }
  
  .lnb{padding-bottom: 20px;}
  
  .btb{line-height: 25px; font-size: 14px;}
  
  .project{width: 260px; float: left; white-space: nowrap; padding-right: 60px;}
  
  .front-end{width: 240px; float: left; white-space: nowrap; padding-right: 60px;}

	.was-data{width: 310px; float: left; white-space: nowrap; padding-right: 60px;}
	
	.back-end{width: 260px; float: left; white-space: nowrap; padding-right: 60px;}
	
	.contact-line{width: 510px; float: left; border-left: 3px solid #EBEBEB; 
	              padding: 0 0 0 50px; white-space: nowrap; padding-right: 60px;}
	
/*──────────────────────────────────── test-area ────────────────────────────────────*/

  </style>
<!-- ===================================== CSS ===================================== -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon" href="https://github.com/notlelis/img-url/blob/main/testfavicon.png?raw=true">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<title>TEST</title>
</head>
<body>

<!-- ===================================== test-area ===================================== -->

<div class="footer-wrapper">
  <div class="project">
    <p class="lnb" style="font-size: 18px">PROJECT NORAJO</p>
	    <p class="btb">Jin Seo Kim</p>
	    <p class="btb">Hyun Woo Ko</p>
	    <p class="btb">Bo Seong Gwon</p>
	    <p class="btb">Bo Sun Kim</p>
	    <p class="btb">Chae Lynn Yoo</p>
  </div>

  <div class="front-end">
    <p class="lnb" style="font-size: 18px">FRONT END</p>
	    <p class="btb">JAVASCRIPT</p>
	    <p class="btb">HTML</p>
	    <p class="btb">CSS</p>
	    <p class="btb">JQEURY</p>
  </div>
  
  <div class="was-data">
    <p class="lnb" style="font-size: 18px">WAS/DATABASE</p>
	    <p class="btb">Apache Tomcat</p>
	    <p class="btb">ORACLE SQL DEVELOPER</p>
  </div>  
  
  <div class="back-end">
    <p class="lnb" style="font-size: 18px">BACK END</p>
	    <p class="btb">SPRING</p>
	    <p class="btb">JAVA</p>
  </div>  
  
  <div class="contact-line">
    <p class="lnb" style="font-size: 18px">CONTACT</p>
	    <p class="btb">E-Mail : korea@norajo.com</p>
	    <p class="btb">Address : 53, Yangsan-ro, Yeongdeungpo-gu, Seoul, Republic of Korea</p>
	    <p class="btb">Copyright © NORAJO Corp. All rights reserved.</p>
  </div>  
</div>

<!-- ===================================== test-area ===================================== -->

</body>
</html>
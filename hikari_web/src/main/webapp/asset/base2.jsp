<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<html>
<head>
<!-- ===================================== CSS ===================================== -->
  <style type="text/css">
  
  html, body {margin: 0; padding: 0; width: 100%; height: 100%; font-family: HelveticaNeueLT Std;}
  body{font-size:1.125em; line-height: 1.6; background-image: url("https://github.com/notlelis/img-url/blob/main/head%201920x1080.png?raw=true");}
  * {margin: 0; padding: 0; border: 0; vertical-align: baseline; box-sizing: border-box;
     background: transparent; font-style: normal;}
  li{list-style: none;}
  a{text-decoration: none;}
  .wrapper{display: flex; height: 100%; min-height: 100vh; flex-direction: column; margin: 0 auto;}

/*───────────────────────────────────────────────────────────────────────────────*/
  
	.content_wrapper{width: 900px; height: 700px; padding: 30px;}
	
	.c_box_sl{width: 100%; height: 28px; display: flex;}
	
	.c_box_s{width: 5%; height: 27px; background-color: #A90000;}
	.c_box_l{width: 80%; height: 27px; background-color: #A90000;}
	
  .mov_info{text-align: center; width: 15%; font-size: 27px; font-family: 'Oswald',sans-serif; line-height: 27px; color: white;}


  .poster_img{display: block; border: 1px solid white; line-height: 300px; color: white;
              width: 260px; height: 310px; text-align: center; float: left; margin-top: 40px;}
  .mov_title{display: block; width: 550px; height: 50px; border-bottom: 2px solid white; font-family: 'Oswald',sans-serif; 
             float: right; margin-top: 40px; padding-left: 20px; font-size: 30px; color: white;}
  .info_detail{display: block; width: 550px; height: 240px; float: right; margin-top: 20px; 
               padding-left: 20px; line-height: 31px; text-align: right; color: white;}   

  
  .movie_summary{display: block; width: 100%; height: 50px; border-bottom: 2px solid white; font-family: 'Oswald',sans-serif; 
                float: right; margin-top: 25px; padding-left: 20px; font-size: 30px; color: white;}
  .movie_summary_item{display: block; width: 100%; height: 170px; float: right; 
                      margin-top: 10px; padding: 10px 20px 10px 20px; color: white;}
/*───────────────────────────────────────────────────────────────────────────────*/

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
<body>

<!-- ================================================================================ -->

<div class="content_wrapper">
  
  <div class="c_box_sl">
	  <div class="c_box_s"></div>
	    <div class="mov_info">MOVIE INFO</div>
	  <div class="c_box_l"></div>
  </div>

  <div class="poster_img">img</div>
  
  <div class="mov_title">TITLE</div>
  
  <table class="info_detail">
    <tr class="r_date">
      <td>Release Date :</td>
        <td></td>
    </tr>
    <tr class="director">
      <td>Director :</td>
        <td></td>
    </tr>
    <tr class="actor">
      <td>Actor :</td>
        <td></td>
    </tr>
    <tr class="ratings">
      <td>Ratings :</td>
        <td></td>
    </tr>
    <tr class="genre">
      <td>Genre :</td>
        <td></td>
    </tr>
    <tr class="country">
      <td>Country :</td>
        <td></td>
    </tr>
    <tr class="runtime">
      <td>Runtime :</td>
        <td></td>
    </tr>
  </table>
  
  <div class="movie_summary">SUMMARY</div>
    <div class="movie_summary_item">Marvel Studios' "Shang-Chi and The Legend of The Ten Rings" stars Simu Liu as Shang-Chi, who must confront the past he thought he left behind when he is drawn into the web of the mysterious Ten Rings organization. The film also stars Tony Leung as Wenwu, Awkwafina as Shang-Chi's friend Katy and Michelle Yeoh as Jiang Nan, as well as Fala Chen, Meng'er Zhang, Florian Munteanu and Ronny Chieng.</div>
</div>


<!-- ================================================================================ -->

</body>
</html>
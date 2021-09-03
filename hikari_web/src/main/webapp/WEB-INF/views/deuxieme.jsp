<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

   <head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
    <!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />

    <!-- Demo styles -->
    <style>
      html,
      body {
        position: relative;
        height: 100%;
      }

      body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 0;
        padding: 0;
      }

      .swiper {
        width: 100%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
    </style>
  </head>
<body>
    <table id ="touche" border ="20">
<div>
</div>
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
</table>

        <table>
            <tbody>
<tr></tr>
            </tbody>
        </table>
    
<script type= "text/javascript">

var cart = ${poster};
var chaine = Object.fromEntries(Object.entries(cart).sort());
var div = document.getElementById("touche");
console.log(chaine);
for (var i in chaine){
div.innerHTML += "<tr>" ;
div.innerHTML += i ;
div.innerHTML += '<div class="swiper mySwiper">';
console.log(i);
div.innerHTML += '<div class="swiper-wrapper">';
for(var j = 0;  j < chaine[i].length; j++){
var poster = chaine[i][j]["poster"];
var name = chaine[i][j]["name"];
var rating = chaine[i][j]["rating"];
var year = chaine[i][j]["year"];
 console.log(poster);
 console.log(name);
 console.log(rating);
 console.log(year);
div.innerHTML += '<div class="swiper-slide">';
div.innerHTML += "<a href = '#'>";
div.innerHTML += "<img src ="
div.innerHTML += poster;
div.innerHTML += " alt = 'image'>";
div.innerHTML += "</a>"
div.innerHTML += "<td>";
div.innerHTML += name;
div.innerHTML += "</td>";
div.innerHTML += "<td>";
div.innerHTML += rating;
div.innerHTML += "</td>";
div.innerHTML += "<td>";
div.innerHTML += year;
div.innerHTML += "</td>";
div.innerHTML += "</div>";
//for_inner
    }
div.innerHTML += "</div>";
div.innerHTML += '<div class="swiper-button-next"></div>';
div.innerHTML += '<div class="swiper-button-prev"></div>';
div.innerHTML += "</div>";
div.innerHTML += "</tr>" ;
//for
 }

</script>
</body>
</html>

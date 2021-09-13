<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
<!-- ===================================== CSS ===================================== -->
  <style type="text/css">

/*────────────────────────────────────header────────────────────────────────────*/
  
  html, body {margin: 0; padding: 0; width: 100%; height: 100%; font-family: HelveticaNeueLT Std;}
  body{font-size:1.125em; line-height: 1.6; background-image: url("https://github.com/notlelis/img-url/blob/main/bk3.png?raw=true");}
  * {margin: 0; padding: 0; border: 0; vertical-align: baseline; box-sizing: border-box;
     background: transparent; font-style: normal;}
  li{list-style: none;}
  a{text-decoration: none;}
  .wrapper{display: flex; height: 100%; min-height: 100vh; flex-direction: column; margin: 0 auto;}
  
  
  .header-wrapper{width: 100%; height: 110px; background-color: (rgb 10, 10, 10, 0.8);
                  padding: 40px 80px 20px 110px; display: flex; z-index: 99999;}

  .logo{padding-right: 200px; padding-top: 2px; flex: 1;}


  ::-webkit-input-placeholder{color: gray;}
  ::-moz-placeholder{color: gray;}
  ::-ms-input-placeholder{color: gray;}

  .autocomplete{padding-top: 12px; justify-content: center; align-items: center; width: 70%;}
  .search-bar{width: 90%; position: relative; min-width: 200px; border-radius: 11px;}
  
  .search-bar input[type="text"]{width: 100%; height: 40px; padding: 10px; padding-right: 60px; box-sizing: border-box; color: white;
                                 background-color: rgb(58, 61, 66, 0.5); border-radius: 8px; outline: none;}      
                                     
  .search-bar input[type="submit"]{background-color: white; color: white; cursor: pointer; 
                                   width: 70px; height: 39px; border-radius: 0 8px 8px 0; position: absolute; right: 0; font-size: 18px;}
                                   
  .fa-search{position: absolute; top: 25%; color: #0A0A0A; right: 26px; font-size: 18px; cursor: pointer; }


  
  .login-area{float: right; text-align: center;}
  .login-area a:hover{cursor: pointer; color: white;}
  .login-area a{color: #B6B6B6; font-size: 14px; padding-right: 35px; padding-left: 35px;
                display: block; border-right: 2px solid #B6B6B6; white-space: nowrap; margin-top: 22px;}
  
  .signup-area{float: right; text-align: center;}
  .signup-area a:hover{cursor: pointer; color: white;}
  .signup-area a{color: #B6B6B6; font-size: 14px; padding-left: 35px; 
                 display: block; padding-right: 60px; white-space: nowrap; margin-top: 22px;}

/*────────────────────────────────────header────────────────────────────────────*/


/*────────────────────────────────────contents────────────────────────────────────*/
/*★필독★ contents 영역 안이 빌 경우, 푸터가 헤더에 달라붙으니 꼭 컨텐츠 영역을 감싸는 부분은 height:100%를 줄것 */


  
  .content_wrapper{width: 1100px; height: 900px; padding: 30px; margin: 40px 100px 100px 80px;}
  

  
  .search_result{font-size: 35px; font-family: 'Oswald',sans-serif; line-height: 27px; color: white; padding-bottom: 80px;}




  .poster_img{display: block; line-height: 300px; color: white; left:0; right:0;
             width:320px; height: 450px;  text-align: center; float: left; margin-top: 20px;}
  .mov_title{display: block; width: 700px; height: 50px; border-bottom: 2px solid white; font-family: 'Oswald',sans-serif; 
             float: right; margin-top: 50px; padding-left: 20px; font-size: 30px; color: white;}
  .info_detail_1{display: block; width: 190px; height: 300px; float: left; margin-top: 20px; 
                 padding-left: 47px; line-height: 34px; text-align: right; color: white; font-size: 18px;}   

  .info_detail_2{display: block; width: 530px; height: 300px; float: left; margin-top: 20px; 
                 line-height: 34px; text-align: left; color: white; font-size: 18px;} 
                 
  .staricon {width:15px;}
  
  .direc_act{display: block; width: 100%; height: 400px; float: left; margin-top: 10px; background-color: white; padding: 15px;}
  .director_list{color:white;}
  .direc a{color: white;}
  
  .actor_list{color:white;}
  .act a{color: white;}

/*────────────────────────────────────contents────────────────────────────────────*/


/*────────────────────────────────────footer────────────────────────────────────*/

  .footer-wrapper{color: #EDEDED; width: 100%; display: flex; bottom: 0; position: relative;
                  background-color: #0A0A0A; padding: 40px 80px 40px 80px; margin-top: auto;}
  
  .lnb{padding-bottom: 20px; font-size: 18px;}
  
  .btb{line-height: 25px; font-size: 12px;}
  
  .project{width: 260px; float: left; white-space: nowrap; padding-right: 60px;}
  
  .front-end{width: 240px; float: left; white-space: nowrap; padding-right: 60px;}

  .was-data{width: 310px; float: left; white-space: nowrap; padding-right: 60px;}
  
  .back-end{width: 260px; float: left; white-space: nowrap; padding-right: 60px;}
  
  .etc{width: 260px; float: left; white-space: nowrap; padding-right: 60px;}
  
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
<body>

<!-- ===================================== header ===================================== -->
<div class="wrapper">

  <header>
    <div class="header-wrapper">
      <div class="logo">
        <a href="https://google.com">
          <img src="https://github.com/notlelis/img-url/blob/main/norajologo.png?raw=true" width="200px"></a>
      </div>
   
      <div class="autocomplete">
        <form class="search-bar" autocomplete = "off" action= "${pageContext.request.contextPath}/redirect${rq}">
          <input  id ="myInput" name = "id" class="form-search" type="text" placeholder="Search" >
          <input class="btn_search" type="submit">
          <i class="fa fa-search"></i>
        </form> 
      </div> 
    
      <div class="login-area">
        <nav>
          <ul>
            <li><a href="/NORAJO/asset/log_in.jsp">LOGIN</a></li>
          </ul>
        </nav>
      </div>
      
      <div class="signup-area">
        <nav>
          <ul>
            <li><a href="/NORAJO/asset/sign_up.jsp">SIGN UP</a></li>
          </ul>
        </nav>
      </div>
    </div>
  
  
<script>
function autocomplete(inp, arr) {
  /*the autocomplete function takes two arguments,
  the text field element and an array of possible autocompleted values:*/
  var currentFocus;
  /*execute a function when someone writes in the text field:*/
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      /*close any already open lists of autocompleted values*/
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      /*create a DIV element that will contain the items (values):*/
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      /*append the DIV element as a child of the autocomplete container:*/
      this.parentNode.appendChild(a);
      /*for each item in the array...*/
      for (i = 0; i < arr.length; i++) {
        /*check if the item starts with the same letters as the text field value:*/
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          /*create a DIV element for each matching element:*/
          b = document.createElement("DIV");
          /*make the matching letters bold:*/
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
          /*insert a input field that will hold the current array item's value:*/
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          /*execute a function when someone clicks on the item value (DIV element):*/
          b.addEventListener("click", function(e) {
              /*insert the value for the autocomplete text field:*/
              inp.value = this.getElementsByTagName("input")[0].value;
              /*close the list of autocompleted values,
              (or any other open lists of autocompleted values:*/
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  /*execute a function presses a key on the keyboard:*/
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        /*If the arrow DOWN key is pressed,
        increase the currentFocus variable:*/
        currentFocus++;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 38) { //up
        /*If the arrow UP key is pressed,
        decrease the currentFocus variable:*/
        currentFocus--;
        /*and and make the current item more visible:*/
        addActive(x);
      } else if (e.keyCode == 13) {
        /*If the ENTER key is pressed, prevent the form from being submitted,*/
        e.preventDefault();
        if (currentFocus > -1) {
          /*and simulate a click on the "active" item:*/
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    /*a function to classify an item as "active":*/
    if (!x) return false;
    /*start by removing the "active" class on all items:*/
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    /*add class "autocomplete-active":*/
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    /*a function to remove the "active" class from all autocomplete items:*/
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    /*close all autocomplete lists in the document,
    except the one passed as an argument:*/
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  /*execute a function when someone clicks in the document:*/
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}

const aL = ${listAct};
const dL = ${listDir};
const tL = ${listTit};
console.log(aL);
console.log(dL);
console.log(tL);
const champ = [];
for(var i = 0; i < aL.length ;i++ ){
let val = aL[i]["value"];
let key = aL[i]["key"];
let sub = val.substring(1, val.length -1);

champ.push(sub.concat(' ','actor', ' ', key));
}
for(var i = 0; i < dL.length ;i++ ){
let val = dL[i]["value"];
let key = dL[i]["key"];
let sub = val.substring(1, val.length -1);

champ.push(sub.concat(' ','director', ' ', key));
}
for(var i = 0; i < tL.length ; i++){
let val = tL[i]["name"];
let idw = tL[i]["id"];
let id = idw.substring(1, idw.length -1);
let sub = val.substring(1, val.length -1);
champ.push(sub.concat(' ','title', ' ', id));
}



/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), champ);
</script>
    
    
  </header>
  
  <!-- ===================================== header ===================================== -->
  
  
  <!-- ===================================== contents ===================================== -->

  <div class="content_body">.
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
          <td><img class="staricon" src ="https://github.com/hykim-king/NORAJO/blob/main/NORAJO/src/main/webapp/resources/img/redstar.png?raw=true"  alt="Red Star">${movieInfo.getRating()}</td>
        </tr>
        <tr class="country">
          <td>${movieInfo.getCountry()}</td>
        </tr>
        <tr class="runtime">
          <td>${movieInfo.getRuntime()}</td>
        </tr>
      </table>

  <div class="direc_act">
    <table>
    <tr class="director_list">DIRECTOR</tr>
    <c:forEach items= "${dC}" var = "dirCon">
    <br>
    <c:set value = "${dirCon.getValue()}" var="valeur"/>
    <c:set value = "${dirCon.getKey()}" var="cle"/>
    <c:set value ="${pageContext.request.contextPath}/director/${cle}${id}" var = "href"/>
    <a class="direc" href = ${href}>${valeur}</a>
    </c:forEach>
    </table>
    
    <table>
    <tr class="actor_list">ACTOR</tr>
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



  <!-- ===================================== contents ===================================== -->
  
  <!-- ===================================== footer ===================================== -->
  <footer>
    <div class="footer-wrapper">
      <div class="project">
        <p class="lnb">PROJECT NORAJO</p>
          <p class="btb">Jin Seo Kim</p>
          <p class="btb">Hyun Woo Ko</p>
          <p class="btb">Bo Seong Gwon</p>
          <p class="btb">Bo Sun Kim</p>
          <p class="btb">Chae Lynn Yoo</p>
      </div>
    
      <div class="front-end">
        <p class="lnb">FRONT END</p>
          <p class="btb">JAVASCRIPT</p>
          <p class="btb">HTML</p>
          <p class="btb">CSS</p>
          <p class="btb">jQEURY</p>
      </div>
      
      <div class="was-data">
        <p class="lnb">WAS/DATABASE</p>
          <p class="btb">Apache Tomcat</p>
          <p class="btb">ORACLE SQL DEVELOPER</p>
      </div>  
      
      <div class="back-end">
        <p class="lnb">BACK END</p>
          <p class="btb">SPRING</p>
          <p class="btb">JAVA</p>
          <p class="btb">MyBatis</p>
      </div>  
      
      <div class="etc">
        <p class="lnb">ETC</p>
          <p class="btb">Slack</p>
          <p class="btb">Github</p>
          <p class="btb">Zoom</p>
          <p class="btb">KakaoTalk</p>
      </div>  
      
      <div class="contact-line">
        <p class="lnb" style="font-size: 18px">CONTACT</p>
          <p class="btb">E-Mail : korea@norajo.com</p>
          <p class="btb">Address : 53, Yangsan-ro, Yeongdeungpo-gu, Seoul, Republic of Korea</p>
          <p class="btb">Copyright © 2021 NORAJO Corp. All rights reserved.</p>
      </div>  
    </div>
  </footer>
  
</div>
  <!-- ===================================== footer ===================================== -->

</body>
</html>
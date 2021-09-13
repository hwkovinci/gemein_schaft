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
  body{font-size:1.125em; line-height: 1.6;}
  * {margin: 0; padding: 0; border: 0; vertical-align: baseline; box-sizing: border-box;
     background: transparent; font-style: normal;}
  li{list-style: none;}
  a{text-decoration: none;}
  .wrapper{display: flex; height: 100%; min-height: 100vh; flex-direction: column; margin: 0 auto;}
  
	
  .header-wrapper{width: 100%; height: 110px; background-color: #0A0A0A; position: fixed;
                  padding: 20px 80px 20px 80px; display: flex; z-index: 99999; border-top: 6px solid white;}

  .logo{padding-right: 200px; padding-top: 2px; flex: 1;}


  ::-webkit-input-placeholder{color: gray;}
  ::-moz-placeholder{color: gray;}
  ::-ms-input-placeholder{color: gray;}

  .autocomplete{padding-top: 12px; justify-content: center; align-items: center; width: 70%;}
  .search-bar{width: 90%; position: relative; min-width: 200px; border: 2px solid #3A3D42; border-radius: 11px;}
  
  .search-bar input[type="text"]{width: 100%; padding: 10px; padding-right: 60px; box-sizing: border-box; color: white;
                                 background-color: #3A3D42; border: 2px solid #3A3D42; border-radius: 8px; outline: none;}      
                                     
  .search-bar input[type="submit"]{background-color: #0A0A0A; color: #0A0A0A; cursor: pointer; 
                                   width: 80px; height: 39px; border-radius: 0 8px 8px 0; position: absolute; right: 0; font-size: 18px;}
                                   
  .fa-search{position: absolute; top: 25%; color: white; right: 30px; font-size: 18px;}


  
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


	#main_skel{
	 margin-top: 120px;
	 margin-bottom: 100px;
	}
	
	.genre_block{
	

	}
	
	
	.genre_title{
	     font-size : 50px;
	     font-weight :bold;
	     margin-left : 50px; 	
	}
	
	.genre_movie_info{
	
	  display:flex;
	  margin:10px;
	  text-align: center;
	}

    .movie_info_block{
      margin: 30px;
      
    
    }
    
    .post_img{
      display: block; width:320px; height: 450px; left:0; right:0; margin: 0px auto;
    
    }
    
    .ranking{
      position:absolute; top:17px; left:0; width:50px; height:50px; line-height:50px;
      background-color : orange; text-align: center;
    
    }
    .movie_info{
     text-align : center;
    
    }
    .movie_title {
      font-size : 20px;
      font-weight : bold;
      border:1px white;
      width: 320px;
      height : 50px;
      margin-top : 30px;
      word-break : normal;
      
    }
    
    .staricon {
   	  width:15px;
    }
    
    .movie_rating{
  
    }
    
    .movie_year{
    }
    
    
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
<title>NORAJO</title>
</head>
<body>

<!-- ===================================== header ===================================== -->
<div class="wrapper">

	<header>
		<div class="header-wrapper">
		  <div class="logo">
		    <a href="https://google.com">
		      <img src="https://github.com/notlelis/img-url/blob/main/norajologo.png?raw=true" width="190px"></a>
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
	          <li><a href="${pageContext.request.contextPath}/${log}">${log_i}</a></li>
	        </ul>
	      </nav>
	    </div>
	    
	    <div class="signup-area">
	      <nav>
	        <ul>
	          <li><a href="${pageContext.request.contextPath}/${sign}">${sign_i}</a></li>
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

const aL = ${actorList};
const dL = ${directorList};
const tL = ${titleList};
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
	<!-- main genre -->
	<div id="main_skel">
		<c:forEach items="${poster}" var="genre">
			<div class="genre_block">
				<div class="genre_title" >
					${genre.key}
				</div>
				<div class="genre_movie_info">
				<c:forEach items="${genre.value}" var="tranche" varStatus="i">
					<div class="movie_info_block">
						<c:set value="sixieme_?want=${tranche.getId().substring(1, 10)}${req}" var="href" /> 
	                    <p class="ranking">${i.count}</P>					
						<a href=${href}><image src=${tranche.getPoster() } alt="desk" class="post_img"></a> 
						   <div class = "movie_info">
						    <div class = "movie_title"> ${tranche.getName()}</div>
							<div class = "movie_rating"><br><img class="staricon" src ="https://github.com/hykim-king/NORAJO/blob/main/NORAJO/src/main/webapp/resources/img/redstar.png?raw=true"  alt="Red Star">${tranche.getRating()}</div> 
							<div class = "movie_year">${tranche.getYear()}</div>
						   </div>
						</p>
					</div>							
				</c:forEach>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- main genre end -->
	


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
	
</div>
  <!-- ===================================== footer ===================================== -->

</body>
</html>

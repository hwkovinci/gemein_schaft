<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- ===================================== CSS ===================================== -->
  <style>
  

/*────────────────────────────────────header────────────────────────────────────*/


* {
  box-sizing: border-box;
}

body {
  font: 16px Arial;  
}

/*the container must be positioned relative:*/
.autocomplete {
  position: relative;
  display: inline-block;
}


input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}

input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
}

input[type=submit] {
  background-color: DodgerBlue;
  color: #fff;
  cursor: pointer;
}

.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

/*when hovering an item:*/
.autocomplete-items div:hover {
  background-color: #e9e9e9; 
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}

  
/*────────────────────────────────────header────────────────────────────────────*/


/*────────────────────────────────────category────────────────────────────────────*/  

  /* padding-top으로 상단 위치 조정*/
  .dropdown-wrapper {padding-top: 95px; margin: 0;}
  
  /* 마진 패딩 지정하지 않으면 브라우저 기본 스타일을 따라 설정되므로 오버라이딩 필요 */
  nav ul {width: 100%; background-color: #1B1B1B; list-style-type: none; 
          margin: 0; padding: 0; text-align: center;}
  
  /* li 는 블록요소인데 inline-block 으로 인라인속성 부여해서 나란히 배치 */
  nav ul li {display: inline-block;}
  .dropdown {position: relative; width: 220px; margin: 0 40px;}
  .dropdown-menu {color: white; padding: 16px; font-size: 14px; cursor: pointer;}
  .dropdown-content a:hover {background-color: #f1f1f1}
   /* dropdown-menu 에는 hover 적용이 안됨 */
  .dropdown-menu:hover:not(.home) {background-color: #FFA800;color: white;}
  
  .home {font-size: 14px; cursor: pointer; width: 100px; text-align: center; width: 220px; margin: 0 40px;}
  .home a {display: block; text-decoration: none;color: white; padding: 16px 16px;}
  .home a:hover {background-color: #FFA800}
  
  
/*────────────────────────────────────category────────────────────────────────────*/


/*────────────────────────────────────content────────────────────────────────────*/
  
  /* contents의 내용이 들어갈 부분을 나타내기 위해 border로 상자 만들어둠*/
  .content_wrapper{background-color: black; width: 1170px; margin: 0 auto; 
                border-left: 1px solid white; border-right: 1px solid white;
                border-top: 1px solid white; border-bottom: 1px solid white;}
                
/*────────────────────────────────────content────────────────────────────────────*/


/*────────────────────────────────────footer────────────────────────────────────*/

  footer{height: 80px; background-color: #1B1B1B; border-top: 2px solid #232323; 
         width: 100%; text-align: center; color: #B6B6B6; padding: 10px;}
  .footer-country{font-size: 3.0 rem; font-weight: bold;}
  .copy-text{font-size: 2px; padding: 8px;}
  
/*────────────────────────────────────footer────────────────────────────────────*/
  
  </style>
<!-- ===================================== CSS ===================================== -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/favicon1.png">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
<title>Norajo</title>
</head>
<body>
<!-- ===================================== header ===================================== --> 
  <header>
<form autocomplete = "off" action= "${pageContext.request.contextPath}/redirect">
   <div class="autocomplete" style="width:300px;">
   <input  id ="myInput" name = "id" type="text" placeholder="Search" >
   </div>
   <input type="submit">
    
</form>
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


<!-- ===================================== category ===================================== --> 
  <nav>
    <ul class="dropdown-wrapper">
    <li class="home"><a href="https://google.com">HOME</a></li>
      <li class="dropdown">
        <div class="dropdown-menu">DIRECTOR</div>
<c:forEach items ="${aL}" var ="aL">
<br>${aL.getValue()}          
</c:forEach>
</li>
      <li class="dropdown">
        <div  class="dropdown-menu">ACTOR</div>
 <c:forEach items ="${dL}" var ="dL">
<br>${dL.getValue()}          
</c:forEach>     


</li>
      <li class="dropdown">
        <div id = “genre” class="dropdown-menu">GENRE</div>
      </li>
    </ul>
  </nav>
<!-- ===================================== category ===================================== -->


<!-- ===================================== contents ===================================== --> 


<c:forEach items="${poster}" var="genre">
<div class="content_wrapper">

<tr>${genre.key}</tr>
<c:forEach items="${genre.value}" var = "tranche">

<br><c:set value = "sixieme_?want=${tranche.getId().substring(1, 10)}" var = "href"/>
<a href = ${href}><image src = ${tranche.getPoster()} alt = "image" sizes="(min-width: 600px) 200px, 50vw" ></a>
<br>${tranche.getName()}
<br>${tranche.getRating()}
<br>${tranche.getYear()}
<br>

</c:forEach> 
</div>  
</c:forEach>    
   
<!-- ===================================== contents ===================================== -->

    
<!-- ===================================== footer ===================================== -->

    <footer>
      <div class="footer-country">PROJECT-NORAJO KOREA</div>
        <div class="copy-text">
          E-Mail : korea@norajo.com<br>
          Address : 53, Yangsan-ro, Yeongdeungpo-gu, Seoul, Republic of Korea<br>
          Copyright © NORAJO Corp. All rights reserved.
        </div>
    </footer> 
    
<!-- ===================================== footer ===================================== -->
</body>
</html>



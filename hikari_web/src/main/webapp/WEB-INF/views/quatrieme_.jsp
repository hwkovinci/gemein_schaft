<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

   <head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
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
</style>

  </head>
<body>
<table><c:forEach items="${timeInfo}" var = "chronologie">
<tbody>${chronologie.key}</tbody><tr>
<c:forEach items="${chronologie.value}" var ="cv">

<c:set value = "${pageContext.request.contextPath}/sixieme_?want=${cv.getId().substring(1, 10)}" var = "href"/>
<a href = ${href} >

<image src = ${cv.getPoster()} alt = "image" sizes="(min-width: 600px) 200px, 50vw">
</a>
<td>${cv.getName()}</td>
<td>${cv.getRating()}</td>
<td>${cv.getYear()}</td>
<td>${cv.getReleased()}</td>
<td>${cv.getRuntime()}</td>
<td>${cv.getPlot()}</td>
<td>${cv.getCountry()}</td>

</c:forEach>

</tr></c:forEach>
</table>
<p>you might also looking for
<tr>
<c:forEach items='${dC}' var = '${dirCon}'>
<c:set value = "${dirCon.getValue()}" var="${valeur}">
<c:set value = "${dirCon.getKey()}" var="${cle}">
<c:set value ="${pageContext.request.contextPath}/redirect?id=${valeur}.substring(1, ${valeur}.length()-1) director ${cle}" var = "${href}">
<a href = ${href}>${valuer}.substirng(1, ${valeur}.length -1)</a>
</c:forEach></tr></p>
<p2>who's in there
<tr>
<c:forEach items='${tC}' var = '${titCon}'>
<c:set value = "${titCon.getName()}" var="${valeur}">
<c:set value = "${titCon.getId()}" var="${cle}">
<c:set value ="${pageContext.request.contextPath}/redirect?id=${valeur}.substring(1, ${valeur}.length()-1) title ${cle}.substring{1, ${cle}.length()-1}" var = "${href}"
<a href = ${href}>${valuer}.substirng(1, ${valeur}.length -1)</a>
</c:forEach></tr></p2>
</body>

<tbody>

<h2>Autocomplete</h2>

<p>Start typing:</p>

<!--Make sure the form has the autocomplete function switched off:-->
<form autocomplete="off" action="${pageContext.request.contextPath}/redirect">
  <div class="autocomplete" style="width:300px;">
    <input id="myInput" type="text" name="id" placeholder="bien venu">
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

/*An array containing all the country names in the world:*/
const lD = ${listDir};
const lT = ${listTit};
console.log(lD);
console.log(lT);
const champ = [];
for(var i = 0; i < lD.length ;i++ ){
let val = lD[i]["value"];
let key = lD[i]["key"];
let sub = val.substring(1, val.length -1);

champ.push(sub.concat(' ','director', ' ', key));
}
for(var i = 0; i < lT.length ; i++){
let val = lT[i]["name"];
let idw = lT[i]["id"];
let id = idw.substring(1, idw.length -1);
let sub = val.substring(1, val.length -1);
champ.push(sub.concat(' ','title', ' ', id));
}

/*initiate the autocomplete function on the "myInput" element, and pass along the countries array as possible autocomplete values:*/
autocomplete(document.getElementById("myInput"), champ);
</script>

</tbody>

</html>
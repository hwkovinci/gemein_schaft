<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* 레이아웃 */
html {
    height: 100%;
}

body {
    background: black;
    text-decoration: none;
    font-size: 14px;
    color: white;
    text-align: center;
    vertical-align: middle;
    align-items: center;
}

.inner {
    position: absolute;
    top: 50%;
    left: 50%;
    margin-left: -300px;
    margin-top: -100px; 
    width: 600px;
    height: 200px;
}

.inner_inner {
    position: relative;
    margin: 0 auto;
}

/* 텍스트 상자 */
.text_box {
    text-align: center;
    border: solid 4px #363636;
    border-radius: 8px;
    padding: 80px;
    font-family: 'Oswald',sans-serif;
}

.text_id {
    font-size: 18px;
    margin-bottom: 15px;
}

.text {
    font-size: 15px;
}

.link {
    color: white;
}

.link:hover {
	color: red;
}


</style>
<meta charset="UTF-8">
<link rel="icon" type="image/x-icon" href="https://github.com/notlelis/img-url/blob/main/favicon1.png?raw=true">
<title>NORAJO</title>
</head>
<body>
    <div class="inner">        
       <div class="inner_inner">
       
        <div class="text_box">
            <div class="text_id">
                <span>Your ID is </span>
                <!-- !!!!!!!!!!!!!!!!!이 부분 확인하기!!!!!!!!!!!!!! -->
                <span>${nick}.</span>
            </div>
            
            <div class="text">
                <span>Do you want to log in?</span>
                <span class="link">
                    <a href="http://localhost:8080/hikari_web/login">Log in here</a>
                </span>
            </div> 
            
            <div class="text">
                <span>Did you forget your password?</span>
                <span class="link">
                    <a href="http://localhost:8080/hikari_web/trouver">Find Password</a>
                </span>
            </div> 
            
         </div>              
       </div>            
    </div>

</body>
</html>
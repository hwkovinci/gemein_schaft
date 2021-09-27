<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
/* 레이아웃 */
html {
    height: 100%;
}

body {
  margin: 0;
  height: 100%;
  background: black;
  text-decoration: none;
  font-size: 18px;
  color: white;
  font-family: 'Roboto Condensed', sans-serif;
}


#header {
    padding-top: 62px;
    padding-bottom: 20px;
    text-align: center;
}

.logo{
    text-align: center;
    width: 50px;
    height: 100px;
}

#wrapper {
    position: relative;
    height: 100%;
}

#content {
    position: absolute;
    left: 50%;
    transform: translate(-50%);
    width: 460px;
}


/* 입력폼 */
h3 {
    margin: 19px 0 8px;
    font-weight: lighter;
}

.box {
    display: block;
    width: 100%;
    height: 40px;
    border: solid 2px #363636;
    border-radius: 4px;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: white;
    position: relative;
    color: black;    
}

.email_box {
    width: 100%;  
}

.pw {
    display: block;
    width: 100%;
    height: 40px;
    border: solid 2px #363636;
    border-radius: 4px;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: white;
    position: relative;
    color: black;    
}


#email {
    display: inline-block;
    width: 213px;
    height: 40px;
    border: solid 2px #363636;
    border-radius: 4px;
    padding: 10px 14px 10px 14px; 
    box-sizing: border-box;
    background: white;
    position: relative;
    color: black;    
}

#domain {
    display: inline-block;
    width: 224.5px;
    height: 40px;
    border: solid 2px #363636;
    border-radius: 4px;
    padding: 10px 14px 10px 14px; 
    padding-left : 10px;
    box-sizing: border-box;
    background: white;
    position: relative;
    color: black; 
    
}


/* 버튼 */
.btn_join {
    margin: 30px 0 91px;
}

#btn_join {
    width: 100%;
    height: 50px;
    border: 0;
    color: white;
    font-size: 18px;
    cursor: pointer;
    background-color: #363636;
    font-size: 400;
    border-radius: 8px;
}

#btn_join:hover {
    background-color: #BA0003;
    transition: 0.5s;
}

.under_btn {
    font-size: 15px;
    display: block;
    position: relative;
    top: -80px;
    margin: 0;
    width: 100%;
    height: 50px;
    border: none;
}

#btn_append {
    float: left; 
}

a {
	color: #B6B6B6;
	text-decoration: none;
	font-size: 14px;
}

a:hover {
	color: white;
	transition : 0.5s;
}

</style>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon" href="https://github.com/notlelis/img-url/blob/main/favicon1.png?raw=true">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">

<link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;400&display=swap" rel="stylesheet">
<title>NORAJO</title>
</head>
<body>


    <!-- header -->
    <!-- !!로고 이미지 안나옴 -->
    <div id = "header">
        <a href="http://localhost:8080/hikari_web/deuxieme_" title="메인 페이지로 돌아가기">
          <img class="logo" src="https://github.com/chaelynn1028/PCWK_MARKDOWN/blob/main/logowhite.png?raw=true" alt="logo">
        </a>    
    </div>
    
    
    <!-- wrapper -->
    <div id="wrapper">   
    
    <!-- content -->
    <div id="content">
    
    <!-- !! action에 회원 정보가 보내질 url 또는 서버 입력하기 --> 
   <form:form action="${pageContext.request.contextPath}/entryProcess" modelAttribute="userPrelude" method='post'>
        
        <!-- ID -->
        <div>
            <h3 class="title">
                <form:label path="nick">ID</form:label>
            </h3>
            <span class="box_id">
                <form:input type="text" path="nick"  class="box" maxlength="30" required="required"/>
            </span>
            <span class="error_next_box"></span>
        </div>

        
        
       <!-- Password 01 -->
        <div>
            <h3 class="title">
                <form:label path="passWd">Password</form:label>
            </h3>
            <span class="box_pw01">
                <form:input type="password" path="passWd" id="password_1"  class="box" maxlength="30" required="required"/>
            </span>
        </div>
        
        
        <!-- Password 02 -->
        <div>
            <h3 class="title">
                
                 <form:label path="pwVrf">Re-enter password</form:label>
            </h3>
            <span class="box_pw02">
              <form:input type="password" path="pwVrf" id="password_2"  class="pw" maxlength="20" required="required"/>
             
                <span class="match" id="alert-success" style="display: none; color: white;">Passwords match.</span>
                <span class="match" id="alert-danger" style="display: none; color: red; font-weight: bold; ">
                Passwords do not match.</span>
                </span>
        </div>
        
        <script>
    //비밀번호 재확인 일치 불일치 확인
    $('.pw').focusout(function () {
        var pwd1 = $("#password_1").val();
        var pwd2 = $("#password_2").val();
  
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                alert("Passwords do not match. Please reconfirm your password.");
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        }
    });

</script>
        
        <!-- Name -->
        <div>
            <h3 class="title">
               
                <form:label path="name">Name</form:label>      
            </h3>
            <span class="box_name">
           
                  <form:input type="text" path="name"  class="box" maxlength="20" required="required"/>
            </span>
            <span class="error_next_box"></span>
        </div>
        
        
        <!-- Email -->
        <div>
            <h3 class="title">
                
                <form:label path="pref">Email</form:label> 
            </h3>
            <span class="email_box">
              <form:input type="text" id="email" path="pref"  class="box" maxlength="48" required="required"/>
              
                <span>@</span>
                  <form:input  path="suf"  id="domain" name="domain" list="domains" placeholder="Enter/select domain" required="required"/>
               
                    <datalist id="domains">
                        <option value="gmail.com">
                        <option value="naver.com">
                        <option value="daum.com">                     
                    </datalist> 
            </span>
        </div>
        
        
        <!-- Join Button -->
        <div class="btn_join">
            <input type="submit" id="btn_join" name="join" value = "CREATE YOUR ACCOUNT" />            
            </button>         
        </div>
        
        
        <div class="under_btn">             
        <!-- Already have an account? -->
        <div id="btn_append">
            <label for="already">Already have an account?</label>
            <span class="login_here">
                <a href="http://localhost:8080/hikari_web/login">&nbsp;LOG IN HERE</a>
            </span>
        </div>
        <br>
        <div id="btn_append">
            <label for="find">Forgot ID or password?</label>
            <span class="find_here">
                <a href="http://localhost:8080/hikari_web/trouver">&nbsp;FIND IN HERE</a>
            </span>
        </div>
        
       
         
        </div>
             
  </form:form>  
    </div>           
    </div>

</body>
</html>
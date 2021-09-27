<%--
/**
    Class Name: member_mng.jsp
    Description: 회원관리
    Modification information
    
    수정일     수정자      수정내용
    -----   -----  -------------------------------------------
    2021.9.10.        최초작성 
    
    author eclass 개발팀
    since 2021.05.24
    Copyright (C) by KandJang All right reserved.
*/
 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* 로고 */
#header {
    padding-top: 62px;
    padding-bottom: 62px;
    text-align: center;
}

body{font-family: 'Roboto Condensed', sans-serif;}

.logo{
    text-align: center;
    width: 50px;
    height: 100px;
}

a {
	color: white;
	text-decoration: none;
}

input {
	-webkit-writing-mode: horizontal-tb !important;
	text-rendering: auto;
	color: black;
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	-webkit-appearance: textfield;
	background-color: white;
	-webkit-rtl-ordering: logical;
	cursor: text;
	margin: 0em;
	font: 400 13.3333px;
	padding: 1px 0px;
	border-width: 2px;
	border-style: solid;
	border-color: #363636;
	border-image: initial;
}

.inner_login {
	position: absolute;
	left: 50%;
	top: 50%;
	margin: -145px 0 0 -160px;
}

.login_norajo {
	position: relative;
	width: 320px;
	margin: 0 auto;
}

.screen_out {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
	line-height: 0;
	text-indent: -9999px;
}

body{
    font-size: 18px;
    line-height: 1.5;
    -webkit-font-smoothing: antialiased;
    background: black;
}

button, input {
	font-size: 18px;
	line-height: 1.5;
	color: white;
	-webkit-font-smoothing: antialiased;
}

fieldset, img {
	border: 0;
}

.login_norajo .box_login {
	margin: 35px 0 0;
	border: 3px solid #363636;
	border-radius: 8px;
	background-color: white;
	box-sizing: border-box;
	color: black;
}

.login_norajo .inp_text {
	position: relative;
	width: 100%;
	margin: 0;
	padding: 15px 19px 15px;
	box-sizing: border-box;
	color: black;
}

.login_norajo .inp_text+.inp_text {
	border-top: 2px solid #363636;
}

.inp_text input {
	display: block;
	width: 100%;
	height: 100%;
	font-size: 18px;
	color: black;
	border: none;
	outline: 0;
	-webkit-appearance: none;
	background-color: transparent;
}

.btn_login {
	margin: 20px 0 0;
	width: 100%;
	height: 48px;
	font-size: 18px;
	color: white;
	background-color: #363636;
	border: 0;
	border-radius: 8px;
}

.btn_login:hover {
    background: #BA0003;
    transition: 0.5s;
}

.login_append {
	overflow: hidden;
	padding: 15px 0 0;
	font-size: 18px;
}

.inp_chk {
	display: inline-block;
	position: relative;
	margin-bottom: -1px;
}

.login_append .inp_chk {
	float: left;
}

.inp_chk .inp_radio {
	position: absolute;
	z-index: -1;
	top: 0;
	left: 0;
	width: 18px;
	height: 18px;
	border: 0;
}

.inp_chk .lab_g {
	display: inline-block;
	margin-right: 19px;
	color: white;
	font-size: 18px;
	line-height: 19px;
	vertical-align: top;
}

.inp_chk .ico_check {
	display: inline-block;
	width: 18px;
	height: 18px;
	margin: 1px 4px 0 0;
	background-position: -60px 0;
}

.inp_chk .txt_lab {
	vertical-align: top;
}

#btn_signup {
    float: left;
}

.txt_find {
    float: right;
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
    <div id = "header">
        <!-- 로고 이미지 안나옴 -->
        <a href="http://localhost:8080/hikari_web/deuxieme_" title="메인 페이지로 돌아가기">
            <img class="logo" src="https://github.com/chaelynn1028/PCWK_MARKDOWN/blob/main/logowhite.png?raw=true" alt="logo">
        </a>
    </div>
    
<form:form action="${pageContext.request.contextPath}/loginAuth" modelAttribute="userBasic" method='post'>

	<div class="inner_login">
		<div class="login_norajo">

			<form method="post" id="authForm" action="login_page_url">

				<fieldset>
					<legend class="screen_out">로그인 정보 입력폼</legend>
					<div class="box_login">
						<div class="inp_text">
							<form:label path="nick" for="loginId" class="screen_out">아이디</form:label> <form:input path="nick"
								type="text" id="loginId" name="loginId" placeholder="ID" maxlength="30" required="required"/>
						</div>
						<div class="inp_text">
							<form:label path="passWd" for="loginPw" class="screen_out">비밀번호</form:label> <form:input path="passWd"
								type="password" id="loginPw" name="password"
								placeholder="Password" maxlength="20" required="required"/>
						</div>
					</div>
</form:form>

					<button type="submit" class="btn_login">LOG IN</button>
					
			
					
					<div class="login_append">
					<!-- Sign up -->
                        <div id="btn_signup" style="display: inline-block;">                   
                            <span class="signUp">
                            <a href="http://localhost:8080/hikari_web/signup">Sign up here</a>
                            </span>
                        </div> 
						
						<span class="txt_find"> <a href="http://localhost:8080/hikari_web/trouver"
							class="link_find">Find ID/Password</a>
						</span>
					</div>

				</fieldset>
			</form>

		</div>
	</div>
</body>
</html>
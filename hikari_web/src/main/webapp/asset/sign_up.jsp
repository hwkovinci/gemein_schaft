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
	margin: 0;
    height: 100%;
	background: black;
	text-decoration: none;
	font-size: 14px;
	color: white;
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
    border: solid 2px #FFA800;
    border-radius: 4px;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: #363636;
    position: relative;
    color: white;    
}

.email_box {
    width: 100%;  
}

#email {
    display: table-cell;
    width: 217px;
    height: 40px;
    border: solid 2px #FFA800;
    border-radius: 4px;
    padding: 10px 14px 10px 14px; 
    box-sizing: border-box;
    background: #363636;
    position: relative;
    color: white;    
}

#domain {
    display: table-cell;
    width: 217px;
    height: 40px;
    border: solid 2px #FFA800;
    border-radius: 4px;
    padding: 10px 14px 10px 14px; 
    padding-left : 10px;
    box-sizing: border-box;
    background: #363636;
    position: relative;
    color: white; 
    
}


/* 버튼 */
.btn_join {
    margin: 30px 0 91px;
}

#btn_join {
    width: 100%;
    height: 50px;
    border: 0;
    color: black;
    font-size: 15px;
    cursor: pointer;
    background-color: #FFA800;
    font-size: 400;
}

.under_btn {
    font-size: 12px;
    display: block;
    position: relative;
    top: -80px;
    margin: 0;
    width: 100%;
    height: 50px;
}

#btn_already {
    float: left; 
}


</style>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
<form:form action="${pageContext.request.contextPath}/entryProcess" modelAttribute="userPlus" method='post'>



    <!-- header -->
    <!-- !!로고 이미지 안나옴 -->
    <div id = "header">
        <a href="main_page_url" title="메인 페이지로 돌아가기"></a>    
    </div>
    
    
    <!-- wrapper -->
    <div id="wrapper">   
    
    <!-- content -->
    <div id="content">
    
    <!-- !! action에 회원 정보가 보내질 url 또는 서버 입력하기 --> 
    <form name="registerForm" method="post" enctype="multipart/form-data" action="./register">
        
        <!-- ID -->
        <div>
            <h3 class="title">
                <label for="id">ID</label>
            </h3>
            <span class="box_id">
                <input type="text" id="id" class="box" maxlength="30" required="required">
            </span>
            <span class="error_next_box"></span>
        </div>
        
        
        <!-- Password 01 -->
        <div>
            <h3 class="title">
                <label for="pw01">Password</label>
            </h3>
            <span class="box_pw01">
                <input type="password" id="pw01" class="box" maxlength="20" required="required">
            </span>
            <span class="error_next_box"></span>
        </div>
        
        
        <!-- Password 02 -->
        <div>
            <h3 class="title">
                <label for="pw02">Re-enter password</label>
            </h3>
            <span class="box_pw02">
                <input type="password" id="pw02" class="box" maxlength="20" required="required">
            </span>
            <span class="error_next_box"></span>
        </div>
        
        
        <!-- Name -->
        <div>
            <h3 class="title">
                <label for="name">Name</label>       
            </h3>
            <span class="box_name">
                <input type="text" id="name" class="box" maxlength="20" required="required">
            </span>
            <span class="error_next_box"></span>
        </div>
        
        
        <!-- Email -->
        <div>
            <h3 class="title">
                <label for="email">Email</label>
            </h3>
            <span class="email_box">
                <input type="text" id="email" class="box" maxlength="48" required="required">
                <span>@</span>
                <input id="domain" name="domain" list="domains" placeholder="Enter/select domain" required="required">
                    <datalist id="domains">
                        <option value="gmail.com">
                        <option value="naver.com">
                        <option value="daum.com">                     
                    </datalist> 
            </span>
            <span class="error_next_box"></span>
        </div>
        
        
        <!-- Join Button -->
        <div class="btn_join">
            <button type="submit" id="btn_join">
                <span>CREATE YOUR ACCOUNT</span>
            </button>
        </div>
        
        <div class="under_btn">      
        
        <!-- Already have an account? -->
        <div id="btn_already" style="display: inline-block;">
            <label for="already">Already have an account?</label>
            <span class="login_here">
                <a href="http://localhost:8080/ehr/asset_chaelynn_folder/log_in.jsp">LOG IN HERE</a>
            </span>
        </div> 
        </div>
             
	</form>
    </div>           
    </div>

</form:form>   
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* Layout */
body {
    background: black;
    text-decoration: none;
    font-size: 14px;
    color: white;
    height: 100%;
    
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

.find_inner {
    display: flex;
    left: 50%;
    top: 50%;
    margin: 77px 0 0 -183px;
}

.find_inner_inner {
    
    width: 350px;
    margin: 0 auto;
}

fieldset {
    border: 0;
    width : 500px;
}


/* Contents */
h3 {
    margin-bottom: 10px;
    font-size: 23px;
    text-align: left;
}

label {
	font-size: 18px;
}

.inp_box  {    
    margin: 20px 0 20px 0;
    display: block;
}

.set {
   margin-bottom: 20px; 
}


.box {
	margin-left: 12px;
	width: 83%;
    height: 40px;
    border: solid 2px #363636;
    border-radius: 2px;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: white;
    position: relative;
    color: black;    
}

.box_email01 {
    width: 195.5px;
    height: 40px;
    border: solid 2px #363636;
    border-radius: 2px;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: #white;
    position: relative;
    color: black; 
}

.box_email02 {
    width: 195.5px;
    height: 40px;
    border: solid 2px #363636;
    border-radius: 2px;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: #white;
    position: relative;
    color: black; 
}


.title {
    width: 40px;
    text-align: center;
}

.all_title {
	width: 20px;
	border: red;
}


/* Button */
#btn_join {
	margin: 10px 0 15px 0;
    width: 94%;
    height: 50px;
    background: #363636;
    color: white;
    border: none;
    font-size: 18px;
    border-radius: 8px;
}

#btn_join:hover {
	background: #BA0003;
    transition: 0.5s;
}


</style>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon" href="https://github.com/notlelis/img-url/blob/main/favicon1.png?raw=true">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<title>NORAJO</title>
<script type="text/javascript">

</script>
</head>
<body>

	<!-- header -->
	
    <div id = "header">
        <a href="http://localhost:8080/hikari_web/deuxieme_" title="메인 페이지로 돌아가기">
          <img class="logo" src="https://github.com/chaelynn1028/PCWK_MARKDOWN/blob/main/logowhite.png?raw=true" alt="logo">
        </a>    
    </div>
    
    
    <div class="find_inner">
        <div class="find_inner_inner">
            
            <fieldset> 
                
                <!-- Find Id ------------------------------------------------->   
                <div class="set">          
                <h3>Find ID</h3>  
 <form:form action= "${pageContext.request.contextPath}/findProcess/nick" modelAttribute="userPrelude" method='post'>                               
                <div class="find_Id">
               
                <!-- Name input-->
                <div class="inp_box">
                    <div style="display: inline-block;" class="title">
                        <form:label path="name" for="box_name" ><span class="all_title">Name</span></form:label>
                    </div>
                    <form:input path="name" type="text" class="box" id="box_name" name="box_name" maxlength="30"/>
                </div>
                

                
                
                <!-- email input-->
                <div class="inp_box">
                    <form:label path="pref" for="box_email01" class="title_email"><span class="all_title">e-Mail</span></form:label>
                    <span class="email_box">
                    <form:input path="pref" type="text" class="box_email01" id="box_email01" maxlength="48"/>
                    <span>@</span>
                    <form:input path="suf" class="box_email01"  id="domain" name="domain" list="domains" placeholder="Enter/select domain"/>
                    <datalist id="domains">
                        <option value="gmail.com">
                        <option value="naver.com">
                        <option value="daum.com">                     
                    </datalist> 
                </div>
                
                
                <!-- Find Id Button -->         
                <div class="btn_find">
                       <input type="submit" id="btn_join" value = "Find ID" />
                        
                   
                </div>
</form:form>                
                </div>
                </div>
                <!-- Find Id End ----------------------------------------------->
                
                
                <!-- Find Password ------------------------------------------------>
                <div class="set">
                <h3>Find Password</h3>
 <form:form action= "${pageContext.request.contextPath}/findProcess/pw" modelAttribute="userPrelude" method='post'>                 
                <div class="find_Pw">  
                             
                <!-- Id input -->
                <div class="inp_box">
                    <div style="display: inline-block;" class="title">
                        <form:label for="box_id" path="nick"><span class="all_title">ID</span></form:label>
                    </div>
                    <form:input path="nick" type="text" class="box" id="box_id" name="box_id" maxlength="30"/>
                </div>
                
                
                <!-- email input -->
                <div class="inp_box">
                    <form:label  path="pref" for="box_email02" class="title_email"><span class="all_title">e-Mail</span></form:label>
                     <span class="email_box">
                    <form:input path="pref" type="text" class="box_email02"  id="box_email02" maxlength="48"/>
                    <span>@</span>
                    <form:input   path="suf" class="box_email02"  id="domain" name="domain" list="domains" placeholder="Enter/select domain"/>
                    <datalist id="domains">
                        <option value="gmail.com">
                        <option value="naver.com">
                        <option value="daum.com">                     
                    </datalist> 
                </div> 
                
                
                <!-- Find pw Button -->       
                <div class="btn_find">
                     <input type="submit" id="btn_join" value = "Find Password" />
                    
                    </button>
                </div>
                <!-- Find pw Button End ---------------------------------------------->
                
                </div>
      </form:form>   
                </div> 
                
                
                
                 
            </fieldset>
        </div>  
    </div>
    
</body>
</html>
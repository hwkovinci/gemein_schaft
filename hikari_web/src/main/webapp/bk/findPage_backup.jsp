<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
}

.find_inner {
    position: absolute;
    left: 50%;
    top: 40%;
    margin: -145px 0 0 -160px;
}

.find_inner_inner {
    position: relative;
    width: 320px;
    margin: 0 auto;
}

fieldset {
    border: 0;
}


/* Contents */
h3 {
    margin-bottom: 10px;
    font-family: 'Oswald',sans-serif;
    font-size: 20px;
    text-align: left;
}

.inp_box  {    
    margin-bottom: 10px;
}

.set {
   margin-bottom: 20px; 
}


.box {
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
    width: 37%;
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
    width: 37%;
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


/* Button */
.btn_find {
    width: 288px;
    height: 40px;
    background: #363636;
    color: white;
    font-family: 'Oswald',sans-serif;
    font-size: 15px;
    border: none;
}

.btn_find:hover {
	 background: red;
}

</style>
<meta charset="UTF-8">
<title>?뚯썝?뺣낫 李얘린 ?섏씠吏</title>
<script type="text/javascript">

</script>
</head>
<body>
    
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
                        <form:label path="name" for="box_name" >Name</form:label>
                    </div>
                    <form:input path="name" type="text" class="box" id="box_name" name="box_name" maxlength="30"/>
                </div>
                

                
                
                <!-- email input-->
                <div class="inp_box">
                    <form:label path="pref" for="box_email01" class="title_email">e-Mail</form:label>
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
                    <button type="submit" value="submit" class="btn_find" id="btn_find" onclick="location.href='https://yeoninim.tistory.com/26'">
                         <span>Find ID</span>
                    </button>
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
                        <form:label for="box_id" path="nick">ID</form:label>
                    </div>
                    <form:input path="nick" type="text" class="box" id="box_id" name="box_id" maxlength="30"/>
                </div>
                
                
                <!-- email input -->
                <div class="inp_box">
                    <form:label  path="pref" for="box_email02" class="title_email">e-Mail</form:label>
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
                    <button type="submit" value="Submit" class="btn_find" onclick="location.href='https://yeoninim.tistory.com/26'">
                         <span>Find Password</span>
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
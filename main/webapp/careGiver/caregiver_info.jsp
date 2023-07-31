<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
%>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
      <title>SC 스위트케어 | 일반 본문</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <link rel="stylesheet" href="../assets/css/main.css" />
</head>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>



<body>

<%@ include file="../header.jsp" %>

<!-- One -->
   <section id="One" class="wrapper style3">
      <div class="inner">
         <header class="align-center">
            <p>Eleifend vitae urna</p>
            <h2>Suite Care</h2>
         </header>
      </div>
   </section>

<!-- Two -->
   <section id="two" class="wrapper style2">
      <div class="inner">
         <div class="box">
            <div class="content">
               <header class="align-center">
                  <p>간병인</p>
                  <h2>마이페이지</h2>
               </header>
               <br><br>
               
               
<script>
      
   $(document).on('click', '#addRepre' , function() {
      $("#repreTbody").append("<tr id='repreTr'><td id='repreTd'><input type=text name='repre'></td></tr>")

      var repreCnt = 0;
      $("#repreTr > #repreTd").each(function(){
         repreCnt++;
        });
   
      $("#repreTbody .repre").attr("rowspan", repreCnt);
   });   
      
   $(document).on('click', '#add' , function() {
      $("#qualTbody").append("<tr id='qualTr'><td id='qualTd'><input type=text name='qual'></td></tr>")

      var qualCnt = 0;
      $("#qualTr > #qualTd").each(function(){
         qualCnt++;
        });
   
      $("#qualTbody .qual").attr("rowspan", qualCnt);
   });
   
   function change_pw() {
      window.open("http://localhost:8060/suiteCare/careGiver/Change_pw.jsp", "name(about:blank)", "width=500, height=500");
   }
   
   function validate() {
      
      
   }
   
</script>


   <!-- form 시작 -->
      <c:forEach var="info" items="${info }">
      <form name="infoForm" method=post action=caregiver>

      <div class="form_wrapper">
         <div class="form_row">
            <label for="id">아이디</label>      
            <input type="text" name="id" value="${info.g_id }" disabled>
         </div>   
            
         <div class="form_row">
            <label for="pw">비밀번호</label>
            <input type="password" name="pw" disabled><br>
            <input type="button" value="비밀번호 변경" onclick="change_pw()">
         </div>
         
         <div class="form_row">
            <label for="name">이름</label>
            <input type="text" name="name" value="${info.g_name }">
         </div>
      
         <div class="form_row">
            <label for="gender">성별</label>
            <input type="radio" id="man" name="gender" value="M"<c:if test="${info.g_gender eq 'M' }">checked</c:if>>
            <label for="man">남자</label>
            <input type="radio" id="woman" name="gender" value="W"<c:if test="${info.g_gender eq 'W' }">checked</c:if>>
            <label for="woman">여자</label> <br><br>
         </div>
                  
         <div class="form_row">
            <label for="birth">생년월일</label>
            <input type="text" name="birth" value="${info.g_birth }" disabled>
         </div>
         <div class="form_row">
            <label for="phone" rowspan=2> 휴대폰 </label>
            <input type="text" name="phone" value="${info.g_phone }">
            <input type="checkbox" name="sms_yn" value = "Y" <c:if test="${info.g_sms_yn eq 'Y' }">checked</c:if>>SMS 소식을 수신합니다.
         </div>
         <div class="form_row">
            <label for="email" rowspan=2> 이메일 </label>
            <input type="text" name="email" value="${info.g_email }">
            <input type="checkbox" name="email_yn" value = "Y" <c:if test="${info.g_email_yn eq 'Y' }">checked</c:if>>메일로 소식을 수신합니다.
         </div>
         <div class="form_row">
            <label for="address"> 주소 </label>
            <input type="text" name="address" value="${info.g_address }">
         </div>
         
  		  			
         <c:set var="representatives" value="${fn:split(info.g_representative,'&')}" />
           <div class="form_row">
 	          <c:forEach var="repre" items="${representatives}" varStatus="r">
              <c:if test="${r.index eq 0 }">
               		 <label for="representatives" class="repre" rowspan="${fn:length(representatives)}"> 대표서비스 </label></c:if>
	                 <input type="text" value="${repre }" name="repre"><br>
	                 <c:if test="${r.first}"><input type="button" value="추가" id="addRepre"></c:if>
               </c:forEach>
            </div>
            
            
          <c:set var="qualifications" value="${fn:split(info.g_qualification,'&')}" />
           	<div class="form_row">
 	          <c:forEach var="qual" items="${qualifications}" varStatus="status">
              <c:if test="${status.index eq 0}">
               		 <label for="representatives" class="qual" rowspan="${fn:length(qualifications)}">자격증 </label></c:if>
						<input type="text" value="${qual }" name="qual"><br>
                        <c:if test="${status.first}"><input type="button" value="추가" id="add"></c:if>
               </c:forEach>
            </div>
            
            <div class="form_row">
            	<label for="location">선호지역</label>
            	<select name="location">
                     <c:set var="g_loc" value="${info.g_location}"/>
                     <option value = "1">선택</option>
                     <c:forEach var="loc" items="${location }">
                        <option value="${loc.sido_code }" <c:if test="${loc.sido_code eq g_loc}">selected</c:if>>${loc.sido }</option>
                     </c:forEach>
                  </select>
         	</div> 
            

            <div class="form_row">
            	<label for="signup_date">가입날짜</label>
            	<input type="text" value="${info.g_signup_date }" disabled>
         	</div>   
		</div>
        </form>
        	<div style="text-align: center;" class="form_btn">
                <input type="hidden" name="command" value="update">
                <input class="button special"  type="submit" value="수정" id="validate">
           	</div>
</c:forEach>
</div>
</div>
</section>

      <%@ include file="../footer.jsp"%>
</body>
</html>

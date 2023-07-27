<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약날짜 정하기</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</head>
<body>
<% 
request.setCharacterEncoding("utf-8");
String m_id = (String)session.getAttribute("m_id");
String caretaker_code = (String)session.getAttribute("caretaker_code");
String res_code = (String)session.getAttribute("res_code");
%>

<h3> 예약코드 : <%=res_code %></h3>
<h3> 피간병인 코드 : <%=caretaker_code %></h3>
<br>
<h3> 간병 시간을 선택해주세요 </h3> 
<form action="res_check.jsp" name="resdateForm" method="post" onSubmit="return rescheckForm();">
<p>시작</p>
<p><input type="text" id="startdate" name="startdate"> 

<input type="text" id="starttime" name="starttime" class="form-control" style="width:200px;"></p><br>

<p>종료</p>
<p><input type="text" id="enddate" name="enddate"> 

<input type="text" id="endtime" name="endtime" class="form-control" style="width:200px;"></p><br>

<input type="submit" value="예약하기" >
</form>
</body>
<script>
   $(function() {
       //input을 datepicker로 선언
       $.datepicker.setDefaults({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });     
       
       $("#startdate").datepicker();                    
       $("#enddate").datepicker();
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#startdate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)  
       $('#enddate').datepicker('setDate', '+7D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
       
       $("#starttime, #endtime").timepicker({
	        timeFormat: 'H:mm',
	        interval: 60,
	        minTime: '10',
	        maxTime: '18',
	        startTime: '10:00',
	        dynamic: false,
	        dropdown: true,
	        scrollbar: true        
	    });
       
     
   });
   </script>
   
   <script>
   function rescheckForm() {
	   
		var sdate=document.getElementById("startdate").value;
		var edate=document.getElementById("enddate").value;
		var stime=document.getElementById("starttime").value;
		var etime=document.getElementById("endtime").value;
		
		if(sdate=="" || edate=="" || stime=="" || etime=="") {
			alert("기간/시간을 입력해주세요");
			return false;
		} else if(sdate>edate) {
			alert("시작날짜는 종료날짜보다 클 수 없습니다.");
			return false; 
		} else if(stime>etime) {
			alert("시작시간은 종료시간보다 클 수 없습니다.");
			return false;
		} else {
			return true;
		}
	   
   }
   </script>

</html>
<%@ page import="reservation.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 간병 예약</title>
<%@ include file="/header-import.jsp"%>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="${context}/assets/js/progress.js"></script>

<style>
.res_date {
width: 160px !important;
display: inline !important;
}

.ui-datepicker-year{
display: inline !important;
}

.ui-datepicker-month{
display: inline !important;
}

.ui-datepicker-trigger{
position: relative;
right: 2rem;
top: 2px;
}

.ui-timepicker-trigger{
position: relative;
right: 2.4rem;
cursor: default;
}

.ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover{
border: 1px solid black;
background: #423730;
color: white;
}

.ui-state-highlight, .ui-widget-content .ui-state-highlight, .ui-widget-header .ui-state-highlight{
border: 1px solid #DFD7BF;
background: #DFD7BFaa;
color: black;
}

.ui-menu-item {
width: auto !important;
}
</style>
<script>
function resdstop() {
	alert("예약이 중지되었습니다.");
	window.location.href = "${context}/member/main";
}
</script>
</head>
<body>

	<%@ include file="/header.jsp"%>

	<%
	request.setCharacterEncoding("utf-8");
	String res_code = (String) session.getAttribute("res_code");
	String t_code = (String) session.getAttribute("t_code");
	String r_code = request.getParameter("res_code");
	session.setAttribute("r_code", r_code);
	String caretaker_code = request.getParameter("caretaker_code");
	session.setAttribute("caretaker_code", caretaker_code);
	%>

	<!-- One -->
	<section id="One" class="wrapper style3">
		<div class="inner">
			<header class="align-center">
				<p>Premium Caregiver Matching Platform</p>
				<h2>Suite Care</h2>
			</header>
		</div>
	</section>

	<!-- Two -->
	<section id="two" class="wrapper style2">
	
	<div id="res-progress">
	<ul>
	<li>피간병인 선택</li>
	<li>피간병인 정보 입력</li>
	<li>간병장소 선택</li>
	<li class="active">예약 일시 지정</li>
	<li>빠른매칭 서비스</li>
	</ul>
	</div>
	
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>간병 서비스 예약</p>
						<h2>예약 일시 지정</h2>
					</header>

					<div class="form_wrapper">
						<div class="form_row">
							<label>예약 코드</label> 
							<input type="text" value="<%if(res_code!=null) { %><%=res_code %> <%}
							else if(res_code==null) {%> <%=r_code%> <% }%>" disabled>
						</div>
						<br>
						<form action="../reservation/date" name="resdateForm" method="post" onSubmit="return rescheckForm();">
							<div class="form_row">
								<label>간병 기간</label>
								<div>
									<input type="text" id="startdate" name="startdate" class="res_date" >
									<span style="position: relative; left: -0.4rem;">~</span>
									<input type="text" id="enddate" name="enddate" class="res_date">
								</div>
							</div>

							<div class="form_row">
								<label>간병 시간</label>
								<div>
									<input type="text" id="starttime" name="starttime" class="res_date" placeholder="시작 시간">
									<span class="ui-timepicker-trigger" style="margin-right: -0.7rem;">🕑</span>
									<span style="position: relative; left: -0.4rem;">~</span>
									<input type="text" id="endtime" name="endtime" class="res_date" placeholder="종료 시간">
									<span class="ui-timepicker-trigger">🕑</span>
								</div>
							</div>
							<div class="form_button">
								<input type="hidden" name="type" value="resdate"/>
								 <input type="button" class="button alt" onclick="resdstop();" value="예약 중지">
								<input type="submit" class="button special" value="예약하기">
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</section>
<%@include file="/footer.jsp" %>
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
        ,minDate: "3D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+1y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
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

		var sdate = document.getElementById("startdate").value;
		var edate = document.getElementById("enddate").value;
		var stime = document.getElementById("starttime").value;
		var etime = document.getElementById("endtime").value;

		if (sdate == "" || edate == "" || stime == "" || etime == "") {
			alert("기간/시간을 입력해주세요");
			return false;
		} else if (sdate > edate) {
			alert("시작날짜는 종료날짜보다 클 수 없습니다.");
			return false;
		} else if (stime > etime) {
			alert("시작시간은 종료시간보다 클 수 없습니다.");
			return false;
		} else {
			return true;
		}

	}
	
	
</script>

</html>
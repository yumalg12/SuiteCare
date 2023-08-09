<%@ page import = "patient.*" %>
<%@ page import = "caretaker.*" %>
<%@ page import = "reservation.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.sql.Time" %>
<%@ page import = "java.sql.Date" %>
<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<title>SC 스위트케어 | 일반 본문</title>
		<%@ include file="../header-import.jsp" %>
		<meta charset="utf-8" />
	</head>
	
	<style>
	tr,td{
		text-align: center;
	}
	</style>
	<script>
	
	</script>
	
	<body>
<%@ include file="../header.jsp" %>

	<!-- One -->
			<section id="One" class="wrapper style3">
				<div class="inner">
					<header class="align-center">
						<p>Eleifend vitae urna</p>
						<h2>Generic Page Template</h2>
					</header>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>나와 피간병인의</p>
								<h2>매칭 정보</h2>
							</header>
			<form name="matchinginfo">
			<table border=1>
			<tr><td>이름</td><td>날짜</td><td>시간</td><td>지역</td><td>결제금액</td><td>지급 예정일</td><td>정보</td></tr>
			<%
			request.setCharacterEncoding("utf-8");
			String g_id = (String)session.getAttribute("g_id");
			
			ReservationDAO dao = new ReservationDAO();
			List<ReservationVO> list = dao.resList(g_id);
			for(int i=0; i<list.size(); i++) {
				ReservationVO listvo = (ReservationVO) list.get(i);

				String res_code = listvo.getRes_code();
	            String location = listvo.getLocation();
	            String start_date = listvo.getStart_date();
				String end_date = listvo.getEnd_date();
				String start_time = listvo.getStart_time();
				String end_time = listvo.getEnd_time();
				
				String workDate = start_date.substring(5) + " ~ " + end_date.substring(5);
				String workTimes = start_time.substring(0,5) + " ~ " + end_time.substring(0,5);
				
				String t_name = listvo.getT_name();

        		out.println("<tr><td>" + t_name + "</td><td>" + workDate + "</td><td>" + workTimes + "</td>");
				out.println("<td>" + location + "</td><td>" + "결제금액" + "</td><td>" + "지급예정일" + "</td>");
				out.println("<td><a href='../careGiver/matchingInfo.jsp?res_code=" + res_code +"'>더보기</a></td></tr>");
			}
			%>
			</table> 
			</form>
						</div>
					</div>
				</div>
			</section>
						
							
							
							
		<!-- three -->
			<section id="three" class="wrapper style2">
				<div class="inner">
					<div class="box">
						<div class="content">
							<header class="align-center">
								<p>나에게 들어온</p>
								<h2>피간병인 신청 리스트</h2>
							</header>
			<form name="applinfo">
			<table border=1>
			<tr><td>이름</td><td>성별</td><td>나이</td><td>지역</td><td>날짜</td><td>시간</td><td>정보</td></tr>
			</table>
			</form>
						</div>
					</div>
				</div>
			</section>	
								
<%@ include file="../footer.jsp" %>				
</body>
</html>
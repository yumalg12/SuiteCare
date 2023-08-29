<%@ page import = "patient.*" %>
<%@ page import = "Preference.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>SC 스위트케어 | 빠른매칭서비스</title>
<%@ include file="/header-import.jsp"%>
</head>
<body>
	<%@ include file="../header.jsp" %>
<%
request.setCharacterEncoding("utf-8");
String res_code = request.getParameter("res_code");

String file_repo = "../assets/profile/";
PreferenceDAO pdao = new PreferenceDAO();

Pair<List<PreferenceVO>, List<PreferenceVO>> result = pdao.pMatching(res_code);
List<PreferenceVO> full = result.getFirst();
List<PreferenceVO> part = result.getSecond();

%>
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
						<p> SuiteCare </p>
						<h2>빠른 매칭 리스트</h2>
					</header>
<form name="quickForm">
<table>
	<tr>
	<td></td><td>이름</td><td>성별</td><td>나이</td><td>거주지역</td>
	<td>주활동지역</td><td>주요서비스</td><td>보유자격증</td>
	<td>시급</td><td>비고</td>
	</tr>
	<% for(PreferenceVO fList : full) {
		g_id = fList.getG_id();
		String g_profile = fList.getG_profile();
		String g_name = fList.getG_name();
		String g_gender = fList.getG_gender();
		String g_birth = fList.getG_birth();
		String g_address = fList.getG_address();
		String g_location = fList.getG_location1();
		String g_service1 = fList.getG_service1();
		String g_service2 = fList.getG_service2();
		String g_service3 = fList.getG_service3();
		String qual = fList.getG_qualification();
		String g_hourwage = fList.getG_hourwage1();
		
		String profile = file_repo + g_profile;
		
		int idx = g_address.indexOf(" ");
		 String gaddress = g_address.substring(idx + 1);
		 int fidx = gaddress.indexOf(" ");
		 String address = gaddress.substring(0, fidx);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	   Date birthDate = dateFormat.parse(g_birth);
	    
	    Calendar birthCalendar = Calendar.getInstance();
	   birthCalendar.setTime(birthDate); // 생년월일 Caelendar 객체에 저장
	    
	    Calendar currentCalendar = Calendar.getInstance(); // 현재시간 기준
	    
	    int birthYear = birthCalendar.get(Calendar.YEAR);
	    int currentYear = currentCalendar.get(Calendar.YEAR);
	    
	    int age = currentYear - birthYear; // 나이 계산
	 
	    int birthMonth = birthCalendar.get(Calendar.MONTH);
	    int currentMonth = currentCalendar.get(Calendar.MONTH);
	    
	    int birthDay = birthCalendar.get(Calendar.DAY_OF_MONTH);
	    int currentDay = currentCalendar.get(Calendar.DAY_OF_MONTH);
	    
	 // 생일이 지났는지 체크
	    if (currentMonth < birthMonth || (currentMonth == birthMonth && currentDay < birthDay)) {
	        age--; } // 아직 생일이 지나지 않았으면 나이에서 1을 뺌 
	 %>
	 <tr>
	<td><img src="<%=profile %>" alt="" style="width:150px; height:150px;"/></td>
	<td><%=g_name %>★</td>
	<td><% if(g_gender.equals("W")) { %> 여 <% }else { %> 남 <% } %></td>
	<td><%=age %></td><td><%=address %></td>
	<td><%=g_location %></td>
	<td>1순위 : <%=g_service1 %><br>
		2순위 : <%=g_service2 %><br>
		3순위 : <%=g_service3 %></td>
	<td><%=qual %></td>
	<td><%=g_hourwage %></td>
	<td><a href="./tmatchingApprove.jsp?res_code=<%=res_code%>&g_id=<%=g_id%>&hourwage-<%=g_hourwage%>" class="button alt">매칭신청</a></td>
	</tr>
	 <%
	} for(PreferenceVO pList : part) {
		g_id = pList.getG_id();
		String g_profile = pList.getG_profile();
		String g_name = pList.getG_name();
		String g_gender = pList.getG_gender();
		String g_birth = pList.getG_birth();
		String g_address = pList.getG_address();
		String g_location = pList.getG_location1();
		String g_service1 = pList.getG_service1();
		String g_service2 = pList.getG_service2();
		String g_service3 = pList.getG_service3();
		String qual = pList.getG_qualification();
		String g_hourwage = pList.getG_hourwage1();
		
		String profile = file_repo + g_profile;
		
		int idx = g_address.indexOf(" ");
		 String gaddress = g_address.substring(idx + 1);
		 int fidx = gaddress.indexOf(" ");
		 String address = gaddress.substring(0, fidx);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	   Date birthDate = dateFormat.parse(g_birth);
	    
	    Calendar birthCalendar = Calendar.getInstance();
	   birthCalendar.setTime(birthDate); // 생년월일 Caelendar 객체에 저장
	    
	    Calendar currentCalendar = Calendar.getInstance(); // 현재시간 기준
	    
	    int birthYear = birthCalendar.get(Calendar.YEAR);
	    int currentYear = currentCalendar.get(Calendar.YEAR);
	    
	    int age = currentYear - birthYear; // 나이 계산
	 
	    int birthMonth = birthCalendar.get(Calendar.MONTH);
	    int currentMonth = currentCalendar.get(Calendar.MONTH);
	    
	    int birthDay = birthCalendar.get(Calendar.DAY_OF_MONTH);
	    int currentDay = currentCalendar.get(Calendar.DAY_OF_MONTH);
	    
	 // 생일이 지났는지 체크
	    if (currentMonth < birthMonth || (currentMonth == birthMonth && currentDay < birthDay)) {
	        age--; } // 아직 생일이 지나지 않았으면 나이에서 1을 뺌 
	 %>
	 <tr>
	<td><img src="<%=profile %>" alt="" style="width:150px; height:150px;"/></td>
	<td><%=g_name %></td>
	<td><% if(g_gender.equals("W")) { %> 여 <% }else { %> 남 <% } %></td>
	<td><%=age %></td><td><%=address %></td>
	<td><%=g_location %></td>
	<td>1순위 : <%=g_service1 %><br>
		2순위 : <%=g_service2 %><br>
		3순위 : <%=g_service3 %></td>
	<td><%=qual %></td>
	<td><%=g_hourwage %></td>
	<td><a href="./tmatchingApprove.jsp?res_code=<%=res_code%>&g_id=<%=g_id%>&hourwage-<%=g_hourwage%>" class="button alt">매칭신청</a></td>
	</tr>
	 <%
	}
		%>

		</table>
</form>
</body>
</html>
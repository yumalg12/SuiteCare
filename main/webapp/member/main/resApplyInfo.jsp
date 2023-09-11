<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="patient.*"%>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.Time"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	int applyCnt = 0;
	int aPages = 0;
	applyCnt = pdao.listresCnt(m_id);
	if(applyCnt%perPage == 0) {
		aPages = applyCnt/perPage;
	} else {
		aPages = applyCnt/perPage + 1;
	}
%>
	<div id='restable' class="table_wrapper">
		<form name="resinfo">
			<table>
				<thead>
					<tr>
						<td>예약코드</td>
						<td>이름</td>
						<td>피간병인<br>상세정보</td>
						<td>간병장소</td>
						<td>주소</td>
						<td>간병일시</td>
						<td>매칭서비스<br>정보</td>
						<td>간병인</td>
						<td>비고</td>
					</tr>
				</thead>
				<%

			List<PatientresVO> reslistApply = pdao.listres(m_id, (aPageCurrent-1)*perPage);
			for (int i = 0; i < reslistApply.size(); i++) {
				PatientresVO listvo = (PatientresVO) reslistApply.get(i);

				String t_name = listvo.getCaretaker();
				Date start_date = listvo.getStartdate();
				Date end_date = listvo.getEnddate();
				Time start_time = listvo.getStarttime();
				Time end_time = listvo.getEndtime();
				String caregiver = listvo.getCaregiver();
				String res_code = listvo.getRes_code();
				String caretaker_code = listvo.getCaretaker_code();
				String location = listvo.getLocation();
				String addr = listvo.getAddr();
				String detail_addr = listvo.getDetail_addr();
				
				
				SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
				
			      String fStartTime = (start_time != null) ? timeFormat.format(start_time) : "";
		            String fEndTime = (end_time != null) ? timeFormat.format(end_time) : "";
		            
				String workTimes = fStartTime + "~" + fEndTime;
				
				java.sql.Date sqlStartDate = new java.sql.Date(start_date.getTime());
			    
				java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
	           
				
			%>

			<tr>
				<td><%=res_code%></td> <td><%=t_name%></td> 
				<td><button onclick="openDetailPopup('<%=res_code %>')">더보기</button></td>
				
				<td>
				<%if(location.equals("home")) {%>자택<%} 
				else { %><%=location%><%} %></td>
				
				<td><%=addr%> <%if(detail_addr!=null) {%><br><%=detail_addr%><%} %></td> 
				
				<td>
				<%=start_date%><br>~ <%=end_date %><br>(<%=workTimes%>)
				
				<td><%
				List<TpreferenceVO> preList = pdao.listtpre(res_code);
				for(TpreferenceVO prevo : preList) {
					String pre_age_1 = prevo.getPre_age_1();
					
					if(pre_age_1!=null){%><button onclick="openmatPopup('<%=res_code %>')">더보기</button>
					<%} else { %> 
						<a href="../reservation/match?res_code=<%=res_code%>">미작성</a>
					<% }%></td>
					
				<td>
				<%if (sqlStartDate.before(currentDate)) { %>
				승인기간만료 <% } else { %>
					<a href="../book/tapplyList.jsp?res_code=<%=res_code%>">매칭신청<br>리스트확인</a>
					<% } %>
				</td>
				
				<td><a href="../reservation/resdelete.jsp?res_code=<%=res_code%>&caretaker_code=<%=caretaker_code%>"
					onclick="return delok();">취소</a></td>
			</tr>

			<%
			}}
			%>
		</table>
	</form>
	<div>
		<ul class="pagination pagination-lg">
			<%
				for(int aPage = 1; aPage <= aPages; aPage++) {
			%>
				<li class="page-item <%=aPage == aPageCurrent? "button": ""%>" onclick="aPage(<%= aPage %>);">
					<%= aPage %>
				</li>
			<%		
				}
			%>
		</ul>
	</div>
</div>

<script>
	function aPage(page) {
		var path = "${context}/member/main?aPage=" + page + "#resApplyInfo-tab";
		location.href = path;
	}
</script>
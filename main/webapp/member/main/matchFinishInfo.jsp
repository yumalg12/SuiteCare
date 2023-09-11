<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="calendar.*"%>
<%@ page import ="java.util.*" %>
<%@ page import="patient.*"%>
<%@ page import="book.*"%>
<%@ page import="review.*"%>
<%@ page import="java.sql.Time"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>


<div>
	<input type="button" class="button alt" id="calToggle"
		onclick="rescalendar();" value="달력으로 보기">
</div>
<div id='calendar' class="table_wrapper"></div>
<div id='restable' class="table_wrapper">
	<%
		calendar.CalendarDAO cdao = new calendar.CalendarDAO();
		List<calendar.CalendarVO> clist = cdao.listSchedule(m_id);
		int comCnt = 0;
		int cPages = 0;
		comCnt = pdao.comlistresCnt(m_id);
		if(comCnt%perPage == 0) {
			cPages = comCnt/perPage;
		} else {
			cPages = comCnt/perPage + 1;
		}
	%>
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
				<td>매칭서비스<br>정보
				</td>
				<td>간병인</td>
				<td>후기</td>
			</tr>
		</thead>
		<%
		
List<PatientresVO> reslist = pdao.comlistres(m_id, (cPageCurrent-1)*perPage);
for (int i = 0; i < reslist.size(); i++) {
	PatientresVO listvo = (PatientresVO) reslist.get(i);

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
	String fStartTime = timeFormat.format(start_time);
	String fEndTime = timeFormat.format(end_time);
	
	String workTimes = fStartTime + "~" + fEndTime;
%>

<tr>
	<td><%=res_code%></td>
<td><%=t_name%></td>
<td><button onclick="openDetailPopup('<%=res_code%>')">더보기</button></td>

<td>
	<%
		if (location.equals("home")) {
		%>자택<%
		} else {
		%><%=location%> <%
			}	
			%>
</td>

<td>
	<%if (addr != null) {
		%><%=addr%> <%
		 if (detail_addr != null) {
		 %><br><%=detail_addr%> <%
			}
			}
			%>
</td>

<td>
	<% if (start_date != null) {
		%><%=start_date%><br>~ <%=end_date %><br>(<%=workTimes%>)
<%}%>
</td>

<td>
	<%
		List<TpreferenceVO> preList = pdao.listtpre(res_code);
		for (TpreferenceVO prevo : preList) {
			String pre_age_1 = prevo.getPre_age_1();

			if (pre_age_1 == null) {
		%> <a
href="../reservation/matchService.jsp?res_code=<%=res_code%>">작성하기</a>
<%
		} else if (pre_age_1 != null) {
		%><button onclick="openmatPopup('<%=res_code%>')">더보기</button> <%
		}
		}
		%>
</td>

<td>
	<%
		String g_name = listvo.getG_name();
		%> <a onclick="javascript:openGinfoMlist('<%=caregiver%>')"><%=g_name%></a>

</td>

<td>
	<%
		BookDAO bookDao = new BookDAO();
		mReviewVO reviewVO= new mReviewVO();
		String b_status = bookDao.status(res_code, caregiver);
		
		java.sql.Date today = new java.sql.Date(System.currentTimeMillis());
		int result = today.compareTo(end_date);
		if(result > 0){ // 오늘 날짜가 서비스이용 마지막 날짜보다 이후이면 양수
			

			if (b_status.equals("서비스이용 완료")) {
			  
			if (reviewVO.res_code==null){
				%>
				<button onclick="openrePopup('<%=res_code%>', '<%=caregiver%>')">후기 작성</button>
			<%
			}  else {
				%>
			    작성 완료
			<%
				
			}}	else {
			%>
			    <p onclick="serviceComplete('<%=res_code%>', '<%=caregiver%>');"
			       style="text-decoration: underline;">이용 확정</p> 
			<%
			}}
		
		

			%>
	</td>
</tr>

<%
}
%>
		</table>
	</form>
	<div>
		<ul class="pagination pagination-lg">
			<%
				for(int cPage = 1; cPage <= cPages; cPage++) {
			%>
				<li class="page-item <%=cPage == cPageCurrent? "button": "" %>" onclick="cPage(<%= cPage %>);">
					<%= cPage %>
				</li>
			<%		
				}
			%>
		</ul>
	</div>
</div>

<script>
	function cPage(page) {
		var path = "${context}/member/main?cPage=" + page + "#matchFinishInfo-tab";
		location.href = path;
	}
</script>
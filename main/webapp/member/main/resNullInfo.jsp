<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="patient.*"%>
<%@ page import = "java.util.*" %>
<%@ page import="java.sql.Time"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	int nulllistCnt = 0;
	int nPages = 0;
	nulllistCnt = pdao.comlistresCnt(m_id);
	if(nulllistCnt%perPage == 0) {
		nPages = nulllistCnt/perPage;
	} else {
		nPages = nulllistCnt/perPage + 1;
	}
%>
	<div id='restable'>
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
						<td>비고</td>
					</tr>
				</thead>
				<%

				m_id = (String)session.getAttribute("m_id");
				List<PatientresVO> nulllist = pdao.listnull(m_id, (nPageCurrent-1)*perPage);
				
				Set<String> processedResCodes = new HashSet<>();
				List<PatientresVO> uniqueList = new ArrayList<>();
				
				for(PatientresVO nList : nulllist) {
					
					String res_code = nList.getRes_code();
		            if (!processedResCodes.contains(res_code)) {
		                processedResCodes.add(res_code);
		                uniqueList.add(nList);
		            }
					String t_name = nList.getCaretaker();
					Date start_date = nList.getStartdate();
					Date end_date = nList.getEnddate();
					Time start_time = nList.getStarttime();
					Time end_time = nList.getEndtime();
					String caretaker_code = nList.getCaretaker_code();
					String location = nList.getLocation();
					String addr = nList.getAddr();
					String detail_addr = nList.getDetail_addr();
					
					 if (location == null || addr==null || start_date==null) {
			%>

			<tr>
				<td><%=res_code%></td> <td><%=t_name%></td> 
				<td><button onclick="openDetailPopup('<%=res_code %>')">더보기</button></td>
				<td> <% if(location==null) { %>
    					<a href="../reservation/location?res_code=<%=res_code%>">미작성</a>
    					<% } else if(location!=null) { 
    							if(location.equals("home")) { %>
    							자택 <% }else { %>
    						<%=location %>
    						<% }} %>
				</td>
				
				<td> <% if(addr==null) { %>
    					<a href="../reservation/location?res_code=<%=res_code%>">미작성</a>
    				<% } else if(addr!=null) { %>
    					<%=addr %> <% if(detail_addr!=null) { %> <%=detail_addr %> <% }} %>
				</td>
				<td><% if(start_date==null) { %>
    					<a href="../reservation/date?res_code=<%=res_code%>">미작성</a>
					<% } else if(start_date!=null) { %>
						일시 : <%=start_date%> ~ <br> <%=end_date %><br>시간 : <%=start_time%> ~ <%=end_time%>
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
				for(int nPage = 1; nPage <= nPages; nPage++) {
			%>
				<li class="page-item <%=nPage == nPageCurrent? "button": "" %>" onclick="nPage(<%= nPage %>);">
					<%= nPage %>
				</li>
			<%		
				}
			%>
		</ul>
	</div>
</div>

<script>
	function nPage(page) {
		var path = "${context}/member/main?nPage=" + page + "#resNullInfo-tab";
		location.href = path;
	}
</script>
<%@ page import="reservation.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Time"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 예약정보</title>
<%@ include file="/header-import.jsp"%>
</head>

<body>
	<%@ include file="/header.jsp"%>
	
	<%
		int rPageCurrent = request.getParameter("rPage") != null ? Integer.parseInt(request.getParameter("rPage")) : 1;
		ReservationDAO dao = new ReservationDAO();
		int resCnt = dao.allResCnt();
		int rPages = 0;
		int perPage = 10;
		if(resCnt % perPage == 0) {
			rPages = resCnt/perPage;
		} else {
			rPages = resCnt/perPage +1;
		}
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
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>SC 스위트케어</p>
						<h2>예약 정보 조회</h2>
					</header>

					<form name="resinfo">
						<table>
							<thead>
								<tr>
									<td>No.</td> <td>피간병인 아이디</td> <td>피간병인 코드</td> <td>간병인 아이디</td>
									<td>예약코드</td> <td>결제주문번호</td> <td>예약날짜</td> <!--<td>상세정보</td>--> 
									<td></td>
								</tr>
							</thead>
							<%
							request.setCharacterEncoding("utf-8");

							List<ReservationVO> list = dao.allRes((rPageCurrent-1)*perPage, perPage);
							for (int i = 0; i < list.size(); i++) {
								ReservationVO listt = (ReservationVO) list.get(i);
								
								String mid = listt.getM_id();
					            String caretaker_code = listt.getCaretaker_code();
					            String caregiver_id = listt.getCaregiver_id();
					            String res_code = listt.getRes_code();
					            String merchant_uid = listt.getMerchant_uid();
					            String res_date = listt.getRes_date();
							%>
							<tr>
								<td><%=(rPageCurrent-1)*perPage + i + 1%></td>
								<td><a onclick="javascript:openM('<%=mid%>')"><%=mid%></a></td>
								<td><a onclick="javascript:openT('<%=caretaker_code%>')"><%=caretaker_code%></a></td>
								<td><%= caregiver_id == null ? "미지정" : "<a onclick='javascript:openG(\""+caregiver_id+"\")'>"+caregiver_id+"</a>" %></td>
								<td><a onclick="javascript:openR('<%=res_code %>', '<%=caretaker_code %>')"><%=res_code%></a></td>
								<td><%=merchant_uid%></td>
								<td><%=res_date%></td>
								<!--
								<td><a onclick="javascript:openAdRinfo('<%=res_code %>', '<%=caretaker_code %>')">더보기</a></td>
								-->
								<td><a href="../admin/ad_rUpdate.jsp?res_code=<%=res_code %>">수정</a><br>
									<a onclick="javascript:resDelete('<%=res_code %>')">삭제</a></td>
							</tr>
							<%
							}
							%>
						</table>
					</form>
					<div>
						<ul class="pagination pagination-lg">
							<%
								for(int rPage = 1; rPage <= rPages; rPage++) {
							%>
								<li class="page-item <%=rPage == rPageCurrent? "button": "" %>" onclick="movePage('rPage', <%= rPage %>, this);">
									<%= rPage %>
								</li>
							<%		
								}
							%>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script>
	function openAdRinfo(res_code, caretaker_code){
		window.open("${context}/admin/admin_rinfo.jsp?res_code=" + res_code + "&caretaker_code=" + caretaker_code, 
				"name(about:blank)", "width=800, height=600");
	}
	function openM(m_id){
		window.open("${context}/admin/admInfo.jsp?m_id=" + m_id, 
				"name(about:blank)", "width=800, height=600");
	}
	function openT(caretaker_code){
		window.open("${context}/admin/adtInfo.jsp?caretaker_code=" + caretaker_code, 
				"name(about:blank)", "width=800, height=600");
	}
	function openG(caregiver_id){
		window.open("${context}/admin/adgInfo.jsp?caregiver_id=" + caregiver_id, 
				"name(about:blank)", "width=800, height=600");
	}
	function openR(res_code, caretaker_code){
		window.open("${context}/admin/adrInfo.jsp?res_code=" + res_code + "&caretaker_code=" + caretaker_code, 
				"name(about:blank)", "width=800, height=600");
	}
	function resDelete(res_code){
		if(!confirm('회원을 삭제하시겠습니까?')){
			return false;
		}
		else{
			window.location.href="./ad_rDelete.jsp?res_code=" + res_code;
			return true;
		}
	}
	</script>
	
	<%@include file="/footer.jsp"%>
</body>

</html>

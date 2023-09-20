<%@ page import="member.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.Time"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>SC 스위트케어 | 회원정보</title>
<%@ include file="/header-import.jsp"%>

</head>

<body>
	<%@ include file="/header.jsp"%>
	<%
	int mPageCurrent = request.getParameter("mPage") != null ? Integer.parseInt(request.getParameter("mPage")) : 1;
	
		MemberDAO dao = new MemberDAO();
		int memCnt = dao.memCnt();
		int mPages = 0;
		int perPage = 10;
		if(memCnt%perPage==0) {
			mPages = memCnt/perPage;	
		} else {
			mPages = memCnt/perPage + 1;	
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
						<h2>회원 정보 조회</h2>
					</header>

					<form name="memberinfo">
						<table>
							<thead>
								<tr>
									<td>No.</td> <td>아이디</td> <td>이름</td> <td>성별</td>
									<td>핸드폰번호</td> <td>이메일</td> <td>주소</td> <td>sms 수신동의</td> 
									<td>email 수신동의</td> <td>가입일</td> <td>등록한 피간병인</td> <td></td>
								</tr>
							</thead>
							<%
							request.setCharacterEncoding("utf-8");

							List<MemberVO> list = dao.listMembers((mPageCurrent-1)*perPage, perPage);
							for (int i = 0; i < list.size(); i++) {
								MemberVO listt = (MemberVO) list.get(i);

								m_id = listt.getM_id();
								String m_name = listt.getM_name();
								String m_gender = listt.getM_gender();
								String m_phone = listt.getM_phone();
								String m_email = listt.getM_email();
								String m_address = listt.getM_address();	
								String m_sms_yn = listt.getM_sms_yn();
								String m_email_yn = listt.getM_email_yn();
								Date m_signup_date = listt.getM_signup_date();
								
								String phone = m_phone.replace("-", "");
								phone = phone.substring(0,3) + "-" + phone.substring(3,7) + "-" + phone.substring(7,11);
							%>
							<tr>
								<td><%=(mPageCurrent-1)*perPage + i + 1%></td>
								<td><%=m_id%></td>
								<td><%=m_name%></td>
								<td><%=m_gender%></td>
								<td><%=phone%></td>
								<td><%=m_email%></td>
								<td><%=m_address%></td>
								<td><%=m_sms_yn%></td>
								<td><%=m_email_yn%></td>
								<td><%=m_signup_date%></td>
								<td><a onclick="javascript:openAdTinfo('<%=m_id%>')">더보기</a></td>
								<td><a href="../admin/ad_mUpdate.jsp?m_id=<%=m_id%>">수정</a><br>
								<a onclick="javascript:memberDelete('<%=m_id%>')">삭제</a></td>
							</tr>
							<%
							}
							%>
						</table>
					</form>
					<div>
						<ul class="pagination pagination-lg">
							<%
								for(int mPage = 1; mPage <= mPages; mPage++) {
							%>
								<li class="page-item <%=mPage == mPageCurrent? "button": "" %>" onclick="movePage('mPage', <%= mPage %>, this);">
									<%= mPage %>
								</li>
							<%		
								}
							%>
						</ul>
					</div>
					<div class="form_button">
						 <input type="button" class="button alt" onclick="adminback();" value="뒤로가기">
</div>
				</div>
			</div>
		</div>
	</section>

<script>
function openAdTinfo(m_id){
	window.open("${context}/admin/admin_tinfo.jsp?m_id="+m_id, "name(about:blank)", "width=800, height=600");
}
function memberDelete(m_id){
	if(!confirm('회원을 삭제하시겠습니까?')){
		return false;
	}
	else{
		window.location.href="./ad_mDelete.jsp?m_id=" + m_id;
		return true;
	}
}
function adminback() {
	window.location.href = "${context}/admin/adMain.jsp";
}
</script>

	<%@include file="/footer.jsp"%>
</body>

</html>
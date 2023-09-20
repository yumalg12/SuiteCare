<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.*"%>
<%@ page import="java.sql.Time"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%>

<!DOCTYPE HTML>
<html>
<head>
<title>SC 스위트케어 | 예약정보</title>
<%@ include file="/header-import.jsp"%>
</head>

<body>

	<!-- Two -->
	<section id="two" class="wrapper style2">
		<div class="inner">
			<div class="box">
				<div class="content">
					<header class="align-center">
						<p>피간병인 정보</p>
						<h2></h2>
					</header>
					
					<form name="minfo">
					<%
					request.setCharacterEncoding("utf-8");
					m_id = request.getParameter("m_id");

					MemberDAO dao = new MemberDAO();
					List<MemberVO> list = dao.listMembers(m_id);
					for (int i = 0; i < list.size(); i++) {
						MemberVO listvo = (MemberVO) list.get(i);

						String name = listvo.getM_name();
						String gender = listvo.getM_gender();
						String phone = listvo.getM_phone();
						String email = listvo.getM_email();
						String address = listvo.getM_address();
					%>

						<div class="form_wrapper">

							<div class="form_row">
								<label for="id">아이디</label> 
								<input type="text" value="<%=m_id%>"  readonly>
							</div>
							
							<div class="form_row">
								<label for="name">이름</label> 
								<input type="text" value="<%=name%>"  readonly>
							</div>

							<div class="form_row">
								<label for="gender">성별</label> <input type="text"
									value="<%=gender%>" readonly>
							</div>

							<div class="form_row">
								<label for="phone">핸드폰 번호</label> <input type="text"
									value="<%=phone%>" readonly>
							</div>
							
							<div class="form_row">
								<label for="email">이메일</label> <input type="text"
									value="<%=email%>" readonly>
							</div>
							
							<div class="form_row">
								<label for="address">주소</label> <input type="text"
									value="<%=address%>" readonly>
							</div>
					
						</div>

				</form>
				<!-- form 끝 -->
				<%
				}
				%>
				</div>
			</div>
		</div>
		
	</section>

</body>

</html>
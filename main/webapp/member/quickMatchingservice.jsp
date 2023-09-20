<%@ page import = "match.*" %>
<%@ page import = "recommend.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>SC 스위트케어 | 빠른매칭서비스</title>
<%@ include file="/header-import.jsp"%>

<style>
.rank-td{
	text-align:left;
    min-width: 150px;
}
.rank-td p{
	margin: 0;
}
</style>
</head>
<body>

	<%@ include file="../header.jsp" %>
<%
String res_code = request.getParameter("res_code");
MatchDAO mdao = new MatchDAO();

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
						<p> SuiteCare </p>
						<h2>빠른 매칭 리스트</h2>
					</header>
					
<form name="quickForm">
	<div class="table-wrapper">
<table>
<thead>
        <tr>
            <td>프로필 사진</td>
            <td>이름</td>
            <td>성별</td>
            <td>나이</td>
            <td>거주지역</td>
            <td>활동지역</td>
            <td>주요서비스</td>
            <td>보유자격증</td>
            <td>시급</td>
            <td>후기확인</td>
            <td>비고</td>
        </tr>
    </thead>
    <tbody>
     <c:choose>
         <c:when test="${empty ginfoList}">
            <tr>
               <td colspan="10">${notFoundMessage}</td>
             </tr>
          </c:when>
        <c:otherwise>
    
  <c:forEach var="ginfo" items="${ginfoList}">
<c:set var="address" value="${ginfo.g_address}" />
<c:set var="idx" value="${address.indexOf(' ')}" />
<c:set var="fidx" value="${address.indexOf(' ', idx + 1)}" />
<c:set var="addr" value="${address.substring(idx + 1, fidx)}" />

<c:set var="profilePath" value="${ginfo.profilePath}" />

<c:set var="gender" value="${ginfo.g_gender}" />

<c:set var="giverID" value="${ginfo.g_id}" />

	<tr>
	<td><div class="img-wrapper">
	<img src="${profilePath}" onerror="this.src='<%=context %>/assets/images/logo2.png'; this.style.filter='contrast(0.5)'; this.style.marginBottom='0.75rem';">
	</div></td>
	<td>${ginfo.g_name}</td>
	<td><c:choose>
            <c:when test="${gender eq 'W'}">여</c:when>
            <c:otherwise>남</c:otherwise>
        </c:choose></td>
	<td>${ginfo.g_age}</td><td>${addr}</td>
	<td class="rank-td"><p>1순위: ${ginfo.g_location1}</p>
		<p>2순위: ${ginfo.g_location2}</p>
		<p>3순위: ${ginfo.g_location3}</p></td>
	<td class="rank-td"><p>1순위: ${ginfo.g_service1}</p>
		<p>2순위: ${ginfo.g_service2}</p>
		<p>3순위: ${ginfo.g_service3}</p></td>
	<td>${ginfo.g_qualification}</td>
	<td class="rank-td"><p>1순위: ${ginfo.g_hourwage1}</p>
		<p>2순위: ${ginfo.g_hourwage2}</p>
		<p>3순위: ${ginfo.g_hourwage3}</p></td>
		
	<td>
	<% String checkid = (String)pageContext.getAttribute("giverID"); %>
	<a href="javascript:void(0);" onclick="openquickPopup('./book/review?g_id=<%=checkid%>');">확인</a>
	</td>
	<td>
	<% 
	String mst = mdao.mst(res_code, checkid);
	
	if(mst==null) {%>
		<span onclick="tmatch('${ginfo.re_id }','${ginfo.g_id }','${ginfo.g_name }');" style="text-decoration: underline;cursor:pointer;">매칭신청</span>
	<% }else {%>
		<%=mst %> <% } %>	
		</td>
	
	</tr>
	</c:forEach>
 </c:otherwise>
</c:choose>
	</tbody>
		</table>	
	</div>
</form>

</div></div></div></section>

	<%@ include file="../footer.jsp" %>

</body>
<script>
function tmatch(re_id, g_id, g_name) {
	window.open("${context}/match/apply?res_code=" + re_id + "&g_id=" + g_id + "&g_name=" + g_name, "name(about:blank)", "width=800, height=950");
}

function openquickPopup(url) {
	 window.open(url, "Popup", "width=800, height=800");
}
</script>
</html>
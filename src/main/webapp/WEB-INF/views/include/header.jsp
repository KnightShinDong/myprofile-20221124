<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/hyperlink.css">
<title>header</title>
</head>
<body>
	<% 
		String sessionId = (String)session.getAttribute("memberId");
		String sessionName = (String)session.getAttribute("memberName");
	%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr class="headline01">
			<td width="65%" class="menu001">
			<%
			 if(sessionId == null){
			%>
				guest님 입장중
			<%
			} else {
			%>
			<%=sessionName %>님 입장중	
			<%
			}
			%>
			
			</td>
			<td width="5%" class="menu01">
			
			<td width="5%" class="menu01"><a href="index">HOME</a></td>
			<td width="5%" class="menu01">
			<% 
				if(sessionId == null){
			%>
				<a href="login">로그인</td>
			<%
				} else {
			%>
				<a href="logout">로그아웃</td>
			<%
				}
			%>
			<td width="6%" class="menu01">
			<% 
				if(sessionId == null){
			%>
				<a href="join">회원가입</td>
			<%
				} else {
			%>
				<a href="memberModify">회원정보</td>
			<%
				}
			%>
			
			
			<td width="5%" class="menu01"><a href="profile">프로필</a></td>
			<td width="6%" class="menu01"><a href="question">문의사항</a></td>
			<td width="6%" class="menu01"><a href="contact">고객센터</a></td>
			<td width="2%"></td>
		</tr>
		<tr class="headline02">
		<td>&nbsp;</td>
		</tr>	 
	</table>
</body>
</html>
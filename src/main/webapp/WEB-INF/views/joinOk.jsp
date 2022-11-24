<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinOk</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/title.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/content.css">
	<% 
		String sessionId = (String)session.getAttribute("memberId");
		String sessionName = (String)session.getAttribute("memberName");

	%>


</head>
<body>
	<%@ include file="include/header.jsp" %>
	<center>
	<table width="80%" border="0" cellspacing="0" cellpadding="20">
		<tr>
			<td class="titlebox">
				<span class="title01"> Dong-Hun's KINGDOM OF CAT</span>
			</td>
		</tr>
		<tr>
			<td class="titlebox">
				<span class="title02"> I am King of the world!!</span>
			</td>
		</tr>
		<tr>
			<td>
				<center>
				<table width="80%" border="0" cellspacing="0" cellpadding="20">
					<tr class="contentbox">
						<td class="content">
							<u><%=sessionName %></u> 님께서 
							<u><%=sessionId %></u>로
							회원가입을 성공하셨습니다.
							축하드립니다.
							
							
						</td>
						
					</tr>
					
				</table>
				</center>
			</td>
		</tr>
	</table>
	</center>
	<%@ include file="include/footer.jsp" %>
</body>
</html>
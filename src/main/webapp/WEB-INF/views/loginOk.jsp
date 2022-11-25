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
							<%
								int checkIdFlag = Integer.parseInt(request.getAttribute("checkIdFlag").toString());
								//컨트롤러 model에서 넘어오 값을 축출할때는 request.getAttribute
								//먼저 객체로 넘어온 체크아이디플레그를 투스트링으로 바꾼다음 인티저 파싱으로 바꾼다
								int checkIdPwFlag = Integer.parseInt(request.getAttribute("checkIdPwFlag").toString());
								if(checkIdFlag==0){
							%>
								<script type="text/javascript">
								 alert("입력하신 아이디는 존재하지 않습니다. 다시 확인해 주세요.");
								 history.go(-1);
								</script>
							<% 
								} else if(checkIdPwFlag== 0){
							%>
								<script type="text/javascript">
								 alert("비밀번호를 다시 확인해주세요.");
								 history.go(-1);
								</script>
							<% 
								}
							
							%>
							${mid }님께서 로그인에 성공하셨습니다.
							${memberDto.mname }님의 가입일은 ${memberDto.mdate }입니다.
							
							
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
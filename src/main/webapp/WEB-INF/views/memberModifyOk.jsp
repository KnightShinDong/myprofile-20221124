<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/title.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/content.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/join.js"></script>
<!-- 자바 js파일 부르기 -->

<title>modify.jsp</title>
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
						<center>
							<table border="0" cellspacing="0" cellpadding="10">
									<tr>
										<td colspan="2" align="center">회원 정보 수정 완료</td>
									</tr>
									<tr>
										<td><span class="content_text01">MEMBER ID </span> </td>
										<td>${memberDto.mid }</td>
									</tr>
									<tr>
										<td><span class="content_text01">PASSWORD </span></td>
										<td>${memberDto.mpw } </td>
									</tr>
									
									<tr>
										<td><span class="content_text01">NAME </span></td>
										<td>${memberDto.mname}</td>
									</tr>
									<tr>
										<td><span class="content_text01">E-MEMAIL </span></td>
										<td> ${memberDto.memail}</td>
									</tr>
									<tr>
										<td colspan="2">
											<input class="button_type01" type="button" value="정보수정" onclick="script:window.location='memberModify'">&nbsp;&nbsp;
										
											<input class="button_type01" type="button" value="수정취소" onclick="script:window.location='index'">
										</td>
									</tr>
								
							</table>
							</center>
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
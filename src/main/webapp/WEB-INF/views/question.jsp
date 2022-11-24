<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>question.jsp</title>
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
						<center>
							<table border="0" cellspacing="0" cellpadding="10">
								<form action="joinOk" method="post">
									<tr>
										<td><span class="content_text01">MEMBER ID </span> </td>
										<td><input class="input_type01" type="text" name="qid"> </td>
									</tr>
									<tr>
										<td><span class="content_text01">NAME</span></td>
										<td><input class="input_type01" type="text" name="qname"> </td>
									</tr>
									<tr>
										<td><span class="content_text01">QUESTION </span></td>
										<td><textArea class=""textarea_type01" rows="10" cols="35" name="qcontent"></textArea></td>
									</tr>
									<tr>
										<td><span class="content_text01">E-MEMAIL </span></td>
										<td><input class="input_type01" type="text" name="qemail"> </td>
									</tr>
									<tr>
										<td colspan="2">
											<input class="button_type01" type="submit" value="질문하기">&nbsp;&nbsp;
											<input class="button_type01" type="button" value="글목록" onclick="script:window.location='list'">
										</td>
									</tr>
								</form>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>question.jsp</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/title.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/content.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board.js"></script>

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
										<td><span class="content_text01">MEMBER ID </span> </td>
										<td><input class="input_type01" type="text" name="qid" value="${Qdto.qid }" readonly="readonly"> </td>
									</tr>
									<tr>
										<td><span class="content_text01">NAME</span></td>
										<td><input class="input_type01" type="text" name="qname" value="${Qdto.qname }" readonly="readonly"> </td>
									</tr>
									<tr>
										<td><span class="content_text01">QUESTION </span></td>
										<td><textArea class=""textarea_type01" rows="10" cols="35" name="qcontent" readonly="readonly">${Qdto.qcontent }</textArea></td>
									</tr>
									<tr>
										<td><span class="content_text01">E-MEMAIL </span></td>
										<td><input class="input_type01" type="text" name="qemail" value="${Qdto.qemail }" readonly="readonly"> </td>
									</tr>
									<tr>
										<td colspan="2">
										<% 
											String boardId = (String)request.getAttribute("qid");
										
											if(boardId.equals("GUEST")) { //로그인 안됨
										%>
											<input class="button_type01" type="button" value="수정" onclick="script:window.location='questionModify?qnum=${Qdto.qnum}'">&nbsp;
											<input class="button_type01" type="button" value="삭제" onclick="script:window.location='questionDelete?qnum=${Qdto.qnum}'">&nbsp;
											<input class="button_type01" type="button" value="글목록" onclick="script:window.location='questionList'">
										<%
											} else if((sessionId != null) && (sessionId.equals(boardId))) {
										%>		
											<input class="button_type01" type="button" value="수정" onclick="script:window.location='questionModify?qnum=${Qdto.qnum}'">&nbsp;
											<input class="button_type01" type="button" value="삭제" onclick="script:window.location='questionDelete?qnum=${Qdto.qnum}'">&nbsp;
											<input class="button_type01" type="button" value="글목록" onclick="script:window.location='questionList'">
										<% 
											} else {
										%>
											<input class="button_type01" type="button" value="글목록" onclick="script:window.location='questionList'">
										<%
											}
										%>
										
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
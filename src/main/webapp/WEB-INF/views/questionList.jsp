<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>** SDH's PROFILE **</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/title.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/content.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css">
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
							<br><br>
							
							<table width="80%" border="0" cellspacing="0" cellpadding="20">
								
								
								<tr>
									<th class="board_title" width="5%">번호</th>
									<th class="board_title"width="10%">아이디</th>
									<th class="board_title" width="50%">질문내용</th>
									<th class="board_title"width="15%">글쓴이</th>
									<th class="board_title"width="20%">등록일</th>
								</tr>
								
								<c:forEach items="${boardDtos }" var="boardDto" begin="0" end="4">
								<tr>
									<td class="board_content01">${boardDto.qnum }</td>
									<td class="board_content01">${boardDto.qid}</td>
									
									<td class="board_content02">
										<c:choose>
						                  <c:when test="${boardDto.qcontent.length() >= 20}">
						                 	 
						                  	<a href="boardView?qnum=${boardDto.qnum}"><c:out value="${boardDto.qcontent.substring(0,20) }"></c:out>...</a>
						                  </c:when>
						                	<c:otherwise>
						                   	<a href="boardView?qnum=${boardDto.qnum}"> ${boardDto.qcontent}</a>
						               	  </c:otherwise>
					                	</c:choose>
					               	</td>
					               	
									<td class="board_content01">${boardDto.qname }</td>
									<td class="board_content01">${boardDto.qdate }</td>
									
								</tr>
								</c:forEach>
								
								<tr>
									<td colspan="5" align="center">
										<c:if test="${pageMaker.prev}">
											<a href="questionList?pageNum=${pageMaker.startPage-5 }">Prev</a> &nbsp;&nbsp;&nbsp;
										</c:if>
										<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
											<c:choose>
											<c:when test="${currPage == num}">
												<u>${num }</u> &nbsp;&nbsp;&nbsp; 
											</c:when>
											<c:otherwise>
												<a href="questionList?pageNum=${num }">${num }</a> &nbsp;&nbsp;&nbsp;
											</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${pageMaker.next}">
											<a href="questionList?pageNum=${pageMaker.startPage+5 }">Next</a> 
										</c:if>
									</td>
								</tr>
								<tr>
									<td colspan="5" align="right">
										<input type="button" value="질문하기" class="button_type01" onclick="script:window.location='question'">
									</td>
								</tr>
							</table>
							
							
							
							<br>
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
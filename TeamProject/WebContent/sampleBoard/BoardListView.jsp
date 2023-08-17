<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>샘플 게시판</title>
	<style type="text/css">
		.wrap1{
			
			min-height: 100%;
			position : relative;
			padding-bottom: 220px;
			padding-top: 10px;
		}
		.header{
			margin: 0 auto;
			text-align:left;
			font-size: 30px; 
			font-weight: bold; 
			width: 600px;
		}
		table{
			margin: 0 auto;
			border-collapse : collapse;
			font-size: 13px;
			margin-top: 2px;
			width:600px;
		}
		table tr{
			height: 30px;
			border-collapse : collapse;
			border-top: 1px solid #EAEAEA;
			border-bottom: 1px solid #EAEAEA;
		}
		
		#boardTh > td{
			font-weight:bold;
			border-collapse : collapse;
			background-color: #F6F6F6;
			border-top: 1px solid #EAEAEA;
			border-bottom: 1px solid #EAEAEA;
		}
		.boardNum , .writerId{
			text-align: center;
		}
		.boardTitle , .writeDate{
			text-align: left;
		}
		.viewsNo , .replyNo{
			text-align: right;
		}
		.boardTitle{
			color: blue;
		}
		input[name = add]{
			margin-left: 545px;
		}
		#className{
			width:300px;
		}
		.paging{
			margin: 0 auto;
			width:600px;
			text-align:center;
		}
		a {
            text-decoration: underline; /* 밑줄 추가 */
            cursor: pointer;
        }
	</style>
   	<script type="text/javascript">
   		
		function pageMoveAdd(no){ 
			
			var url = './add?no=' + no;
	         
	         location.href= url;
		}
		
		function pageMove(no){
			var url = './list?pno=' + no;
	         
	         location.href= url;
		}
		
		function pageDetail(no1,no2){
			
			var url = './detail?no1=' + no1 + '&no2=' + no2;
	         location.href= url;
		}
		
	
	</script>	
</head>

<body>
<jsp:include page="/Header.jsp" />
	<div class="wrap1">
	<div class="header">
		샘플 게시판
		<input type='button' name="add" value="글쓰기" onclick='pageMoveAdd(${boardDto.no})'>
	</div>
	<table style="text-align:center;">
		<tr id="boardTh">
			<td class="boardNum" width ="30px">번호</td>
			<td width ="240px">제목</td>
			<td class="writerId" width ="40px">작성자</td>
			<td class="writeDate" width ="60px">날짜</td>
			<td class="viewsNo" width ="30px">조회수</td>
			<td class="replyNo" width ="30px">댓글수</td>
		</tr>
		
			<c:forEach var ="boardDto" items="${boardList}" begin='${requestScope.bi}' end='${requestScope.ei}'>
		
		<tr>
			<td class="boardNum">${boardDto.bNo}</td>
			<td class='boardTitle'>
				<a onclick='pageDetail(${boardDto.bNo},${boardDto.no})'>${boardDto.cTitle}</a>
			</td>
			<td class="writerId">${boardDto.id}</td>
			<td class="writeDate">${boardDto.bModifiedDate}</td>
			<td class="viewsNo">${boardDto.bViewsNo}</td>
			<td class="replyNo">${boardDto.bReplyNo}</td>
		</tr>	
	
		</c:forEach>
		
	</table>
	
	<div class="paging">
		<div class="pages">
			<c:forEach var = "pages"  begin ="0" end="${totalPages}">
				<span><a onclick='pageMove(${pages})'>${pages+1}</a></span>
			</c:forEach>
		</div>
	</div>
	</div>
 	<jsp:include page="/Footer.jsp"/>
</body>

</html>
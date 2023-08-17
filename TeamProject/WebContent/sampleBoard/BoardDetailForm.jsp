<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>친목게시판글상세</title>
</head>
<style type="text/css">
	.wrap1{
		text-align:center;
		min-height: 100%;
		position : relative;
		padding-bottom: 220px;
		padding-top: 90px;
	}
	div{
		margin: 0 auto;
		text-align: center;
	}
	table{
		margin: 10px auto;
		text-align:left;
		border-collapse: collapse;
		width:600px;
	}
	textarea{
		width:370px; 
		height:350px;
		resize: none;
	}
	.align-center{
		font-size: 30px; 
		font-weight: bold; 
		width: 500px;
	 	height:30px; 
	 	line-height: 30px;
	}
	.align-center img{
	 	vertical-align: middle;
	}
</style>

	<script type="text/javascript">
		function pageMoveListFnc(){
			location.href="./list";	
		}
		
		function pageMoveUpdateFnc(no){
			var url = './update?no=' + no;
			
			location.href= url;	
		}	
		function pageMoveDeleteFnc(no){
			var url = './delete?no=' + no;
			
			location.href= url;
		}
	</script>
<body>
	<jsp:include page="/Header.jsp"/>
	<div class="wrap1" style="width:550px">
		<div class="align-center">
			<img src="../img/circle.jpg" width="30px"height="30px">
			친목게시판글상세
			<img src="../img/circle.jpg" width="30px"height="30px">
		</div>
		<div>
		<form action="add" method="post">
			<table>
				<tr>
					<td width="50px">작성자</td>
					<td width="180px"><input type="text" name="id" style="width:170px"value="${boardDto.id}" readonly="readonly"></td>
					<td width="150px"></td>
					<td width="50px"></td>
				</tr>
				
				<tr>
					<td>제목</td>
					<td colspan="2"><input type="text" name="title"style="width:320px"value="${boardDto.cTitle}" readonly="readonly"></td>
					<td></td>
				</tr>
				<tr class="contentTr" height="350px">
					<td>내용</td>
					<td colspan="3"><textarea name="contents" readonly="readonly">${boardDto.bContents}</textarea></td>
				</tr>
			</table>
			<div>
				<input type="button" value='수정하기' onclick='pageMoveUpdateFnc(${boardDto.bNo});'>
				<input type="button" value='삭제하기' onclick='pageMoveDeleteFnc(${boardDto.bNo});'><br><br>
				<input type='button' value='게시글 목록보기' onclick='pageMoveListFnc();'>
			</div>
			</form>
		</div>
	</div>



 	<jsp:include page="/Footer.jsp"/>
</body>


</html>
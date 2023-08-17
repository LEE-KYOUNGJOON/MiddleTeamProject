<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>친목게시글 수정</title>
	<style type="text/css">
		.wrap1{
			margin: 0 auto;
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
			margin: 0 auto;
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
		function pageMoveDeletFnc(no){
			var url = './delete?no=' + no;
			location.href= url;
		}
		function validateForm(){
			var title = document.getElementsByName("title")[0].value;
			var contents = document.getElementsByName("contents")[0].value;
			
			if(title == ""){
				alert("제목을 입력해주세요.");
				return false;
			}
			if(contents == ""){
				alert("내용을 입력해주세요.");
				return false;
			}
			if(title.length > 20){
				alert("제목이 너무깁니다. 20자까지.")
				return false;
			}
		}
		
	</script>

</head>
<body>
	<jsp:include page="/Header.jsp"/>
	<div class="wrap1" style="width:550px">
		<div class="align-center">
			<img src="../img/circle.jpg" width="30px"height="30px">
			친목게시판글수정
			<img src="../img/circle.jpg" width="30px"height="30px">
		</div>
		<div>
		<form action="update?no=${boardDto.bNo}" method="post" onsubmit="return validateForm()">
			<table>
				<tr>
					<td width="50px">작성자</td>
					<td width="180px"><input type="text" name="id" style="width:170px"value="${boardDto.id}"></td>
					<td width="150px"></td>
					<td width="50px"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="2"><input type="text" name="title"style="width:320px"value="${boardDto.cTitle}"></td>
					<td></td>
				</tr>
				<tr class="contentTr" height="350px">
					<td>내용</td>
					<td colspan="3"><textarea name="contents">${boardDto.bContents}</textarea></td>
				</tr>
			</table>
			<div>
				<input type="submit" value='수정완료'>
				<input type="button" value='삭제하기' onclick='pageMoveDeletFnc(${boardDto.bNo})'><br><br>
				<input type='button' value='게시글 목록보기' onclick='pageMoveListFnc();'>
			</div>
			</form>
		</div>
	</div>



 	<jsp:include page="/Footer.jsp"/>
</body>
</html>

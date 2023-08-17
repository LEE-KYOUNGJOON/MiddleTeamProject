<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/FindIDFail.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/Header.jsp" />
	
	<div class="wrap11">
	
		<div id="showIdWrap">
			<div id="showIdHeader">아이디 찾기 실패</div>
			<div id="showIdContent1">등록되지 않은 정보입니다. <br><br> 회원 정보를 다시 확인해주세요.</div>
		</div>
		
		<div id="BtnList">
		<div id="LoginBtn" onclick="FindIdPage()">아이디 찾기</div>
		<div id="JoinBtn" onclick="JoinPage()">회원가입</div>
		</div>
	
	</div>
	
	<jsp:include page="/Footer.jsp" />
	
	<script type="text/javascript">
		function FindIdPage(){
			location.href = "./FindID.jsp";
		}
		function JoinPage(){
			location.href = "../member/signup";
		}
	</script>
</body>
</html>
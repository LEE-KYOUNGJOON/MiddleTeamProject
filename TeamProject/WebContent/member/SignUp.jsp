<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="../css/ShowID.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/Header.jsp" />
	
	<div class="wrap11">
	
		<div id="showIdWrap">
		<div id="showIdHeader">회원가입 성공</div>
		<div id="showIdContent1">회원가입을 환영합니다.</div>
	</div>
	
	<div id="BtnList">
		<div id="LoginBtn" onclick="LoginPage()">로그인</div>
		<div id="JoinBtn" onclick="JoinPage()">회원가입</div>
	</div>
	
	</div>
	
	<jsp:include page="/Footer.jsp" />
	
	<script type="text/javascript">
		function LoginPage(){
			location.href = "./Login.jsp";
		}
		function JoinPage(){
			location.href = "../member/signup";
		}
	</script>
</body>
</html>
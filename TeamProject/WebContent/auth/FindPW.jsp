<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/FindPW.css" rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:include page="/Header.jsp" />
	
	<div class="wrap11">
	
		<div id="box-findID">
		
			<div id="tab-list">
				<div id="tab1">
					<div id="id-text" onclick="FindIdPage()">아이디 찾기</div>
				</div>
				<div id="tab2">
					<div id="pw-text" onclick="FindPwPage()">비밀번호 찾기</div>
				</div>
			</div>
			
			<div id="content1">아이디 확인 후 비밀번호를 재설정 할 수 있습니다.</div>
			
			<form  id="findPWByIDForm" name="findPWByIDForm" action="./findPw" method="post">
				<input type="text" name="mid" placeholder="아이디" id="input-id"><br>
				<input type="button" value="확인" id="input-btn" onclick="checkValue()">
			</form>
	
		</div>
	
	</div>
	
	<jsp:include page="/Footer.jsp" />
	
	<script type="text/javascript">
		function FindIdPage(){
			location.href = "../auth/FindID.jsp";
		}
		function FindPwPage(){
			location.href = "../auth/FindPW.jsp";
		}
		
		var inputID = document.getElementById("input-id");
		
		function checkValue(){
			var form = document.findPWByIDForm;
			
			if (inputID.value === '') {
				alert('아이디를 입력해 주세요.');
				form.mid.focus();
		        return false;
			} 
			form.submit();
		}
		
		
		
	</script>

</body>
</html>
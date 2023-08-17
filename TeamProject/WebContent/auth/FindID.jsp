<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/FindID.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<jsp:include page="/Header.jsp" />
	
	<div class="wrap11">
	
		<div id="box-findID">
		
			<div id="tab-list">
				<div id="tab1">
					<div id="id-text">아이디 찾기</div>
				</div>
				<div id="tab2">
					<div id="pw-text" onclick="FindPwPage()">비밀번호 찾기</div>
				</div>
			</div>
			
			<div id="textArea">아이디 찾을 방법을 선택해주세요.</div>
	
			<div id="findIdByName">
				<div id="findIdByNameBtn">
					휴대폰 번호로 찾기
				</div>
				
				<form id="findIdByNameForm" name="findIdByNameForm" action="./findId" method="post">
					<input type="text" name="mname" placeholder="회원명" id="input-mname">
					<input type="number" name="phoneno" placeholder="휴대폰 번호 (숫자만 입력)" id="input-pn"><br> 
					<input type="button" value="아이디 찾기" id="findIdBtn" onclick="checkValue()">
				</form>
			</div>
	
		</div>
	
	</div>
	
	<jsp:include page="/Footer.jsp" />
	
	
	<script type="text/javascript">
	
		var inputName = document.getElementById("input-mname");
		var inputPhoneNum = document.getElementById("input-pn");
		
		function checkValue(){
			var form = document.findIdByNameForm;
			
			if (inputName.value === '') {
				alert('이름을 입력해 주세요.');
				form.mname.focus();
		        return false;
			} else if(inputPhoneNum.value === ''){
				alert('휴대폰 번호를 입력해 주세요.');
				form.phoneno.focus();
				return false;
			}
			form.submit();
		}
		
		function FindPwPage(){
			location.href = "./FindPW.jsp";
		}
		
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="../css/Login.css" rel="stylesheet" type="text/css">
	<jsp:useBean
	id="member"
	scope="session"
	class="spms.dto.MemberDto"
	/>
</head>
<body>
	
	<jsp:include page="/Header.jsp" />
	
	<div class="wrap11">
	
	<div class="div-htag">
		<p>로그인</p>
	</div>
	
	<div class="content-wrap">
	<div class="login-wrap">
		<div class="user-select">
			<div class="user1" onclick="inputbox1()">회원</div>
			<div class="user2" onclick="inputbox2()">비회원 주문조회</div>
		</div>
		
		<div>
			<div style="width:360px; height: 20px; font-size:13px; color: #e63740; text-align:center; line-height: 20px; display: block; padding:4px 0 12px; margin-top:10px;">
				아이디 또는 비밀번호가 정확하지 않습니다.
			</div>
		</div>
	
		<form class="form-login" name="loginForm" action="./login" method="post">
			<input type="text" name="mid" placeholder="아이디" class="input-id" style="margin-top:0;"><br>
			<input type="password" name="pwd" placeholder="비밀번호" class="input-pw"><br> 
			<input type="button" value="로그인" class="input-btn" onclick="check()">
			<br>
		</form> 
	</div>
	
	<div class="ad-side">
		<div style="text-align:center; font-size:25px; font-weight: bold; margin-top: 60px;">
			휴대폰 번호로 <span style="color: orange;">로그인</span>하기 <br>
		</div>
	</div>
	
	
	<div class="div-userinput">
			<div class="div-checkbox">
				<input class="input-checkbox" type="checkbox"><span style="line-height: 46px;">아이디 저장</span>
				<div class="a-list">
				<a href="#" style="font-size: 13px; line-height: 46px; text-decoration: none;">아이디찾기 | </a> 
				<a href="#" style="font-size: 13px; line-height: 46px; text-decoration: none;">비밀번호찾기 | </a>
				<a href="#" style="font-size: 13px; line-height: 46px; text-decoration: none;">회원가입</a>
				</div>
			</div>	
		</div>
		
		
		<br />
		<input type="submit" value="카카오로 시작하기" 
		style="width:360px; height:50px; background-color:yellow; 
		color:black; border:none; padding:0;"><br>
		
		</div>
		</div>
 		<jsp:include page="/Footer.jsp" />
		
		
		
<script type="text/javascript">
	
	function inputbox1(){
		var inputChange1 = document.getElementsByClassName('input-id')[0];
		inputChange1.setAttribute('placeholder','아이디');
		
		var inputChange2 = document.getElementsByClassName('input-pw')[0];
		inputChange2.setAttribute('placeholder','비밀번호');
		
		var inputChange3 = document.getElementsByClassName('input-btn')[0];
		inputChange3.setAttribute('value','로그인');
		
		var selectBox = document.getElementsByClassName('user1')[0];
		selectBox.setAttribute('style','border: 1px solid black; border-bottom-style: none;');
		
		var selectBox2 = document.getElementsByClassName('user2')[0];
		selectBox2.setAttribute('style','border: 1px solid #f3f3f3; background-color: #f3f3f3;');
	}
	
	function inputbox2(){
		var inputChange1 = document.getElementsByClassName('input-id')[0];
		inputChange1.setAttribute('placeholder','주문자명');
		
		var inputChange2 = document.getElementsByClassName('input-pw')[0];
		inputChange2.setAttribute('placeholder','휴대폰 번호');
		
		var inputChange3 = document.getElementsByClassName('input-btn')[0];
		inputChange3.setAttribute('value','주문내역 조회하기');
		
		var inputForm = document.getElementsByClassName('form-login')[0];
		inputForm.setAttribute('style','height: 154px;');
		
		var selectBox = document.getElementsByClassName('user1')[0];
		selectBox.setAttribute('style','border: 1px solid #f3f3f3; background-color: #f3f3f3;');
		
		var selectBox2 = document.getElementsByClassName('user2')[0];
		selectBox2.setAttribute('style','border: 1px solid black; border-bottom-style: none; color:black; background-color:white;');
	}
	
	var inputID = document.getElementsByClassName('input-id')[0];
	var inputPW = document.getElementsByClassName('input-pw')[0];
	
	
	function check(){
		var form = document.loginForm;
		
		if (inputID.value === '') {
			alert('회원ID를 입력해 주세요.');
			form.mid.focus();
	        return false;
		} else if(inputPW.value === ''){
			alert('비밀번호를 입력해 주세요.');
			form.pwd.focus();
			return false;
		}
		form.submit();
	}
</script>
</body>
</html>


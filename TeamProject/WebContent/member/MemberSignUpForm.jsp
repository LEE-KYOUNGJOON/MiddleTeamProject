<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<style type="text/css">
		
		#locbar_crop {
			color: #333333;
			margin: 2px 0px 0px;
		}
		
		#locbar_crop.holder {
			padding-left: 400px;
			margin-bottom: 10px;
		}
		
		#tit_joinid {
		
			width: 780px;
			height:70px;
			margin-left: 500px;
			margin-top: 30px;
			margin-bottom : 10px;
			background-color: #001437;
		}
	
		.tit-join {
			font-size: 35px;
			color: #fff;
			text-align: left;
			text-shadow:black;
			padding-top: 10px;
			margin-top: 85px;
			margin-left: 70px;
		}
		
		.tit-join {
			text-shadow: black;
		}
		
		#inputInfo {
			width: 940px;
			height: 412px;
			color: #333333;
			font: Gulim;
			font-size: 40px;
			padding: 32px 0px 3px;
			margin-left: 300px;
			border-bottom: 1px solid gray;
		}
		
		.info-cont > ul > li {
			margin-bottom: 16px;
			margin-left: 330px;
			font-size: 10px;
			float: none;
			
			
		}
		
		.info-cont > ul > li > input{
			padding : 4px 0px 7px 11px;
			color: gray;
		}
		
		#agreeInfo {
			width: 940px;
			height: 412px;
			color: #333333;
			font: Gulim;
			font-size: 40px;
			padding: 32px 0px 3px;
			margin-left: 300px;
			border-bottom: 1px solid gray;
		}
		
		#agreeBox {
			font-size: 15px;
			text-align: left;
		}
		
		#agree{
			font-size: 18px;
			margin-left: 350px;
			margin-top: 30px;
			margin-bottom : 10px;
		}
		.check_essential1 {
			color: gray;
			font-size: 12px;
		}
		
		.check_essential2 {
			color: gray;
			font-size: 12px;
		}
		
		.check_essential3 {
			color: gray;
			font-size: 12px;
		}
		
		.check_essential4 {
			color: gray;
			font-size: 12px;
		}
		
		.check_select1 {
			color: gray;
			font-size: 12px;
		}
		
		.check_select2 {
			color: gray;
			font-size: 12px;
		}
		
		.check_select3 {
			color: gray;
			font-size: 12px;
		}
		
		.check_select4 {
			color: gray;
			font-size: 12px;
		}
		
		#buttonBox {
			width: 940px;
			height: 412px;
			color: #333333;
			font: Gulim;
			font-size: 12px;
			padding: 32px 0px 3px;
			margin-left: 300px;
		}
		
		#buttonBox.memberAddButton {
			width: 215px;
			height: 48px;
			margin: 0;
			padding: 0;
			text-align: center;
		}
		
		#buttonBox.memberCancelButton {
			width: 215px;
			height: 48px;
			margin: 0;
			padding: 0;
			text-align: center;
		}
		
		a {
            text-decoration: underline; /* 밑줄 추가 */
             cursor: pointer;
        }
	</style>
	
	<script type="text/javascript">
	
	
	function inputNameInfoOnFocus() {
		var txtnameObj = document.getElementById('txt_name');
		
		if(txtnameObj.value == '이름') {
			txtnameObj.value = '';
		}
	}
	
	function inputNameInfoOnBlur() {
		var txtnameObj = document.getElementById('txt_name');
		
		if(txtnameObj.value == '') {
			txtnameObj.value = '이름';
		}
	}
	
	function inputIdInfoOnClick() {
		var txtidObj = document.getElementById('txt_id');
		var enterGuideIdObj = document.getElementById('enter_guide_id');
		var txtIdCorrectObj = document.getElementById('txt_id_correct1');
		var txtiderrorObj = document.getElementById('txt_id_error1');
		
		if(txtidObj.value == ''){
			enterGuideIdObj.innerHTML = "영문과 숫자를  혼합하여 4~12자 사이로 사용할 수 있습니다 온클릭."
			
		} else if(txtidObj.value != ''){
			enterGuideIdObj.innerHTML = "";
		}
	}
	
	function inputIdOnInputFnc() {
		var txtidObj = document.getElementById('txt_id');
		var enterGuideIdObj = document.getElementById('enter_guide_id');
		var txtIdCorrectObj = document.getElementById('txt_id_correct1');
		var txtiderrorObj = document.getElementById('txt_id_error1');
		
		
		if(txtidObj.value == ''){
			enterGuideIdObj.innerHTML = "영문과 숫자를  혼합하여 4~12자 사이로 사용할 수 있습니다 온인풋."
			
		} else if(txtidObj.value != ''){
			enterGuideIdObj.innerHTML = "";
		}
		
		if(txtidObj.value.length > 3 && txtidObj.value.length < 13) {
			txtIdCorrectObj.innerHTML = "사용가능한 아이디입니다.";
			txtiderrorObj.innerHTML = "";
			enterGuideIdObj.innerHTML = "";
			
		} else if(txtidObj.value.length < 4 || txtidObj.value.length > 12) {
			txtIdCorrectObj.innerHTML = "";
			txtiderrorObj.innerHTML = "아이디는 4~12자를 사용해 주세요.";
		} else if(enterGuideIdObj.innerHTML 
					= "영문과 숫자를  혼합하여 4~12자 사이로 사용할 수 있습니다. 온인풋1") {
			
			txtiderrorObj.innerHTML = ";"
		}
		
	}
	
	function inputIdInfoOnFocus() {
		var txtidObj = document.getElementById('txt_id');
		var txtiderrorObj = document.getElementById('txt_id_error1');
		var enterGuideIdObj = document.getElementById('enter_guide_id');
		
		if(txtidObj.value == '아이디'){
			txtidObj.value = '';
		}
		
	}
	
	function inputIdInfoOnBlur() {
		var txtidObj = document.getElementById('txt_id');
		var txtiderrorObj = document.getElementById('txt_id_error1');
		var enterGuideIdObj = document.getElementById('enter_guide_id');
		
		if (txtidObj.value == '') {
			txtiderrorObj.innerHTML = "아이디는 영문, 숫자만 사용하실 수 있습니다.";
		} 
		
	}
	
	function inputPwdInfoOnInputFnc() {
		var txtpwdObj = document.getElementById('txt_pwd');
		var txtenterguidepwdobj = document.getElementById('enter_guide_pwd');
		var txtpwdcorrectObj = document.getElementById('pwd_correct1'); 
		var txtpwderrorObj = document.getElementById('pwd_error1');
			
		if(txtpwdObj.value.length < 8 || txtpwdObj.value.length > 15) {
			txtpwderrorObj.innerHTML 
				= "안전한 사용을 위해 8자 이상 사용해주세요.";
			txtpwdcorrectObj.innerHTML 
				= "";
			
		} else if (txtpwdObj.value.length > 7 && txtpwdObj.value.length < 16) {
			txtpwderrorObj.innerHTML 
				= ""; 
			txtpwdcorrectObj.innerHTML 
				= "사용가능한 비밀번호 입니다.";
		}
		
	}
	
	function inputPwdInfoOnFocus() {
		var txtpwdObj = document.getElementById('txt_pwd');
		var txtenterguidepwdobj = document.getElementById('enter_guide_pwd');
		
		if (txtpwdObj.value == '비밀번호') {
			txtpwdObj.value = '';
		} 
		
		if (txtpwdObj.value == "") {
			txtenterguidepwdobj.innerHTML
				="안전한 사용을 위해 영문, 숫자, 특수문자 조합 8~15자를 사용해주세요.";
		} else {
			txtenterguidepwdobj.innerHTML = "";
		}
	}
	
	function inputPwdInfoOnBlur() {
		var txtpwdObj = document.getElementById('txt_pwd');
		var txtpwderrorObj = document.getElementById('pwd_error1');
		
	}
	
	function inputPwdReInfoOnFocus() {
		var txtpwdObj = document.getElementById('txt_pwd');
		var txtpwdReInputObj = document.getElementById('txt_pwdReInput');
		var txtrepwderror1Obj = document.getElementById('txt_repwd_error1');
		var txtrepwderror2Obj = document.getElementById('txt_repwd_error2');
		var txtrepwdcorrectObj = document.getElementById('txt_repwd_correct');
		
		if (txtpwdReInputObj.value == '비밀번호 재입력') {
			txtpwdReInputObj.value = '';
		}
	}
	
	function inputPwdReInfoOnBlur() {
		var txtpwdObj = document.getElementById('txt_pwd');
		var txtpwdReInputObj = document.getElementById('txt_pwdReInput');
		var txtrepwderror1Obj = document.getElementById('txt_repwd_error1');
		var txtrepwderror2Obj = document.getElementById('txt_repwd_error2');
		var txtrepwdcorrectObj = document.getElementById('txt_repwd_correct');
		
		if (txtpwdReInputObj.value == '비밀번호 재입력') {
			txtpwdReInputObj.value = '';
		}
		
		if (txtpwdReInputObj.value == '') {
			txtrepwderror1Obj.innerHTML = "비밀번호를 재입력해주세요.";
		} else if (txtpwdObj.value == txtpwdReInputObj.value ) {
			txtrepwderror1Obj.innerHTML = "";
		}
		
		if (txtpwdReInputObj.value == '') {
			txtrepwdcorrectObj.innerHTML = "";
			
		} else if (txtpwdObj.value != txtpwdReInputObj.value) {
			txtrepwderror1Obj.innerHTML = "비밀번호가 일치하지 않습니다.";
			txtpwdReInputObj.value = "";
			
		} else if (txtpwdObj.value == txtpwdReInputObj.value) {
			txtrepwdcorrectObj.innerHTML = "";
			txtrepwderror1Obj.innerHTML = "";
			txtrepwderror2Obj.innerHTML = "";
		} 
		
	}
	
	function inputEmailInfoOnClickFnc() {
		var email1Obj = document.getElementById('email_id');
		var emailerror1Obj = document.getElementById('email_id_error1');
		
		if (email1Obj.value == '') {
			emailerror1Obj.innerHTML = "이메일 주소를 입력해 주세요.";
		} else if (email1Obj.value != '') {
			emailerror1Obj.innerHTML = "";
		}
	}
	
	
	function inputEmailInfoOnFocus() {
		var email1Obj = document.getElementById('email_id');
		var emailerror1Obj = document.getElementById('email_id_error1');
		
		if (email1Obj.value == '이메일') {
			email1Obj.value = '';
		} 
		
		if (email1Obj.value != '') {
			emailerror1Obj.innerHTML = "";
		}
	}
	
	function inputEmailInfoOnBlur() {
		var email1Obj = document.getElementById('email_id');
		var emailerror1Obj = document.getElementById('email_id_error1');
		
		if (email1Obj.value == '') {
			email1Obj.value = '이메일';
			emailerror1Obj.innerHTML = "이메일 주소를 입력해 주세요.";
			
		} else if(email1Obj.value != '') {
			emailerror1Obj.innerHTML = "";
		}
		
	}	
	
	function checkAllSelectFnc() {
		const checkBoxes 
			= document.querySelectorAll('input[name="checkAgree"]');
		const checked 
			= document.querySelectorAll('input[name="checkAgree"]:checked');
		const selectAll 
			= document.querySelector('input[name="checkAllSelect"]');
		
			if (checkBoxes.length === checked.length) {
				selectAll.checked = true;
			}else {
				selectAll.checked = false;
			}
			
	}

	function checkAllAgreeFnc(checkAllAgreeFnc) {
	      
        var divObj = document.getElementById("agreeBox");
        var inputList = divObj.getElementsByTagName('input');
        
        if(inputList[0].checked == true){
           for (var i = 0; i < inputList.length; i++) {
              inputList[i].checked = true;
           }
        }else if(inputList[0].checked == false){
           for (var i = 0; i < inputList.length; i++) {
              inputList[i].checked = false;
           }
           
        }
     
  }
	
	function openPopup() {
        // 팝업 창을 여는 함수
        var popup = window.open("../popup.jsp", "popupWindow","width=400,height=300");
    }
	
	function joinformCheck() {
		
		var userName = document.getElementById('txt_name');
		var userId = document.getElementById('txt_id');
		var userPassword = document.getElementById('txt_pwd');
		var userPasswordRe = document.getElementById('txt_pwdReInput');
		var userEmailId = document.getElementById('email_id');
		var checkEssential1 = document.getElementById('agree1');
		var checkEssential2 = document.getElementById('agree2');
		var checkEssential3 = document.getElementById('agree3');
		var checkEssential4 = document.getElementById('agree4');
		var memberAddBtn = document.getElementById('memberAddButton');
		var agreeBoxObj = document.getElementById('agreeBox');
		var agreeList = agreeBoxObj.getElementsByTagName('input');
		
		if (userName.value == '') {
			alert('이름을 입력해주세요.');
			userName.focus();
			
			return false;
		}
		
		if (userId.value == '') {
			alert('ID를 입력해주세요');
			userId.focus();
			
			return false;
		} else if (userId.value.length < 4 || userId.value.length > 12 ) {
			alert('영문과 숫자를 혼합하여 4~12자 사용하여 입력해주세요.');
			userId.focus();
			
			return false;
		}
		
		if (userPassword.value == '') {
			alert('비밀번호를 재입력해주세요.');
			userPassword.focus();
			
			return false;
		}
		
		if (userPassword.value.length < 8 || userPassword.value.length > 15) {
			alert("영문과 숫자를 혼합하여 8~15자 사용하여 입력해주세요.");
			userPassword.focus();
			
			return false;
		}
		
		if (userPasswordRe.value == '') {
			alert('비밀번호를 다시 입력해주세요');
			userPasswordRe.focus();
			
			return false;
		}
		
		if (userPasswordRe.value != userPassword.value) {
			alert('처음 설정한 비밀번호를 다시 입력해주세요');
			userPasswordRe.focus();
			
			return false;
		}
		
		if (userEmailId.value == '') {
			alert('이메일 주소를 확인해주세요.');
			userPassword.focus();
			
			return false;
		} 
		
		if (!checkEssential1.checked == true) {
			alert('1. 약관 동의를 체크해주세요.');
			checkEssential1.focus();
			return false;
		}
		
		if (!checkEssential2.checked == true) {
			alert('2. 약관 동의를 체크해주세요.');
			checkEssential2.focus();
			return false;
		}
		if (!checkEssential3.checked == true) {
			alert('3. 약관 동의를 체크해주세요.');
			checkEssential3.focus();
			return false;
		}
		if (!checkEssential4.checked == true) {
			alert('4. 약관 동의를 체크해주세요.');
			checkEssential4.focus();
			return false;
		}
			
	}
	
	  function handleOptionChange(selectElement) {
          var userInputDiv = document.getElementById("userInputMailAdd");
          var selectDiv = document.getElementById("selectDiv");
          
          if (selectElement.value === "direct_input") {
              userInputDiv.style.display = "block"; // 동적 입력 영역 표시
              selectDiv.style.display = "block"; // select 필드 숨김
          } else {
              userInputDiv.style.display = "none"; // 동적 입력 영역 숨김
              selectDiv.style.display = "block"; // select 필드 표시
          }
      }

	</script>

</head>

<body>

	<div id="locbar_crop">
		<div class="holder">
			<a href="../auth/login" class="home">홈</a>
		</div>
	</div>
	<hr>
	
	<div id="tit_joinid">
		<h2 class="tit-join">
			옥션 회원가입
		</h2>
	</div>
	<form action="signup" method="post" onsubmit="return joinformCheck();">
	<div id="inputInfo">
		<p>1 정보입력</p>
		<div class="info-cont">
			<ul>
				<li class="entername_area">
					<input name="name" type="text" 
					id="txt_name" class="enter_name" 
					placeholder="이름"
					onfocus="inputNameInfoOnFocus();" 
					onblur="inputNameInfoOnBlur();"
					>
					<br>
					<span class="err_name"></span>
				</li>
				<li class="enterid_area">
					<input type="text" name="id"
					placeholder="아이디" id="txt_id"
					onclick="inputIdInfoOnClick();"
					oninput="inputIdOnInputFnc();"
					onfocus="inputIdInfoOnFocus();"
					onblur="inputIdInfoOnBlur();"
					>
					<br>
					<p id="enter_guide_id" style="color: gray;">
					</p>
					<p id="txt_id_correct1" style="color: #44D2D6;">
					</p>
					<p id="txt_id_error1" style="color: red;">
					</p>
					
				</li>
				<li class="enterpwd_area">
					<input type="password" name="pwd"
					value="비밀번호" id="txt_pwd"
					oninput="inputPwdInfoOnInputFnc();";
					onfocus="inputPwdInfoOnFocus();"
					onblur="inputPwdInfoOnBlur();"
					>
					<span class="pw-guide">
						<a onclick="openPopup();">비밀번호 도움말</a>
					</span>
					<p id="enter_guide_pwd" style="color: gray;">
					</p>
					<p id="pwd_correct1" style="color: #44D2D6;">
					</p>
					<p id="pwd_error1" style="color: red;">
					</p>	

				</li>
				<li class="reenterpwd_area">
					<input type="password" value="비밀번호 재입력"
					id="txt_pwdReInput"
					onfocus="inputPwdReInfoOnFocus();"
					onblur="inputPwdReInfoOnBlur();"
					>
					<p id="txt_repwd_error1" style="color:red; 
						font-size:10px;">
					</p>
					<p id="txt_repwd_error2" style="color:red; 
						font-size:10px;">
					</p>
					<p id="txt_repwd_correct" >
					</p>
				</li>
				<li class="enterphonenum_area">
					<span name="phoneNum" id="mobile_tell span">
						<select name="phoneNumber1"
							id="ddlMobileTell"
							title="휴대폰 앞자리 선택">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="0130">0130</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						<span class="selectbox">-</span>
						<input type="text" name="phoneNumber2"
							id="phoneNum2"
							>
						<span class="selectbox">-</span>
						<input type="text" name="phoneNumber3"
							id="phoneNum3"
							>
					</span>
				</li>
				<li class="enteremail_area">
					<span></span>
					<div style="width: 900px; height: 20px;">
					<input type="text" name="email" style="float:left;"
						placeholder="이메일"
						onclick="inputEmailInfoOnClickFnc();"
						onfocus="inputEmailInfoOnFocus();"
						onblur="inputEmailInfoOnBlur();"
						id="email_id">
					<span style="float:left;" id="email_span">@</span>
					<div id="selectDiv">
					<div id="userInputMailAdd" style="display: none; 
						float:left; margin-left: 2px;">
						<input type="text" name="emailAddress" 
							placeholder="직접 입력">
					</div>
					<select name="emailAddress" id="email_Domain" 
						style="float:left; margin-left: 5px;"
						onchange="handleOptionChange(this)">
						<option value="selectOption">선택</option>
						<option value="naver">naver.com</option>
						<option value="hanmail">hanmail.net</option>
						<option value="daum">daum.net</option>
						<option value="nate">nate.com</option>
						<option value="gmail">gmail.com</option>
						<option value="hotmail">hotmail.com</option>
						<option value="direct_input">직접입력</option>
					</select>
					</div>
					<p id="email_id_error1" style="color: red;"></p>
					</div>
				</li>
			</ul>
		</div>
	</div><!--inputInfo end-->
	
	<div id="agreeInfo">
		<span>2 약관동의</span>
		<div id="agree">
							
			<div id="agreeBox">
				<p><input type="checkbox" name="checkAllSelect" id="all_agree" 
					onclick="checkAllAgreeFnc(this);">
					<label>전체 동의</label>
				</p>
				<p><input type="checkbox" name="checkAgree" id="agree1"
					value="essential1" onclick="checkAllSelectFnc();">
					<label>옥션 이용약관</label>
					<span class="check_essential1">(필수)</span></p>
				<p><input type="checkbox" name="checkAgree" id="agree2"
					value="essential2" onclick="checkAllSelectFnc();">
					<label>전자금융거래 이용약관</label>
					<span class="check_essential2">(필수)</span></p>
				<p><input type="checkbox" name="checkAgree" id="agree3"
					value="essential3" onclick="checkAllSelectFnc();">
					<label>개인정보 수집 및 이용</label>
					<span  class="check_essential3">(필수)</span></p>
				<p><input type="checkbox" name="checkAgree" id="agree4"
					value="essential4" onclick="checkAllSelectFnc();">
					<label>만 14세 이상입니다</label>
					<span  class="check_essential4">(필수)</span></p>
				<p><input type="checkbox" name="checkAgree1" id="agree5"
					value="true" onclick="checkAllSelectFnc();">
					<label>개인정보 제3자(판매자) 제공</label>
					<span class="check_select1">(선택)</span></p>
				<p><input type="checkbox" name="checkAgree2" id="agree6"
					value="true" onclick="checkAllSelectFnc();">
					<label>개인정보 수집 및 이용</label>
					<span class="check_select2">(선택)</span></p>
				<p><input type="checkbox" name="checkAgree3" id="agree7"
					value="true" onclick="checkAllSelectFnc();">
					<label>위치정보 이용약관</label>
					<span class="check_select3">(선택)</span></p>
				<p><input type="checkbox" name="checkAgree4" id="agree8"
					value="true" onclick="checkAllSelectFnc();">
					<label>혜택 알림 이메일, 문자, 앱 푸시 수신</label>
					<span class="check_select4">(선택)</span></p>
			</div>
		</div>
	</div>
	
	<div id="buttonBox">
		<span class="guide_txt1">
			<p>
				고객의 동의를 거부할 권리가 있으며 동의를 거부할 경우,
				 사이트 가입 또는 일부 서비스 이용이 제한됩니다.
			</p>
		</span>	
	
		<div id="memberAddButton">
			<input type="submit" id="memAddBtn" value="회원가입" 
				onclick="joinformCheck();">
		</div>
		</form>
		<div id="memberCancelButton">
			<input type="button" id="memCancelBtn" value="취소" 
				onclick='location.href = "../auth/Login.jsp"'>
		</div>
	</div><!--buttonBox end-->
	
</body>
</html>
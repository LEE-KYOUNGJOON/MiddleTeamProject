<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="../css/header.css" rel="stylesheet" type="text/css">

<jsp:useBean
	id="member"
	scope="session"
	class="spms.dto.MemberDto"
/>

<header>
<div class="wrap">

<%
	if(member.getMid() != null){
%>

<div class="top">
	<div class="loginout">
	<a href="#"><%=member.getMname() %></a>&nbsp;
	<span>|</span>&nbsp;
	<a href="../auth/Logout.jsp">로그아웃</a>
	</div>
<%
	}else{
%>
<div class="loginout">
	<div class="top">
		<a href="../auth/Login.jsp">로그인</a>&nbsp;
		<span>|</span>&nbsp;
		<a href="../member/signup">회원가입</a>
		</div>
	</div>
<%
	}
%>

</div>
<div class="logowrap">
	<div class="logo">AUCTION.__________________</div>
</div>

<div class="menu">
	<div class="menu-wrap">
	<div class="menu-left">
		<span>전체 카테고리</span>
	</div>
		<div class="menu-list">
			<div class="list">쿠폰 포인트</div>
			<div class="list">베스트</div>
			<div class="list">스마일 배송</div>
			<div class="list">유니버스 클럽</div>
			<div class="list">사업자 클럽</div>
		</div>
	<div class="menu-right">
		<span>최근 본 상품</span>
	</div>
</div>
</div>
</div>
</header>


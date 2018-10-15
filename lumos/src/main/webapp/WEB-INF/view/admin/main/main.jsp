<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
* {
	box-sizing: border-box;
}

.main {
	display: flex;
	flex-direction: column;
	width: 100%;
	-webkit-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
}

@media ( min-width : 400px) {
	.main {
		flex-direction: row;
		width: 90%;
		height: 90%;
		margin: auto;
	}
}

.main section:hover {
	flex: 2;
}

.main section:hover:after {
	opacity: .8;
}

.main section:hover article {
	opacity: 1;
	-webkit-transform: translateY(0);
	transform: translateY(0);
	transition: opacity .2s .2s, -webkit-transform .2s .2s;
	transition: opacity .2s .2s, transform .2s .2s;
	transition: opacity .2s .2s, transform .2s .2s, -webkit-transform .2s
		.2s;
}

@media ( min-width : 400px) {
	main section:hover article {
		-webkit-transform: translateY(0) skewX(-15deg);
		transform: translateY(0) skewX(-15deg);
	}
}

/*  2 3 4   */
section {
	flex: 1;
	position: relative;
	width: 90%;
	min-height: 20vh;
	overflow: hidden;
	z-index: 1;
	transition: flex-grow .2s, opacity .2s;
	cursor: pointer;
}

/*  first    last      */
section:before {
	content: "";
	position: absolute;
	width: 90%;
	height: 90%;
	background-position: center;
	background-size: cover;
	transition: width .2s, -webkit-transform .2s;
	transition: transform .2s, width .2s;
	transition: transform .2s, width .2s, -webkit-transform .2s;
}

section:after {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 90%;
	height: 90%;
	opacity: 0;
	transition: opacity .2s;
	cursor: pointer;
}

@media ( min-width : 400px) {
	section {
		width: 20%;
		height: 70vh;
		margin-right: -1px;
		-webkit-transform: skewX(7deg) translateZ(0);
		transform: skewX(7deg) translateZ(0);
	}
	section:before {
		left: -100%; /* 휘게 만듦 */
		width: 300%;
		-webkit-transform: skewX(-7deg);
		transform: skewX(-7deg);
	}
}

section:nth-child(1):before {
	background-image:
		url("<%=cp%>/resource/images/lumos/adminMain-sales.jpg");
}

.hide-images section:nth-child(1):before {
	background-image: none;
}

section:first-child:after, section:last-child:after {
	opacity: .5;
}

section:nth-child(2):before {
	background-image:
		url("<%=cp%>/resource/images/lumos/adminMain-calendar.jpg");
}

.hide-images section:nth-child(2):before {
	background-image: none;
}

section:first-child:after, section:last-child:after {
	opacity: .5;
}

section:nth-child(3):before {
	background-image:
		url("<%=cp%>/resource/images/lumos/adminMain-staff.jpg");
}

.hide-images section:nth-child(3):before {
	background-image: none;
}

section:child:after {
	opacity: .5;
}

section:nth-child(4):before {
	background-image:
		url("<%=cp%>/resource/images/lumos/adminMain-membership.jpg");
}

.hide-images section:nth-child(4):before {
	background-image: none;
}

section:first-child:after, section:last-child:after {
	opacity: .5;
}

section:nth-child(5):before {
	background-image:
		url("<%=cp%>/resource/images/lumos/adminMain-rent.png");
}

.hide-images section:nth-child(5):before {
	background-image: none;
}

section:first-child:after, section:last-child:after {
	opacity: .5;
}

section:nth-child(6):before {
	background-image:
		url("<%=cp%>/resource/images/lumos/adminMain-customer.jpg");
}

.hide-images section:nth-child(6):before {
	background-image: none;
}

section:first-child:after, section:last-child:after {
	opacity: .5;
}

article {
	position: relative;
	padding: 24px;
	width: 100%;
	height: 90%;
	text-align: center;
	color: white;
	background-color: #072659; z-index : 1;
	transition: opacity .2s, -webkit-transform .2s;
	transition: opacity .2s, transform .2s;
	transition: opacity .2s, transform .2s, -webkit-transform .2s;
	z-index: 1;
}

@media ( min-width : 400px) {
	article {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		position: absolute;
		top: 0;
		right: 0;
		left: 0;
		margin: auto;
		opacity: 0;
		-webkit-transform: translateY(24px) skewX(-7deg);
		transform: translateY(24px) skewX(-7deg);
	}
}

h2 {
	font-size: 32px;
	margin-bottom: 12px;
}

.main p {
	font-size: 20px;
}












.logo {
	margin-left: 200px;
  font-size: 60pt;
  text-transform: uppercase;
  font-family: Lato;
  font-weight: 300;
}
.logo span:nth-child(1) {
  -webkit-animation: white_char 2s ease-in-out;
          animation: white_char 2s ease-in-out;
  -webkit-animation-fill-mode: forwards;
          animation-fill-mode: forwards;
}
.logo span:nth-child(2) {
  -webkit-animation: white_char 2.5s ease-in-out;
          animation: white_char 2.5s ease-in-out;
  -webkit-animation-fill-mode: forwards;
          animation-fill-mode: forwards;
}
.logo span:nth-child(3) {
  -webkit-animation: white_char 3s ease-in-out;
          animation: white_char 3s ease-in-out;
  -webkit-animation-fill-mode: forwards;
          animation-fill-mode: forwards;
}
.logo span:nth-child(4) {
  -webkit-animation: white_char 3.5s ease-in-out;
          animation: white_char 3.5s ease-in-out;
  -webkit-animation-fill-mode: forwards;
          animation-fill-mode: forwards;
}
.logo span:nth-child(5) {
  -webkit-animation: white_char 4s ease-in-out;
          animation: white_char 4s ease-in-out;
  -webkit-animation-fill-mode: forwards;
          animation-fill-mode: forwards;
}
.logo span:nth-child(6) {
  -webkit-animation: mint_char 5s ease-in-out;
          animation: mint_char 5s ease-in-out;
  -webkit-animation-fill-mode: forwards;
          animation-fill-mode: forwards;
  -webkit-animation-delay: 1s;
          animation-delay: 1s;
}
.logo span:nth-child(7), .logo span:nth-child(8) {
  -webkit-animation: mint_char 5.5s ease-in-out;
          animation: mint_char 5.5s ease-in-out;
  -webkit-animation-fill-mode: forwards;
          animation-fill-mode: forwards;
  -webkit-animation-delay: 1.5s;
          animation-delay: 1.5s;
}
.logo span:nth-child(9), .logo span:nth-child(10), .logo span:nth-child(11) {
  -webkit-animation: mint_char 6s ease-in-out;
          animation: mint_char 6s ease-in-out;
  -webkit-animation-fill-mode: forwards;
          animation-fill-mode: forwards;
  -webkit-animation-delay: 2s;
          animation-delay: 2s;
}
.logo span:nth-child(12), .logo span:nth-child(13) {
  -webkit-animation: mint_char 6.5s ease-in-out;
          animation: mint_char 6.5s ease-in-out;
  -webkit-animation-fill-mode: forwards;
          animation-fill-mode: forwards;
  -webkit-animation-delay: 2.5s;
          animation-delay: 2.5s;
}

@-webkit-keyframes white_char {
  100% {
    color: #072659;
    transition-property: color;
  }
}

@keyframes white_char {
  100% {
    color: #072659;
    transition-property: color;
  }
}
@-webkit-keyframes mint_char {
  100% {
    color: #aa1717;
    transition-property: color;
  }
}
@keyframes mint_char {
  100% {
    color: #aa1717;
    transition-property: color;
  }
}
</style>
<script src="https://codepen.io/shshaw/pen/QmZYMG.js"></script>

<div class="body-container">
	<div class="main" style="clear: both;">
		<section>
			<article
				onclick="location.href='<%=cp%>/admin/sales/salesSub/salesMain';">
				<h2>매출관리</h2>
				<p>전체 매출 조회, 공연 매출 조회, 전시 매출 조회, 아카데미 매출 조회</p>
			</article>
		</section>
		<section>
			<article
				onclick="location.href='<%=cp%>/admin/sales/salesSub/salesMain';">
				<h2>일정관리</h2>
				<p>공연 등록, 전시 등록, 강의 일정 등록</p>
			</article>
		</section>
		<section>
			<article
				onclick="location.href='<%=cp%>/admin/staff/staffs/stafflist';">
				<h2>직원관리</h2>
				<p>LUMOS 직원 목록, LUMOS 강사 목록</p>
			</article>
		</section>
		<section>
			<article
				onclick="location.href='<%=cp%>/admin/membership/regular/regularList';">
				<h2>회원관리</h2>
				<p>일반 회원, 기업 회원</p>
			</article>
		</section>
		<section>
			<article
				onclick="location.href='<%=cp%>/admin/rent/rental/list';">
				<h2>대관관리</h2>
				<p>대관 신청 목록, 대관 현황</p>
			</article>
		</section>
		<section>
			<article
				onclick="location.href='<%=cp%>/admin/customer/question/questionlist';">
				<h2>고객 관리</h2>
				<p>문의글 목록 조회, 유실물 목록 관리</p>
			</article>
		</section>
	</div>




<div class="logo">
		<span>L</span>
		<span>u</span>
		<span>m</span>
		<span>o</span>
		<span>s</span>
		<span>B</span>
		<span>u</span>
		<span>s</span>
		<span>i</span>
		<span>n</span>
		<span>e</span>
		<span>s</span>
		<span>s</span>
</div>


	
</div>






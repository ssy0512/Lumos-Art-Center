<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div class="headImg" style="background: url(<%=cp%>/resource/images/lumos/mypage_main_half_photo.jpg) no-repeat center;">
	<h1 class="headtitle">마이페이지</h1>
	<div class="titlefooter">
		<div class="blackDiv" style="background: url(<%=cp%>/resource/images/lumos/opacity45.png) repeat;">
			<div class="wrap">
				<ul class="left">
					<li>
						<img class="pfImg" src="<%=cp%>/resource/images/lumos/profile_w.png">
					</li>
					<li style="margin-left: 20px;">
						<p>
							<span style="padding-right: 15px;">로그인 사용자</span>
							<span style="padding-left: 15px;"> : 김자바(kimjava123)</span>
						</p>
						<p style="margin-top: 10px;">
							<span style="">사용가능 포인트</span>
							<span style="padding-left: 15px;"> : 0</span>
						</p>
					</li>
					<li style="margin-left: 15px;">
						<a href="" class="titlebtn">개인정보수정</a>
					</li>
				</ul>
				<ul class="right">
					<li style="padding-left: 50px;">
						<img class="infoImg" src="<%=cp%>/resource/images/lumos/info_w.png">
					</li>
					<li style="margin-left: 20px;">
						<p>회원구분
							<span style="padding-left: 15px;">
								: 개인회원
							</span>
						</p>
						<p style="margin-top: 15px;">가입일자
							<span style="padding-left: 15px;">
								: 2018.09.28
							</span>
						</p>
					</li>
				</ul>
			</div>
			<div style="clear: both; display: block;"></div>
		</div>
	</div>
</div>

<div class="mypage_gnb">
	<div class="wrap">
		<ul class="gnb">
			<li>
				<a>티켓예매내역</a>
			</li>
			<li>
				<a>수강신청내역</a>
			</li>
			<li>
				<a>관심작품</a>
			</li>
			<li>
				<a>활동내역</a>
			</li>
			<li>
				<a>마일리지</a>
			</li>
			<li>
				<a>개인정보관리</a>
			</li>
			<li>
				<a>회원탈퇴</a>
			</li>
		</ul>
	</div>
</div>
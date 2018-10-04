<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
	<div class="header-top">
	    <p style="margin: 2px;">
	    <div class="header-left">
			<ul class="header-left">
				<li><a href="<%=cp%>/">HOME</a></li>
				<li><a href="<%=cp%>/goods"  style="color: #aa1717;">ART SHOP</a></li>
				<c:if test="${sessionScope.member.userId=='admin'}">
					<li><a href="<%=cp%>/admin/main">관리자 페이지</a></li>
				</c:if>
			</ul>
	    </div>
	   
	    <div class="header-right">
			<ul class="header-right">
				<c:if test="${empty sessionScope.member}">
					<li><a href="<%=cp%>/member/login">로그인</a></li>
					<li><a href="<%=cp%>/">회원가입</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.member}">
					<span style="color:#434343; font-weight: bold;">${sessionScope.member.userName}</span>님
					<li><a href="<%=cp%>/mypage/main">마이페이지</a></li>
					<li><a href="<%=cp%>/member/logout">로그아웃</a></li>
				</c:if>
				<li><a href="<%=cp%>/customerCenter/main">고객센터</a></li>
				<li><a href="<%=cp%>/main/sitemap">사이트맵</a></li>
				<li><a href="<%=cp%>/">정보공개</a></li>
			</ul>
	    </div>
	 </div>
	 <div style="background: #aa1717;">
		<a href="<%=cp%>/" style="text-decoration: none;">
			<img src="<%=cp%>/resource/images/logo.png" style="float: left; padding-left: 20px; text-align:left;">
        </a>
	 	<ul class="menu" >
 			<li><a href="<%=cp%>/concert/main">공연예매</a>
		        <ul>
		        	<li><a href="<%=cp%>/concert/main">공연일정</a></li>
	        		<li><a href="<%=cp%>/concert/seatGuide">공연장 안내</a></li>
		        </ul>
		    </li>
		    <li><a href="<%=cp%>/exhibit/main">전시예매</a>
		    	<ul>
		        	<li><a href="<%=cp%>/exhibit/main">전시일정</a></li>
	        		<li><a href="<%=cp%>/exhibit/info">전시장 안내</a></li>
		        </ul>
		    </li>
		    <li><a href="<%=cp%>/academy/list">아카데미</a>
		    	<ul>
		        	<li><a href="<%=cp%>/academy/list">수강신청</a></li>
	        		<li><a href="<%=cp%>/academy/review/list">교육후기</a></li>
		        </ul>
		    </li>
		    <li><a href="<%=cp%>/community/event/eventTab">커뮤니티</a>
		    	<ul>
	        		<li><a href="<%=cp%>/">공연후기</a></li>
	        		<li><a href="<%=cp%>/">전시후기</a></li>
	        		<li><a href="<%=cp%>/community/event/eventTab">이벤트</a></li>
		        </ul>
		    </li>
		    <li><a href="<%=cp%>/">이용안내</a>
		    </li>
		    <li><a href="<%=cp%>/rentfront/main">대관안내</a>
		    	<ul>
		        	<li><a href="<%=cp%>/rentfront/notice/list">대관일정</a></li>
	        		<li><a href="<%=cp%>/">대관료 안내</a></li>
	        		<li><a href="<%=cp%>/">대관신청</a></li>
		        </ul>
		    </li>
	 	</ul>
	 </div>

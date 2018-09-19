<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/sitemap.css" type="text/css">
<div class="wrap">
	<h2 class="topTitle">사이트맵</h2>
	<div class="sitemapDiv">
		<div class="wrap" style="height:550px; margin-top: 60px">
			<div>
				<p style="font-weight: bold; line-height: 1.6; font-size: 16px;">공연예매</p>
				<ul>
					<li><a href="<%=cp%>/concert/main">공연일정</a></li>
					<li><a href="<%=cp%>/concert/info">공연장 안내</a></li>
				</ul>
			</div>
			<div>
				<p style="font-weight: bold; line-height: 1.6; font-size: 16px;">전시예매</p>
				<ul>
					<li><a href="<%=cp%>/exhibit/main">전시일정</a></li>
					<li><a href="<%=cp%>/exhibit/info">전시장 안내</a></li>
				</ul>
			</div>
			<div>
				<p style="font-weight: bold; line-height: 1.6; font-size: 16px;">아카데미</p>
				<ul>
					<li><a href="<%=cp%>/academy/main">수강신청</a></li>
					<li><a href="<%=cp%>/concert/main">교육후기</a></li>
				</ul>
			</div>
			<div>
				<p style="font-weight: bold; line-height: 1.6; font-size: 16px;">커뮤니티</p>
				<ul>
					<li><a href="<%=cp%>/concert/main">공지사항</a></li>
					<li><a href="<%=cp%>/concert/main">공연후기</a></li>
					<li><a href="<%=cp%>/concert/main">전시후기</a></li>
					<li><a href="<%=cp%>/concert/main">이벤트</a></li>
				</ul>
			</div>
			<div>
				<p style="font-weight: bold; line-height: 1.6; font-size: 16px;">이용안내</p>
				<ul>
					<li><a href="<%=cp%>/concert/main">이용안내</a></li>
				</ul>
			</div>
			<div>
				<p style="font-weight: bold; line-height: 1.6; font-size: 16px;">대관안내</p>
				<ul>
					<li><a href="<%=cp%>/concert/main">대관일정</a></li>
					<li><a href="<%=cp%>/concert/main">대여료 안내</a></li>
					<li><a href="<%=cp%>/concert/main">대여 신청</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
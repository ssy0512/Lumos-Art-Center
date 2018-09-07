<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="footer-menu">
	<ul>
		<li>
			<p><a href="">사이트맵</a></p>
		</li>
		<li>
			<p><a href="">이용약관 · 정책</a></p>
		</li>
		<li>
			<p><a href="">개인정보관리방침</a></p>
		</li>
		<li style="padding-right:0;">
			<p><a href="">홈페이지저작권보호정책</a></p>
		</li>
	</ul>
</div>

<div class="footer-bottom">
	<div class="footer-bottom-left">
		<img src="<%=cp%>/resource/images/logo_d.png" style="float: left; padding-left: 40px; padding-top:5px; text-align:left;">
	</div>
	<div class="footer-bottom-right">
		<p>
		(우) 서울 마포구 월드컵북로 21 Lumos Art Center | 대표자 류승희 | 사업자 등록번호 214-82-00264 | 통신판매업신고 서초 제 0706호<br>
		Lumos Art Center 고객센터 : 02-336-8546~8 (AM 09:00 - PM 08:00) | <a href="mailto:mailto lumos@lac.or.kr">lumos@lac.or.kr</a><br><br>
		copyrightⓒ2018 Lumos Art Center All rights Reserved.
		</p>
	</div>
</div>

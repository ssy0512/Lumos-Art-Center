<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/sitemap.css" type="text/css">
<div class="wrap">
	<h2 class="topTitle">����Ʈ��</h2>
	<div class="sitemapDiv">
		<div class="wrap" style="height:550px; margin-top: 60px">
			<div>
				<p style="font-weight: bold; line-height: 1.6; font-size: 16px;">��������</p>
				<ul>
					<li><a href="<%=cp%>/concert/main">��������</a></li>
					<li><a href="<%=cp%>/concert/info">������ �ȳ�</a></li>
				</ul>
			</div>
			<div>
				<p style="font-weight: bold; line-height: 1.6; font-size: 16px;">���ÿ���</p>
				<ul>
					<li><a href="<%=cp%>/exhibit/main">��������</a></li>
					<li><a href="<%=cp%>/exhibit/info">������ �ȳ�</a></li>
				</ul>
			</div>
			<div>
				<p style="font-weight: bold; line-height: 1.6; font-size: 16px;">��ī����</p>
				<ul>
					<li><a href="<%=cp%>/academy/main">������û</a></li>
					<li><a href="<%=cp%>/concert/main">�����ı�</a></li>
				</ul>
			</div>
			<div>
				<p style="font-weight: bold; line-height: 1.6; font-size: 16px;">Ŀ�´�Ƽ</p>
				<ul>
					<li><a href="<%=cp%>/concert/main">��������</a></li>
					<li><a href="<%=cp%>/concert/main">�����ı�</a></li>
					<li><a href="<%=cp%>/concert/main">�����ı�</a></li>
					<li><a href="<%=cp%>/concert/main">�̺�Ʈ</a></li>
				</ul>
			</div>
			<div>
				<p style="font-weight: bold; line-height: 1.6; font-size: 16px;">�̿�ȳ�</p>
				<ul>
					<li><a href="<%=cp%>/concert/main">�̿�ȳ�</a></li>
				</ul>
			</div>
			<div>
				<p style="font-weight: bold; line-height: 1.6; font-size: 16px;">����ȳ�</p>
				<ul>
					<li><a href="<%=cp%>/concert/main">�������</a></li>
					<li><a href="<%=cp%>/concert/main">�뿩�� �ȳ�</a></li>
					<li><a href="<%=cp%>/concert/main">�뿩 ��û</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
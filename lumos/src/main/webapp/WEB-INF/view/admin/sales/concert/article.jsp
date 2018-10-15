<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
.article {
	margin: 50px auto;
	width: 1300px;
	height: 650px;
	clear: both;
	border-top: 3px solid #072659;
	border-bottom: 3px solid #072659;
	border-radius: 50px;
	background-image: url("<%=cp%>/resource/images/lumos/adminConArticle.png");
}
.concertNum {
	float: right;
	margin: 25px 40px 20px 600px;
}
.article-image {
	margin: 80px 0px 80px 80px;
	float: left;
}
.article-image img {
	width: 300px; height: 400px;
}
.title {
	width: 900px;
	margin: 30px auto;
	float: left;
	border-spacing: 0px;
	border-collapse: collapse;
}
.article table {
	width: 700px;
	margin: 20px auto;
	float: left;
	line-height: 50px;
	border-spacing: 0px;
	border-collapse: collapse;
}
.article table tr, td {
	height: 30px;
	text-align: center;
}

/* 버튼 css */
.myButt {
	margin: 20px;
	width: 100px;
	height: 40px;
	outline: none;
	border: none;
	display: inline-block;
	cursor: pointer;
	background-color: transparent;
	position: relative;
	border: 1px solid #072659;
	border-radius: 7px;
	transition: all 0.5s ease;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	-ms-transition: all 0.5s ease;
}

.one {
	border-color: #072659;
	overflow: hidden;
	color: #ffffff;
	background-color: #072659;
}

.one .insider {
	background-color: #ffffff;
	width: 100%;
	height: 20px;
	position: absolute;
	left: -135px;
	transform: rotateZ(45deg);
	-webkit-transform: rotateZ(45deg);
	-moz-transform: rotateZ(45deg);
	-o-transform: rotateZ(45deg);
	-ms-transform: rotateZ(45deg);
}

.one:hover {
	background-color: #ffffff;
	border-color: #072659;
	color: #072659;
	font-weight: 600;
	cursor: pointer;
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	transform: scale(1.1);
	text-decoration: none;
}

.one:hover .insider {
	transition: all 0.3s ease;
	-webkit-transition: all 0.3s ease;
	-moz-transition: all 0.3s ease;
	-o-transition: all 0.3s ease;
	-ms-transition: all 0.3s ease;
	left: 135px;
}

.btn-div {
	width: 290px;
	margin: auto;
}
</style>
<div class="body-right" style="width: 1380px; height: 800px; margin: 0;">
	<div class="article">
		<div class="concertNum">공연번호 No.${dto.concertNum}</div>
		<div class="article-image">
			<c:if test="${not empty dto.conProfileImage}">
				<img src="<%=cp %>/uploads/image/${dto.conProfileImage}">
			</c:if>
			<c:if test="${empty dto.conProfileImage}">
				<img src="<%=cp %>/resource/images/lumos/noposter.png" style="border: 1px solid #eeeeee;">
			</c:if>
		</div>
		<table class="title">
			<tr>
				<td style="font-size: 20pt;">${dto.concertName}</td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<th>주최</th>
				<td>${dto.host}</td>
			</tr>
			<tr>
				<c:if test="${dto.host!='lac' && not empty dto.supervise}">
					<th>주관</th>
				</c:if>
				<c:if test="${dto.host!='lac' && not empty dto.supervise}">
					<td>${dto.supervise}</td>
				</c:if>
			</tr>
			<tr>
				<th>공연장</th>
				<td>${dto.hallName}</td>
			</tr>
			<tr>
				<th>공연일정</th>
				<td>${dto.concertStart}~${dto.concertEnd}</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${dto.seatPriceList}</td>
			</tr>
			<tr>
				<th>총매출</th>
				<td>${totalSum}</td>
			</tr>
		</table>
		<div class="btn-div">
			<button type="button" class="myButt one"
				onclick="javascript:location.href='<%=cp%>/admin/sales/concert/salesList';">
				<div class='insider'></div>
				목록으로
			</button>
			<button type="button" class="myButt one"
				onclick="javascript:location.href='<%=cp%>/admin/sales/concert/total?concertNum=${dto.concertNum}';">
				<div class='insider'></div>
				매출상세
			</button>
		</div>
	</div>
</div>
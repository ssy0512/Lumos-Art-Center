<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
.exhibit-article {
	margin: 50px auto;
	width: 850px;
	height: 740px;
	clear: both;
	border: 1px solid #333333;
	border-radius: 50px;
}

.exhibit-article-image {
	margin: 20px 320px;
}

.exhibit-title {
	width: 700px;
	margin: 10px auto;
	border-spacing: 0px;
	border-collapse: collapse;
}

.exhibit-table {
	width: 700px;
	margin: 10px auto;
	border-spacing: 0px;
	border-collapse: collapse;
}

.exhibit-table tr, td {
	height: 30px;
	text-align: center;
}
.exhibit-table tr {
	border-bottom: 1px solid #072659;
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
	<div class="exhibit-article">
		<div style="float: right; margin: 25px 40px 20px 600px;">공연번호
			No.${dto.concertNum}</div>
		<div class="exhibit-article-image">
			<img
				src="https://cdn.pixabay.com/photo/2015/02/02/15/28/bar-621033_960_720.jpg"
				style="width: 220px; height: 220px; border-radius: 110px;">
		</div>
		<table class="exhibit-title">
			<tr>
				<td style="font-size: 20pt;">${dto.concertName}</td>
			</tr>
		</table>
		<br>
		<table class="exhibit-table">
			<tr>
				<th colspan="2">주최</th>
				<td>${dto.host}</td>
				<c:if test="${dto.host!='lac' && not empty dto.supervise}">
					<th colspan="2">주관</th>
				</c:if>
				<c:if test="${dto.host!='lac' && not empty dto.supervise}">
					<td>${dto.supervise}</td>
				</c:if>
				<th>공연장</th>
				<td>${dto.hallName}</td>
			</tr>
		</table>
		<table class="exhibit-table">
			<tr>
				<th style="width: 230px;">공연일정</th>
				<td style="width: 300px;">${dto.concertStart}~${dto.concertEnd}</td>
			</tr>
		</table>
		<table class="exhibit-table">
			<tr>
				<th style="min-width: 190px;">가격</th>
				<td>${dto.seatPriceList}</td>
			</tr>
		</table>
		<table class="exhibit-table">
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
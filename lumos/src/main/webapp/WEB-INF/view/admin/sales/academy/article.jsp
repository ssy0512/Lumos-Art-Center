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
	width: 1300px;
	height: 650px;
	clear: both;
	border-top: 3px solid #072659;
	border-bottom: 3px solid #072659;
	border-radius: 50px;
	background-image: url("<%=cp%>/resource/images/lumos/adminAcaArticle.png");
}

.exhibitNum {
	float: right;
	margin: 25px 40px 20px 600px;
}

.exhibit-article-image {
	margin: 80px 0px 80px 80px;
	float: left;
}

.exhibit-article-image img {
	width: 300px; height: 400px;
}

.exhibit-title {
	width: 900px;
	margin: 30px auto;
	float: left;
	border-spacing: 0px;
	border-collapse: collapse;
}

.exhibit-table {
	width: 650px;
	margin: 20px auto;
	float: left;
	line-height: 50px;
	border-spacing: 0px;
	border-collapse: collapse;
}

.exhibit-table tr, td {
	height: 30px;
	text-align: center;
}

/* 버튼 css */
.myButt {
	margin: 0 30px;
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
	width: 350px;
	margin: auto;
	clear: both;
}

</style>
<div class="body-right" style="width: 1380px; height: 800px; margin: 0;">
	<div class="exhibit-article">
		<div class="exhibitNum">강의번호 No.${dto.academyNum}
		</div>
			<div class="exhibit-article-image">
				<c:if test="${not empty dto.acProfileImage}">
					<img src="<%=cp %>/uploads/image/${dto.acProfileImage}">
				</c:if>
				<c:if test="${empty dto.acProfileImage}">
					<img src="<%=cp%>/resource/images/lumos/noposter.png"
					style="border: 1px solid #eeeeee;">
				</c:if>
			</div>
		<table class="exhibit-title">
			<tr>
				<td style="font-size: 20pt;">${dto.academyName}</td>
			</tr>
		</table><br><br>
		<table class="exhibit-table">
			<tr>
				<th>강사</th>
				<td>${dto.instName}</td>
			</tr>
			<tr>
				<th>수강기간</th>
				<td>${dto.startDate} ~ ${dto.endDate}</td>
			</tr>
			<tr>
				<th>장소</th>
				<td style="width: 300px;">${dto.position}&nbsp;${dto.roomName}</td>
			</tr>
			<tr>
				<th>수강인원</th>
				<td>${dto.addCount}</td>
			</tr>
			<tr>
				<th style="min-width: 260px;">수강료</th>
				<td>${dto.price}</td>
			</tr>
			<tr>
				<th>총매출</th>
				<td>${totalSum}</td>
			</tr>
		</table>
		<div class="btn-div">
			<button type="button" class="myButt one"
				onclick="javascript:location.href='<%=cp%>/admin/sales/academy/salesList';">
				<div class='insider'></div>
				목록으로
			</button>
			<button type="button" class="myButt one"
				onclick="javascript:location.href='<%=cp%>/admin/sales/academy/total?academyNum=${dto.academyNum}';">
				<div class='insider'></div>
				매출상세
			</button>
		</div>
	</div>
</div>
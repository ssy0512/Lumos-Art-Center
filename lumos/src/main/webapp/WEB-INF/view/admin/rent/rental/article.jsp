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
	height: 700px;
	clear: both;
	border-top: 3px solid #072659;
	border-bottom: 3px solid #072659;
	border-radius: 50px;
	background-image: url("<%=cp%>/resource/images/lumos/adminRentArticle.png");
}
.rentNum {
	float: right;
	margin: 25px 40px 20px 600px;
}
.article-title {
	width: 900px;
	margin: 0 auto;
	border-spacing: 0px;
	border-collapse: collapse;
}
.article-table {
	width: 900px;
	margin: 10px auto;
	border-spacing: 0px;
	border-collapse: collapse;
	border-bottom: 1px solid #072659;
	font-size: 12pt;
}
.article-table thead {
	background-color: #072659;
	color: #ffffff;
}
.article-table thead tr, tbody tr {
	height: 40px;
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

p {
	margin: auto;
	font-size: 15pt;
}

</style>

<div class="body-right" style="width: 1380px; height: 800px; margin: 0;">
	<div class="article">
		<div class="rentNum">전시번호 No.${dto.rentNum}
		</div>
		<table class="article-title">
			<tr>
				<td style="font-size: 20pt;">${dto.planName} (${dto.processName})</td>
			</tr>
		</table><br><br>
		<table class="article-table">
			<thead><tr><th colspan="6">기본 정보</th></tr></thead>
			<tbody>
				<tr>
					<th>주최</th>
					<td>${dto.host}</td>
					<c:if test="${dto.host!='lac' && not empty dto.supervise}">
						<th>주관</th>
						<td>${dto.supervise}</td>
					</c:if>
					<th>장소</th>
					<td>${dto.placeNum}</td>
				</tr>
			</tbody>
		</table><br>
		<table class="article-table">
			<thead><tr><th colspan="4">세부 정보</th></tr></thead>
			<tbody>
				<tr>
					<th>대관일</th>
					<td>${dto.startDate} ~ ${dto.endDate}</td>
					<th>행사횟수</th>
					<td>${dto.eventCount}</td>
				</tr>
				<tr>
					<th>장르</th>
					<td>${dto.genre}</td>
					<th>등급</th>
					<td>${dto.ratingName}</td>
				</tr>
			</tbody>
		</table><br>
		<table class="article-table">
			<thead><tr><th colspan="4">기업 회원 정보</th></tr></thead>
			<tbody>
				<tr>
					<th>아이디</th>
					<td>${dto.chargeName} (${dto.chargeId})</td>
					<th>회사명</th>
					<td>${dto.companyName}</td>
				</tr>
				<tr>
					<th>전화번호</th><td>${dto.chargeTel}</td>
					<th>이메일</th><td>${dto.chargeEmail}</td>
				</tr>
			</tbody>
		</table>
		
		<div class="btn-div">
			<button type="button" class="myButt one"
				onclick="javascript:location.href='<%=cp%>/admin/rent/rental/list';">
				<div class='insider'></div>
				목록으로
			</button>
		</div>
	</div>
</div>
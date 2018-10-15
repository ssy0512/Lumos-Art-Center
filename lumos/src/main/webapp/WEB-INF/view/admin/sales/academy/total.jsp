<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
.top {
	margin-top: 15px;
}
.total-top {
	width: 1380px;
	margin: 20px auto;
	text-align: left;
}

.total-table {
	width: 1380px;
	margin: 10px auto;
	border-spacing: 0px;
	border-collapse: collapse;
}

.total-table thead {
	background-color: #072659;
	color: #ffffff;
}

.total-table tr, td {
	height: 40px;
	text-align: center;
}
.total-table tr {
	border-bottom: 1px solid #072659;
}

/* 버튼 css */
.myButt {
	margin: 20px auto;
	width: 100px;
	height: 40px;
	outline: none;
	border: none;
	display: block;
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
</style>
<div class="body-right" style="width: 1380px; height: 800px; margin: 0;">
	<div class="exhibit-article">
		<c:if test="${totalCount!=0}">
			<div class="top">
				<img src="<%=cp %>/resource/images/lumos/adminSalesAcademy.png">
			</div>
			<div class="total-top">
			전체 ${totalCount} (${page}/${total_page} 페이지)
			</div>
			<table class="total-table">
				<thead>
					<tr>
						<th>승인번호</th>
						<th>아이디(회원번호)</th>
						<th>결제금액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.approveNum}</td>
						<td>${dto.userId} (${dto.memberIndex})</td>
						<td>${dto.price}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	<br>
	<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${totalCount==0}">결제된 내역이 없습니다.</c:if>
		<c:if test="${totalCount!=0}">${paging}</c:if>
	</div>
	<br>
		<button type="button" class="myButt one"
			onclick="javascript:location.href='<%=cp%>/admin/sales/academy/salesList';">
			<div class='insider'></div>
			목록으로
		</button>
	</div>
</div>
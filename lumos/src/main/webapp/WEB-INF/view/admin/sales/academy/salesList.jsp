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
.salesList-main {
	margin-top: 20px;
	width: 1380px;
	clear: both;
	font-size: 12pt;
}
.salesList-main-table {
	width: 1380px;
	text-align: center;
	border-spacing: 0px;
	border-collapse: collapse;
}
.salesList-main-table thead {
	border-top: 1px solid #072659;
	border-bottom: 1px solid #072659;
}
.salesList-main-table th {
	height: 41px;
}
.salesList-main-table tbody tr {
	height: 41px;
	border-bottom: 1px solid #cccccc;
	overflow: hidden;
}
.salesList-main-table tbody tr:hover {
	cursor: pointer;
}
.bottom-dataCount {
	margin: 20px 0;
	width: 1380px;
}
</style>

<div class="body-right" style="width: 1380px; height: 800px;">
	<c:if test="${dataCount!=0}">
		<div class="top">
			<img src="<%=cp %>/resource/images/lumos/adminSalesAcademy.png">
		</div>
		
		<div class="salesList-main">
			<table class="salesList-main-table">
				<thead>
					<tr>
						<th>강의번호</th>
						<th>강의명</th>
						<th>강사</th>
						<th>수강기간</th>
						<th>수강인원</th>
						<th>수강료</th>
						<th>장소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr onclick="location.href='<%=cp%>/admin/sales/academy/article?page=${page}&academyNum=${dto.academyNum}';">
							<td>${dto.academyNum}</td>
							<td style="width: 350px;">${dto.academyName}</td>
							<td>${dto.instName}</td>
							<td>${dto.startDate} ~ ${dto.endDate}</td>
							<td>${dto.addCount}</td>
							<td>${dto.price}</td>
							<td>${dto.position}&nbsp;${dto.roomName}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="bottom-dataCount">
			전체 ${dataCount} (${page}/${total_page} 페이지)
		</div>
	</c:if>
	
	<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${dataCount==0}">등록된 강의가 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>
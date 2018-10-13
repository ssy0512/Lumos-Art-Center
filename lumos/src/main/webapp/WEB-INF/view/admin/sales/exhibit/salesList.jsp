<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
.sales-top {
	margin: 20px auto;
	width: 1380px;
}
.salesList-main {
	margin-top: 20px;
	width: 1380px;
	clear: both;
	font-size: 12pt;
}
.salesList-main-table {
	margin: 0;
	width: 1380px;
	text-align: center;
	border-spacing: 0px;
	border-collapse: collapse;
	overflow: hidden;
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
}
.salesList-main-table tbody tr:hover {
	cursor: pointer;
}
</style>

<div class="body-right" style="width: 1380px; height: 800px;">
	<c:if test="${dataCount!=0}">
		<div class="sales-top">
			<div class="sales-top-page">
				전체 ${dataCount} (${page}/${total_page} 페이지)
			</div>
		</div>
		
		<div class="salesList-main">
			<table class="salesList-main-table">
				<thead>
					<tr>
						<th>전시번호</th>
						<th>전시명</th>
						<th>전시일</th>
						<th>주최</th>
						<th>주관</th>
						<th>전시장</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr onclick="location.href='<%=cp%>/admin/sales/exhibit/article?page=${page}&exhibitNum=${dto.exhibitNum}';">
							<td>${dto.exhibitNum}</td>
							<td>${dto.exhibitName}</td>
							<td>${dto.exhibitStart} ~ ${dto.exhibitEnd}</td>
							<td>${dto.host}</td>
							<td>${dto.supervise}</td>
							<td>${dto.hallName}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
	
	<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${dataCount==0}">등록된 공연이 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>
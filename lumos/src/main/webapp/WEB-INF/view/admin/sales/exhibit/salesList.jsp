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
	margin: 0;
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
	margin-top: 20px;
	width: 1380px;
}



.boxTF {
	width: 300px;
}
.list-btn {
	margin: 0 5px;
	width: 96px; height: 30px;
	float: right;
	align-content: center; align-items: center;
	background-color: #072659;
	border: 1px solid #072659; border-radius: 5px;
	color: #ffffff;
	font-size: 12pt; font-family: 'Varela Round', sans-serif;
	display: inline-flex;
	cursor: pointer;
	transition: all 0.5s ease;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	-ms-transition: all 0.5s ease;
}
.list-btn:hover {
	cursor: pointer;
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	transform: scale(1.1);
	text-decoration: none;
}
</style>

<div class="body-right" style="width: 1380px; height: 800px;">
	<c:if test="${dataCount!=0}">
		<div class="top">
			<img src="<%=cp %>/resource/images/lumos/adminSalesExhibit.png">
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
							<td style="width: 450px;">${dto.exhibitName}</td>
							<td>${dto.exhibitStart} ~ ${dto.exhibitEnd}</td>
							<td>${dto.host}</td>
							<td>${dto.supervise}</td>
							<td>${dto.hallName}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="bottom-dataCount">
			<form action="searchForm" action="<%=cp%>/admin/sales/exhibit/salesList" method="post">
				<span>전체 ${dataCount} (${page}/${total_page} 페이지)</span>
				
				<select name="searchKey" class="selectField" style="margin-left: 25%;">
						<option value="exhibitNum">전시번호</option>
						<option value="exhibitName">전시명</option>
					</select>
					<input type="text" name="searchValue" class="boxTF">
					<button type="button" class="btn" onclick="searchList()" style="margin: 5px">
						&nbsp;검색&nbsp;
					</button>
				
				<button type="button" class="list-btn" onclick="javascript:location.href='<%=cp%>/admin/sales/exhibit/listCards';">
					<img src="<%=cp%>/resource/images/lumos/membershipCards.png" style="width: 17px; height: 17px; margin: 5px 0 3px 5px;">
						&nbsp;&nbsp;앨범형&nbsp;&nbsp;
				</button>
				<button type="button" class="list-btn" onclick="javascript:location.href='<%=cp%>/admin/sales/exhibit/salesList';">
					<img src="<%=cp%>/resource/images/lumos/membershipListBtn.png" style="width: 16px; height: 16px; margin: 5px 3px 2px 5px;">
						&nbsp;목록형&nbsp;&nbsp;
				</button>
			</form>
		</div>
	</c:if>
	
	
	<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${dataCount==0}">등록된 공연이 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>
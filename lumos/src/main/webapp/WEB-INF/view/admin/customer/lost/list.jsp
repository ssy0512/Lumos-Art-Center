<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style type="text/css">
.concert-top {
	width: 1580px; height: 50px; margin-top: 40px;
}
.concert-top-page {
	float: left; margin: 10px 0 0 7px;
	font-size: 12pt;
}
.concert-top-search {
	align-content: center; text-align: center;
}
.concertlist-table {
	width: 1580px; margin: 0px;
	border-spacing: 0px;
	border-collapse: collapse;
	overflow: hidden;
}
.concertlist-table thead tr {
	height: 41px;
	border-top: 1px solid #072659;
	border-bottom: 1px solid #072659;
}
.concertlist-table tbody tr {
	height: 41px;
	border-bottom: 1px solid #cccccc;
	text-align: center;
}
.concertlist-table tr:hover {
	cursor: pointer;
}
.concert-top-layout {
	float: right;
}
.concert-top-layout button, .btn {
	cursor: pointer;
	font-size: 12pt;
	font-family: 'Varela Round', sans-serif;
	display: inline-flex;
	align-items: center;
}
.boxTF {
	width: 300px;
}
.list-btn {
	width: 96px; height: 30px;
	margin: 0 5px;
	align-content: center; align-items: center;
	background-color: #072659;
	border: 1px solid #072659;
	border-radius: 5px;
	color: #ffffff;
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

<script type="text/javascript">
	function searchList() {
		var f = document.searchForm;
		f.submit();
	}
</script>

<div class="body-right" style="width: 1580px; height: 800px;">
	<c:if test="${dataCount!=0}">
		<div class="concert-top">
			<div class="concert-top-page">
				전체 ${dataCount} (${page}/${total_page} 페이지)
			</div>

		</div>
		
		<div style="clear: both; margin-top: 20px; font-size: 12pt;">
			<table class="concertlist-table">
				<thead>
					<tr>
						<th style="width: 90px;">번호</th>
						<th style="width: 150px;">분실자명</th>
						<th style="width: 150px;">분실물품</th>
						<th style="width: 150px;">분실장소</th>
						<th style="width: 150px;">분실일자</th>
						<th style="width: 150px;">전화</th>
						<th style="width: 150px;">이메일</th>
						<th style="width: 150px;">상태</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr onmouseover="this.style.background='#f2f8fa'" onmouseout="this.style.background='#ffffff'"
						onclick="location.href='<%=cp%>/admin/customer/lost/article?&page=${page}&lostNum=${dto.lostNum}';">
							<td>${dto.lostNum}</td>
							<td>${dto.lostPerson}</td>
							<td>${dto.lostName}</td>
							<td>${dto.lostPlace}</td>
							<td>${dto.lostDate}</td>
							<td>${dto.tel}</td>
							<td>${dto.email}</td>
							<td>${dto.lostStatusName}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
				<table style="width:1580px; margin:10px auto; border-spacing:0px">
		<tr height="40">
				<td align="left" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/customer/lost/main';">새로고침</button>
				</td>
		</tr>
	</table>
		</div>
	</c:if>

	<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${dataCount==0}">등록된 유실물 접수가 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>
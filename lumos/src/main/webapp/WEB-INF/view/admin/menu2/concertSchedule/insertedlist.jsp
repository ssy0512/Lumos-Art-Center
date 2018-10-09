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

<div class="body-right" style="width: 1380px; height: 800px;">
	<c:if test="${dataCount!=0}">
		<div class="concert-top">
			<div class="concert-top-page">
				전체 ${dataCount} (${page}/${total_page} 페이지)
			</div>

			<div class="concert-top-search">
				<form action="searchForm" action="<%=cp%>/admin/menu2/concertSchedule/insertedlist" method="post">
					<select name="searchKey" class="selectField">
						<option value="concertName">공연명</option>
						<option value="hallName">공연장</option>
						<option value="concertStart">시작일</option>
					</select>
					<input type="text" name="searchValue" class="boxTF">
					<button type="button" class="btn" onclick="searchList()" style="margin: 5px">&nbsp;검색&nbsp;</button>
					
					<div class="concert-top-layout">
						<button type="button" class="list-btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/concertSchedule/insertedlist';">
							<img src="<%=cp%>/resource/images/lumos/membershipListBtn.png" style="width: 17px; height: 17px; margin: 5px 0 3px 5px;">
								&nbsp;&nbsp;목록형&nbsp;&nbsp;
						</button>
						<button type="button" class="list-btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/concertSchedule/concertcards';">
							<img src="<%=cp%>/resource/images/lumos/membershipCards.png" style="width: 17px; height: 17px; margin: 5px 0 3px 5px;">
								&nbsp;&nbsp;앨범형&nbsp;&nbsp;
						</button>
					</div>
				</form>
			</div>
		</div>
		
		<div style="clear: both; margin-top: 20px; font-size: 12pt;">
			<table class="concertlist-table">
				<thead>
					<tr>
						<th style="width: 90px;">번호</th>
						<th style="width: 300px;">공연명</th>
						<th style="width: 150px;">공연장소</th>
						<th style="width: 150px;">공연시작일</th>
						<th style="width: 150px;">공연마감일</th>
						<th style="width: 150px;">관람등급</th>
						<th style="width: 150px;">주최</th>
						<th style="width: 150px;">주관</th>
						<th style="width: 150px;">장르</th>
						<th style="width: 150px;">총 시간</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr
							onclick="location.href='<%=cp%>/admin/menu2/concertSchedule/article?&page=${page}&concertNum=${dto.concertNum}';">
							<td>${dto.listNum}</td>
							<td>${dto.concertName}</td>
							<td>${dto.hallName}</td>
							<td>${dto.concertStart}</td>
							<td>${dto.concertEnd}</td>
							<td>${dto.ratingName}</td>
							<td>${dto.host}</td>
							<td>${dto.supervise}</td>
							<td>${dto.genre}</td>
							<td>${dto.totalTime}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
				<table style="width:1580px; margin:10px auto; border-spacing:0px">
		<tr height="40">
				<td align="left" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/concertSchedule/insertedlist';">새로고침</button>
				<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/concert/main';">CLIENT</button>
			
				</td>
				<td align="right" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/concertSchedule/created';">등록하기</button>
				</td>
		</tr>
	</table>
		</div>
	</c:if>
<!--  이곳에 가격을 넣을 수 있는 곳을 찾아야함. 중요쓰 중요쓰야  -->
	<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${dataCount==0}">등록된 공연이 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>
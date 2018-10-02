<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>


.concertsList-tr td{
	height: 35px;
}

.concertsList-tr:hover{
	cursor: pointer;
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
		<div style="width: 1380px; height: 35px; margin-top: 15px;">
			<div style="width: 200px; float: left; margin-left: 10px">
				${dataCount}개(${page}/${total_page} 페이지)
			</div>

			<div style="float: right; text-align: center;">
				<form action="searchForm" action="<%=cp%>/admin/menu2/concertSchedule/insertedlist" method="post">
					<select name="searchKey" class="selectField">
						<option value="concertName">공연명</option>
						<option value="hallName">공연장명</option>
						<option value="concertStart">공연시작일</option>
						<option value="host">주관</option>
					</select> <input type="text" name="searchValue" class="boxTF">
					<button type="button" class="btn" onclick="searchList()" style="width: 60px;">검색</button>
				</form>
			</div>
		</div>
		<div style="clear: both; margin-top: 5px;">
			<table style="width: 1380px; margin: 0px; border-spacing: 0px; border-collapse: collapse;">
				<thead style="background-color: #efefef;">
					<tr style="height: 30px;">
						<th style="width: 100px;">번호</th>
						<th style="width: 150px;">공연명</th>
						<th style="width: 150px;">공연장소</th>
						<th style="width: 150px;">공연시작일</th>
						<th style="width: 150px;">공연마감일</th>
						<th style="width: 100px;">관람등급</th>
						<th style="width: 100px;">주최</th>
						<th style="width: 150px;">주관</th>
						<th style="width: 150px;">장르</th>
						<th style="width: 100px;">관람시간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr class="concertsList-tr" align="center" style="border-bottom: 1px solid #cccccc"
							onclick="location.href='<%=cp%>/admin/menu2/concertSchedule/article?&page=${page}&listNum=${dto.listNum}'">
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
			
			<table style="width:100%; margin:10px auto; border-spacing:0px">
		<tr height="40">
				<td align="left" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/concertSchedule/insertedlist';">새로고침</button>
				</td>
				<td align="right" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/concertSchedule/created';">등록하기</button>
				</td>
		</tr>
	</table>
		</div>
	</c:if>
	
	
	<div class="paging"
		style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${dataCount==0}">등록된 공연이 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
	function searchList() {
		var f = document.searchForm;
		f.submit();
	}

	// tr rowspan 동적 추가
	$(".first").each(function() {
		var rows = $(".first:contains('" + $(this).text() + "')");
		if (rows.length > 1) {
			rows.eq(0).attr("rowspan", rows.length);
			rows.not(":eq(0)").remove();
		}
	});
</script>

<div class="body-container">
	<div id="tab-content" style="clear: both; padding: 35px 0 84px">
		<table
			style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
			<tr align="center" bgcolor="#eeeeee" height="44"
				style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<th width="200">
					<div class="tab_year"
						style="padding-bottom: 5px; text-align: center; margin: 0px 28px;">
						<span class="prebtnYear" style="background-color: #eeeeee;">＜</span>
						<span class="titleDate" id="current-year" data-year="${year}">${year}</span>
						<span class="nextbtnYear" style="background-color: #eeeeee;">＞</span>
					</div>
				</th>
				<th width="122" style="color: #434343;">기간</th>
				<th width="116" style="color: #434343;">장르</th>
				<th style="color: #434343;">공연명</th>
				<th width="180" align="left">
					<form name="searchForm" action="<%=cp%>/concert/year" method="post">
						<select name="searchKey" class="selectBox">
							<option value="all">전체</option>
							<option value="A">A홀</option>
							<option value="B">B홀</option>
							<option value="C">C홀</option>
							<option value="D">D홀</option>
							<option value="E">E홀</option>
							<option value="F">F홀</option>
						</select>
					</form>
				</th>
			</tr>
			<c:forEach var="cnt" begin="1" end="12">
				<c:set var="flag" value="0" />
				<c:forEach var="dto" items="${list }">
					<c:if test="${cnt == dto.endmonth }">
						<c:set var="flag" value="1" />
						<tr align="center" bgcolor="#ffffff" height="35"
							style="border-bottom: 1px solid #cccccc;">
							<td style="font-size: 27px;" class="first">${cnt }월</td>
							<td>${dto.concertStart}~${dto.concertEnd}</td>
							<td>${dto.genre}</td>
							<td style="text-align: left; padding-left: 18px;" >
								<span style="cursor: pointer;" onclick='goArticle(${dto.getConcertNum()});'>${dto.concertName}</span></td>
							<td style="text-align: left; padding-left: 50px;">
								${dto.hallName}</td>
						</tr>
					</c:if>
				</c:forEach>
				
				<c:if test="${flag == 0}">
					<tr align="center" bgcolor="#ffffff" height="35"
						style="border-bottom: 1px solid #cccccc;">
						<td style="font-size: 27px;" rowspan="1">${cnt }월</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td style="text-align: left; padding-left: 18px;">공연 일정이
							없습니다.</td>
						<td>&nbsp;</td>
					</tr>
				</c:if>

			</c:forEach>
		</table>
	</div>

</div>
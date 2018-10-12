<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
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
						<a style="left:0; background: url(<%=cp%>/resource/images/lumos/bg_btn_prev.gif) no-repeat 50% 50%;" class="prebtnYear" style="background-color: #eeeeee;"></a>
						<span class="titleDate" id="current-year" data-year="${year}">${year}</span>
						<a style="right:0; background: url(<%=cp%>/resource/images/lumos/bg_btn_next.gif) no-repeat 50% 50%;" class="nextbtnYear" style="background-color: #eeeeee;"></a>
					</div>
				</th>
				<th width="140" style="color: #434343;">기간</th>
				<th width="140" style="color: #434343;">장르</th>
				<th style="color: #434343;">전시명</th>
				<th width="140">장소</th>
			</tr>
			<c:forEach var="cnt" begin="1" end="12">
				<c:set var="flag" value="0" />
				<c:forEach var="dto" items="${list }">
					<c:if test="${(cnt<=dto.startmonth && cnt>=dto.endmonth)||
								(cnt == dto.endmonth || cnt == dto.startmonth) || 
								(cnt == dto.endmonth && dto.endmonth<dto.startmonth)||
								(cnt == dto.startmonth && dto.endmonth<dto.startmonth)||
								
								(cnt>=dto.startmonth && cnt<=dto.endmonth)}">
						<c:set var="flag" value="1" />
						<tr align="center" bgcolor="#ffffff" height="35"
							style="border-bottom: 1px solid #cccccc;">
							<td style="font-size: 27px;" class="first">${cnt }월</td>
							<td>${dto.exhibitStart}~${dto.exhibitEnd}</td>
							<td>${dto.genre}</td>
							<td style="text-align: left; padding-left: 20px;" >
								<span style="cursor: pointer;" onclick='goArticle(${dto.getExhibitNum()});'>${dto.exhibitName}</span></td>
							<td >
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
						<td style="text-align: left; padding-left: 20px;">전시 일정이
							없습니다.</td>
						<td>&nbsp;</td>
					</tr>
				</c:if>

			</c:forEach>
		</table>
	</div>

</div>
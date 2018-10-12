<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script type="text/javascript">
	/* // tr rowspan 동적 추가
	$(".first").each(function() {
		var text=$(this).text();
		var subtext=text.substring(0,text.length-1);
		var rows="";
		var rows2=$(".first:contains(' 10 ')");
		var rows3=$(".first:contains(' 11 ')");
		var rows4=$(".first:contains(' 12 ')");
		if(subtext.length==1){
			if(subtext=="1"){
				rows = $(".first:contains('" + subtext + "')");
				
				rows.length=rows.length-(rows2.length+rows3.length+rows4.length);
				alert("1++++"+rows.length);
			}else if(subtext=="2"){
				rows = $(".first:contains('" + subtext + "')");
				
				rows.length=rows.length-rows4.length;
				alert("2++++"+rows.length);
			}else{
				rows = $(".first:contains('" + subtext + "')");
			}
			
		}else{
			rows = $(".first:contains('" + subtext + "')");
		}
		
		if (rows.length > 1) {
			rows.eq(0).attr("rowspan", rows.length);
			rows.not(":eq(0)").remove();
		}
	}); */
	// tr rowspan 동적 추가
	$(".first").each(function() {
		var text=$(this).text();
		var rows = $(".first:contains('" + text + "')");
		var rows2 = $(".first:contains('11월')");
		var rows3 = $(".first:contains('12월')");
		
		if(text==="1월"){
			rows = $(".first:contains('1월')");
			
			rows.length=rows.length-rows2.length;
		}else if(text === "2월"){
			rows = $(".first:contains('2월')");
			
			rows.length=rows.length-rows3.length;
		}
		
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
					<div class="tab_year" style="text-align: center; margin: 0px 28px;">
						<a style="left:0; background: url(<%=cp%>/resource/images/lumos/bg_btn_prev.gif) no-repeat 50% 50%;" class="prebtnYear" style="background-color: #eeeeee;"></a>
						<span class="titleDate" id="current-year" data-year="${year}">${year}</span>
						<a style="right:0; background: url(<%=cp%>/resource/images/lumos/bg_btn_next.gif) no-repeat 50% 50%;" class="nextbtnYear" style="background-color: #eeeeee;"></a>
					</div>
				</th>
				<th width="140" style="color: #434343;">기간</th>
				<th width="140" style="color: #434343;">장르</th>
				<th style="color: #434343;">공연명</th>
				<th width="140">장소</th>
			</tr>
			<c:forEach var="cnt" begin="1" end="12">
				<c:set var="flag" value="0" />
				<c:forEach var="dto" items="${list }">
					<c:if test="${(cnt == dto.endmonth || cnt == dto.startmonth) || (cnt>=dto.startmonth && cnt<=dto.endmonth)}">
						<c:set var="flag" value="1" />
						<tr align="center" bgcolor="#ffffff" height="35"
							style="border-bottom: 1px solid #cccccc;"> 
							<td style="font-size: 24px;" class="first">${cnt }월</td>
							<td>${dto.concertStart}~${dto.concertEnd}</td>
							<td>${dto.genre}</td>
							<td style="text-align: left; padding-left: 20px;" >
								<span style="cursor: pointer;" onclick='goArticle(${dto.getConcertNum()});'>${dto.concertName}</span></td>
							<td >
								${dto.hallName}</td>
						</tr>
					</c:if>
				</c:forEach>
				
				<c:if test="${flag == 0}">
					<tr align="center" bgcolor="#ffffff" height="35"
						style="border-bottom: 1px solid #cccccc;">
						<td style="font-size: 24px;" rowspan="1">${cnt }월</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td style="text-align: left; padding-left: 20px;">공연 일정이
							없습니다.</td>
						<td>&nbsp;</td>
					</tr>
				</c:if>

			</c:forEach>
		</table>
	</div>

</div>
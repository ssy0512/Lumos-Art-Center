<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
$(function () {
	$(".starDiv").each(function () {
		var score=$(this).attr("data-score");
		var html="";
		if(score%2==0){
			for(var i=1;i<=score/2;i++){
				html+="<img src='<%=cp %>/resource/images/lumos/star-on.png'>";
			}
			for(var i=1;i<=5-(score/2);i++){
				html+="<img src='<%=cp %>/resource/images/lumos/star-off.png'>";
			}
			$(this).html(html);
		}else{
			for(var i=1;i<=score/2;i++){
				html+="<img src='<%=cp %>/resource/images/lumos/star-on.png'>";
			}
			html+="<img src='<%=cp %>/resource/images/lumos/star-half.png'>";
			for(var i=1;i<=4.5-(score/2);i++){
				html+="<img src='<%=cp %>/resource/images/lumos/star-off.png'>";
			}
			$(this).html(html);
		}
	});
});
</script>

<!-- 공연 후기 -->
<div class="allitems list_bg">
	<div class="wrap">
		<h3>공연 후기</h3>
		<ul style="margin-top: 10px; list-style: none;">
			<li class="titl" style="float: left;">
				<p style="margin-top: 10px;">관람한 공연의 리뷰</p>
				<p>공연 관람평을 남기고, 감상을 공유 할 수 있습니다.</p>
				<a><img src="<%=cp %>/resource/images/lumos/add_open.png">
					공연 후기 보기</a>
			</li>
			<li class="cont" style="float: left;">
				<c:if test="${empty cReviewList}">
					<p class="emp">“ 등록된 공연 후기가 없습니다. ”</p>
				</c:if>
				<c:forEach items="${cReviewList}" var="crl">
					<ul>
						<li class="posterLi" style="float: left; margin-right: 20px;">
							<c:if test="${not empty crl.exProfileImage}">
								<img src="<%=cp %>/uploads/image/${crl.exProfileImage}">
							</c:if>
							<c:if test="${empty crl.exProfileImage}">
								<img src="<%=cp %>/resource/images/lumos/noposter.png">
							</c:if>
						</li>
						<li style="float: inherit;">
							<a href="<%=cp%>/concert/article?num=${crl.concertNum}">${crl.concertName}</a>
							<p>${crl.hallName}&nbsp;&nbsp;|&nbsp;&nbsp;${crl.concertStart} ~ ${crl.concertEnd}</p>
							<div style="margin-top: 10px;" class="starDiv" data-score="${crl.score}">
							</div>
						</li>
					</ul>
					<div class="clearfix"></div>
				</c:forEach>
			</li>
		</ul>
	</div>
	<div class="clearfix"></div>
</div>

<!-- 전시 후기 -->
<div class="allitems">
	<div class="wrap">
		<h3>전시 후기</h3>
		<ul style="margin-top: 10px; list-style: none;">
			<li class="titl" style="float: left;">
				<p style="margin-top: 10px;">관람한 전시의 리뷰</p>
				<p>전시 관람평을 남기고, 감상을 공유 할 수 있습니다.</p>
				<a><img src="<%=cp %>/resource/images/lumos/add_open.png">
					전시 후기 보기</a>
			</li>
			<li class="cont" style="float: left;">
				<c:if test="${empty eReviewList}">
					<p class="emp">“ 등록된 전시 후기가 없습니다. ”</p>
				</c:if>
				<c:forEach items="${eReviewList}" var="erl">
					<ul>
						<li class="posterLi" style="float: left; margin-right: 20px;">
							<c:if test="${not empty erl.exProfileImage}">
								<img src="<%=cp %>/uploads/image/${erl.exProfileImage}">
							</c:if>
							<c:if test="${empty erl.exProfileImage}">
								<img src="<%=cp %>/resource/images/lumos/noposter.png">
							</c:if>
						</li>
						<li style="float: inherit;">
							<a href="<%=cp%>/exhibit/article?num=${erl.exhibitNum}">${erl.exhibitName}</a>
							<p>${erl.hallName}&nbsp;&nbsp;|&nbsp;&nbsp;${erl.exhibitStart} ~ ${erl.exhibitEnd}</p>
							<div style="margin-top: 10px;" class="starDiv" data-score="${erl.score}">
							</div>
						</li>
					</ul>
					<div class="clearfix"></div>
				</c:forEach>
			</li>
		</ul>
	</div>
	<div class="clearfix"></div>
</div>

<!-- 나의 상담 내역 -->
<div class="allitems list_bg">
	<div class="wrap">
		<h3>나의 상담 문의</h3>
		<ul style="margin-top: 10px; list-style: none;">
			<li class="titl" style="float: left;">
				<p style="margin-top: 10px;">궁금한 점, 도움이 필요한 상황</p>
				<p>불편했던 기억, 개선되었으면 하는 점<br>LAC에 전하고 싶은 이야기까지</p>
				<a><img src="<%=cp %>/resource/images/lumos/add_open.png">
					일대일 상담 쓰기</a>
			</li>
			<li class="cont" style="float: left;">
				<c:if test="${empty myQnaList}">
					<p class="emp">“ 상담문의 내역이 없습니다. ”</p>
				</c:if>
				<c:if test="${not empty myQnaList}">
					<table class="qnaTable" style="width: 520px;">
						<c:forEach var="mql" items="${myQnaList}" >
							<tr>
								<td style="width: 30%;">[${mql.qcategoryname}]</td>
								<td style="width: 50%;">${mql.title}</td>
								<td style="width: 20%;">${mql.created}</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</li>
		</ul>
	</div>
	<div class="clearfix"></div>
</div>
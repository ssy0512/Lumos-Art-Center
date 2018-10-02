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

<!-- ���� �ı� -->
<div class="allitems list_bg">
	<div class="wrap">
		<h3>���� �ı�</h3>
		<ul style="margin-top: 10px; list-style: none;">
			<li class="titl" style="float: left;">
				<p style="margin-top: 10px;">������ ������ ����</p>
				<p>���� �������� �����, ������ ���� �� �� �ֽ��ϴ�.</p>
				<a><img src="<%=cp %>/resource/images/lumos/add_open.png">
					���� �ı� ����</a>
			</li>
			<li class="cont" style="float: left;">
				<c:if test="${empty cReviewList}">
					<p class="emp">�� ��ϵ� ���� �ıⰡ �����ϴ�. ��</p>
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

<!-- ���� �ı� -->
<div class="allitems">
	<div class="wrap">
		<h3>���� �ı�</h3>
		<ul style="margin-top: 10px; list-style: none;">
			<li class="titl" style="float: left;">
				<p style="margin-top: 10px;">������ ������ ����</p>
				<p>���� �������� �����, ������ ���� �� �� �ֽ��ϴ�.</p>
				<a><img src="<%=cp %>/resource/images/lumos/add_open.png">
					���� �ı� ����</a>
			</li>
			<li class="cont" style="float: left;">
				<c:if test="${empty eReviewList}">
					<p class="emp">�� ��ϵ� ���� �ıⰡ �����ϴ�. ��</p>
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

<!-- ���� ��� ���� -->
<div class="allitems list_bg">
	<div class="wrap">
		<h3>���� ��� ����</h3>
		<ul style="margin-top: 10px; list-style: none;">
			<li class="titl" style="float: left;">
				<p style="margin-top: 10px;">�ñ��� ��, ������ �ʿ��� ��Ȳ</p>
				<p>�����ߴ� ���, �����Ǿ����� �ϴ� ��<br>LAC�� ���ϰ� ���� �̾߱����</p>
				<a><img src="<%=cp %>/resource/images/lumos/add_open.png">
					�ϴ��� ��� ����</a>
			</li>
			<li class="cont" style="float: left;">
				<c:if test="${empty myQnaList}">
					<p class="emp">�� ��㹮�� ������ �����ϴ�. ��</p>
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
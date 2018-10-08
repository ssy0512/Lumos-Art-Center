<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<script type="text/javascript">
var pageNo=1;
var totalPage=1;

$(function () {
	eReviewListPage(1);
});
</script>
<div>
	<div class="list_bg">
		<div class="wrap">
			<div class="erTitle">
				전시 후기
			</div>
				<div id="eReviewListBody" style="padding-bottom: 80px;">
					<!-- item -->
				</div>
				<div id="eReviewListFooter">
					<div class="line"></div>
					<div class="more_load" onclick="moreERv();">
						<img src="<%=cp %>/resource/images/lumos/more.png">
						<span>더보기</span>
					</div>
				</div>
			<div class="clearfix" style="margin-bottom: 30px;"></div>
		</div>
	</div>
</div>
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
	cReviewListPage(1);
});
</script>
<div>
	<div class="list_bg">
		<div class="wrap">
			<div class="crTitle">
				공연 후기
			</div>
				<div id="cReviewListBody" style="padding-bottom: 80px;">
					<!-- item -->
				</div>
				<div id="cReviewListFooter">
				
				</div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
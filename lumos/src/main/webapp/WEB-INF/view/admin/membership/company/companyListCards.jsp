<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
.company-top {
	width: 1330px; height: 80px; margin-top: 20px;
}
.company-top-page {
	float: left; margin: 10px 0 0 20px;
	font-size: 12pt;
}
.company-top-search {
	align-content: center; text-align: center;
}
.companyList-cards {
	margin: 0 33px;
}
.companyList-cards a:hover {
	cursor: pointer;
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	transform: scale(1.1);
	text-decoration: none;
}
.companyList-cards-info p {
	margin: 5px 0;
	color: #333333;
	overflow: hidden;
	line-height: 25px
}
.company-top-layout {
	float: right;
}
.company-top-layout button, .btn {
	cursor: pointer;
	font-size: 12pt;
	font-family: 'Varela Round', sans-serif;
	display: inline-flex;
	align-items: center;
}
.boxTF {
	width: 300px;
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
		<div class="company-top">
			<div class="company-top-page">
				전체 ${dataCount} (${page}/${total_page} 페이지)
			</div>
			
			<div class="company-top-search">
				<form action="searchForm" action="<%=cp%>/admin/membership/company/companyList" method="post">
					<select name="searchKey" class="selectField">
						<option value="companyIndex">회원번호</option>
						<option value="companyName">회사명</option>
						<option value="repname">대표명</option>
					</select>
					<input type="text" name="searchValue" class="boxTF">
					<button type="button" class="btn" onclick="searchList()" style="margin: 5px">
						&nbsp;검색&nbsp;
					</button>
			
					<div class="company-top-layout">
						<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/membership/company/companyList';">
							<img src="<%=cp%>/resource/images/lumos/membershipListBtn.png" style="width: 17px; height: 17px; margin: 5px 3px 2px 3px;">
								&nbsp;목록형&nbsp;&nbsp;
						</button>
						<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/membership/company/companyListCards';">
							<img src="<%=cp%>/resource/images/lumos/membershipCards.png" style="width: 17px; height: 17px; margin: 5px 3px 2px 3px;">
								&nbsp;앨범형&nbsp;&nbsp;
						</button>
					</div>
				</form>
			</div>
		</div>

		<c:forEach var="dto" items="${list}">
			<div class="companyList-cards" style="display: inline-flex; flex-direction: row; flex-wrap: wrap; justify-content: space-between; align-items: center; align-content: space-between;">
				<a href="<%=cp%>/admin/membership/company/article?&page=${page}&companyIndex=${dto.companyIndex}">
					<div style="width: 270px; height: 340px; border-radius: 25px; box-shadow: 2px 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);">
						<div style="margin: 0px 75px;">
							<img src="https://cdn.pixabay.com/photo/2015/02/02/15/28/bar-621033_960_720.jpg" style="width: 120px; height: 120px; border-radius: 110px; margin: 15px 0 10px 0;">
						</div>
						<div class="companyList-cards-info">
									<p style="text-align: center; font-size: 15pt; font-weight: bold;">${dto.companyName}</p>
									<p style="text-align: center;">No.${dto.companyIndex}</p>
									<p>
										<img alt="Charge" src="<%=cp%>/resource/images/lumos/membershipCharge.png" style="width: 15px; height: 20px; margin: 0 10px 0 17px;">
										${dto.chargeName} (${dto.chargeId})
									</p>
									<p><img alt="Tel" src="<%=cp%>/resource/images/lumos/membershipTel.png" style="width: 18px; height: 19px; margin: 0 15px;">${dto.chargeTel}</p>
									<p><img alt="Email" src="<%=cp%>/resource/images/lumos/membershipEmail.png" style="width: 20px; height: 15px; margin: 0 15px;">${dto.chargeEmail}</p>
									<p><img alt="Fax" src="<%=cp%>/resource/images/lumos/membershipFax.png" style="width: 20px; height: 20px; margin: 0 15px;">${dto.fax}</p>
						</div>
					</div>
				</a>
			</div>
		</c:forEach>
	</c:if>
	<div class="paging" style="text-align: center; min-height: 50px; line-height: 50px;">
		<c:if test="${dataCount==0}">등록된 게시물이 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>
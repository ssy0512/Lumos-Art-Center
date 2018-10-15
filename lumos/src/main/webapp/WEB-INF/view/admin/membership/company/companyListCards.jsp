<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
.cards {
	width: 270px; height: 220px;
}
.companyList-cards {
	margin: 20px 33px;
	border-top: 1px solid #072659;
	border-bottom: 1px solid #072659;
	border-radius: 25px;
}
.companyList-cards a:hover {
	cursor: pointer;
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	transform: scale(1.1);
	text-decoration: none;
}
.companyList-cards-info {
	padding: 15px;
}
.companyList-cards-info p {
	margin: 5px 0;
	width: 240px;
	color: #333333;
	overflow: hidden;
	line-height: 25px;
	text-overflow: ellipsis; white-space: nowrap;
}
.bottom-layout {
	float: right;
}
.bottom-layout button, .btn {
	cursor: pointer;
	font-size: 12pt;
	font-family: 'Varela Round', sans-serif;
	display: inline-flex;
	align-items: center;
}
.list-btn {
	width: 96px; height: 30px;
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
.boxTF {
	width: 300px;
}
.bottom {
	width: 1300px; height: 40px; margin-top: 20px;
}
.bottom-page {
	float: left; margin: 10px 0 0 20px;
	font-size: 12pt;
}
.searchh {
	align-content: center; text-align: center;
}
.paging {
	margin-top: 5px;
	text-align: center;
	min-height: 50px;
	line-height: 50px;
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

		<c:forEach var="dto" items="${list}">
			<div class="companyList-cards" style="display: inline-flex; flex-direction: row; flex-wrap: wrap; justify-content: space-between; align-items: center; align-content: space-between;">
				<a href="<%=cp%>/admin/membership/company/article?&page=${page}&companyIndex=${dto.companyIndex}">
					<div class="cards">
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
		
		
		<div class="bottom">
			<div class="bottom-page">
				전체 ${dataCount} (${page}/${total_page} 페이지)
			</div>
			
			<div class="search">
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
			
					<div class="bottom-layout">
						<button type="button" class="list-btn" onclick="javascript:location.href='<%=cp%>/admin/membership/company/companyList';">
							<img src="<%=cp%>/resource/images/lumos/membershipListBtn.png" style="width: 17px; height: 17px; margin: 5px 3px 2px 3px;">
								&nbsp;목록형&nbsp;&nbsp;
						</button>
						&nbsp;
						<button type="button" class="list-btn" onclick="javascript:location.href='<%=cp%>/admin/membership/company/companyListCards';">
							<img src="<%=cp%>/resource/images/lumos/membershipCards.png" style="width: 17px; height: 17px; margin: 5px 3px 2px 3px;">
								&nbsp;앨범형&nbsp;&nbsp;
						</button>
					</div>
				</form>
			</div>
		</div>
		
	</c:if>
	<div class="paging">
		<c:if test="${dataCount==0}">등록된 게시물이 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
.top {
	margin: 15px 0 10px 0;
}
.main {
	margin-left: 70px;
}
.Listcards {
	margin: 10px 33px;
	display: inline-flex;
	flex-direction: row; flex-wrap: wrap;
	justify-content: space-between;
	align-items: center; align-content: space-between;
}
.Listcards a:hover {
	cursor: pointer;
	-webkit-transform: scale(1.1);
	-moz-transform: scale(1.1);
	transform: scale(1.1);
	text-decoration: none;
}
.exhibit-image {
	margin: 20px 20px;
	float: left;
}
.exhibit-image img {
	width: 160px; height: 160px;
	border-radius: 100px;
	margin: 10px 0 10px 0;
}
.cards-info {
	float: left;
}
.cards-info p {
	margin: 5px 0;
	color: #333333;
	font-size: 10pt;
	overflow: hidden;
	line-height: 25px
}
.list-layout {
	float: right;
}
.list-layout button, .btn {
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
.search {
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
		<div class="top">
			<img src="<%=cp %>/resource/images/lumos/adminSalesExhibit.png">
		</div>
		<div class="main">
		<c:forEach var="dto" items="${list}">
			<div class="Listcards">
				<a href="<%=cp%>/admin/sales/exhibit/article?&page=${page}&exhibitNum=${dto.exhibitNum}">
					<div style="width: 540px; height: 230px; border-radius: 25px;
					 box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.2), 0 6px 15px 0 rgba(0, 0, 0, 0.19);">
						<div class="exhibit-image">
							<c:if test="${not empty dto.exProfileImage}">
								<img src="<%=cp %>/uploads/image/${dto.exProfileImage}">
							</c:if>
							<c:if test="${empty dto.exProfileImage}">
								<img src="<%=cp%>/resource/images/lumos/noposter.png"
									style="border: 1px solid #707A8A;">
							</c:if>
						</div>
						<div class="cards-info">
							<p style="margin: 10px 0; text-align: right;">No.${dto.exhibitNum}</p>
							<p style="margin-bottom: 10px; width: 290px; text-align: center; font-size: 12pt; font-weight: bold; text-overflow: ellipsis; white-space: nowrap;">
								${dto.exhibitName}
							</p>
							<p>
								<img alt="Charge" src="<%=cp%>/resource/images/lumos/membershipCharge.png" style="width: 15px; height: 20px; margin: 0 10px 0 17px;">
								${dto.exhibitStart} ~ ${dto.exhibitEnd}
							</p>
							<p><img alt="Tel" src="<%=cp%>/resource/images/lumos/membershipTel.png" style="width: 18px; height: 19px; margin: 0 15px;">${dto.host}</p>
							<p><img alt="Email" src="<%=cp%>/resource/images/lumos/membershipEmail.png" style="width: 20px; height: 15px; margin: 0 15px;">${dto.supervise}</p>
						</div>
					</div>
				</a>
			</div>
		</c:forEach>
		</div>	
		
		<div class="bottom">
			<div class="bottom-page">
				전체 ${dataCount} (${page}/${total_page} 페이지)
			</div>
			
			<div class="search">
				<form action="searchForm" action="<%=cp%>/admin/saels/exhibit/exhibitList" method="post">
					<select name="searchKey" class="selectField">
						<option value="exhibitNum">전시번호</option>
						<option value="exhibitName">전시명</option>
					</select>
					<input type="text" name="searchValue" class="boxTF">
					<button type="button" class="btn" onclick="searchList()" style="margin: 5px">
						&nbsp;검색&nbsp;
					</button>
			
					<div class="list-layout">
						<button type="button" class="list-btn" onclick="javascript:location.href='<%=cp%>/admin/sales/exhibit/salesList';">
							<img src="<%=cp%>/resource/images/lumos/membershipListBtn.png" style="width: 17px; height: 17px; margin: 5px 3px 2px 5px;">
								&nbsp;목록형&nbsp;
						</button>
						<button type="button" class="list-btn" onclick="javascript:location.href='<%=cp%>/admin/sales/exhibit/listCards';">
							<img src="<%=cp%>/resource/images/lumos/membershipCards.png" style="width: 17px; height: 17px; margin: 5px 3px 2px 5px;">
								&nbsp;앨범형&nbsp;
						</button>
					</div>
				</form>
			</div>
		</div>
	</c:if>
	<div class="paging" style="">
		<c:if test="${dataCount==0}">등록된 게시물이 없습니다.</c:if>
		<c:if test="${dataCount!=0}">${paging}</c:if>
	</div>
</div>
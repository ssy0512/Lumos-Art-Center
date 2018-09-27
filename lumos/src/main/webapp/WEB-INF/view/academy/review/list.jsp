<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<link rel="stylesheet" href="<%=cp%>/resource/css/academystyle.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/resource/css/academylayout.css" type="text/css">

<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.submit();
	}
</script>

<div class="body-content-container">
    <div class="body-academy-title">
         <span class="academy-title">아카데미 수강후기</span>
    </div>
    
    <div style="margin: 25px;">
    	<table style="width: 900px; margin: 10px auto; border-spacing: 0px; padding-bottom: 20px;">
		   <tr height="40">
		   	  <td align="left" width="250px">
		          ${dataCount}개(${page}/${total_page} 페이지)
		      </td>
		      <td align="right">
		          <form name="searchForm" action="<%=cp%>/bbs/list" method="post">
		              <select name="searchKey" class="selectField" style="width: 80px; height: 30px;">
		                  <option value="subject">제목</option>
		                  <option value="userName">작성자</option>
		                  <option value="content">내용</option>
		                  <option value="created">등록일</option>
		            </select>
		            <input type="text" style="width: 300px;" name="searchValue" class="list-title-boxTF">
		            <button type="button" class="btn-search" onclick="searchList()">검색</button>
		        </form>
		      </td>
		   </tr>
		</table>
		
		<table style="width: 900px; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="center" style="color: #434343; height: 50px; border-top: 2px solid #aa1717; border-bottom: 2px solid #aa1717;"> 
		      <th width="60">번호</th>
		      <th width="250">강의명</th>
		      <th>제목</th>
		      <th width="100">작성자</th>
		      <th width="100">작성일</th>
		      <th width="60">조회수</th>
		  </tr>
		 
		 <c:forEach var="dto" items="${list}">
		  <tr align="center" style="border-bottom: 1px solid #cccccc; height: 47px; color: #434343;"> 
		      <td>${dto.listNum}</td>
		      <td>${dto.academyName}</td>
		      <td align="left" style="padding-left: 10px;">
		           <a href="${articleUrl}&classReviewNum=${dto.classReviewNum}">${dto.subject}</a>
		      </td>
		      <td>${dto.userName}</td>
		      <td>${dto.created}</td>
		      <td>${dto.hitCount}</td>
		      <td>
                   
		      </td>
		  </tr>
		  </c:forEach>

		</table>
		 
		<table style="width: 900px; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center" style="padding-top: 55px;">
			        <c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
			        <c:if test="${dataCount!=0 }">${paging}</c:if>
			 </td>
		   </tr>
		</table>
		
		<table style="width: 900px; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="list-ing" style="width: 71px; cursor: pointer;" onclick="javascript:location.href='<%=cp%>/academy/review/list';">새로고침</button>
		      </td>
		      <c:if test="${not empty sessionScope.member}"> 
		      <td align="right" width="100">
		          <button type="button" class="list-ing" style="width: 71px; cursor: pointer;" onclick="javascript:location.href='<%=cp%>/academy/review/created';">글올리기</button>
		      </td>
		      </c:if>
		   </tr>
		</table>
    </div>
</div>
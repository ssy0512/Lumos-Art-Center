<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.submit();
	}
</script>

<div class="body-container">
    <div>
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="center" bgcolor="#eeeeee" height="44" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		  	  <th width="200">			
		  	  	<div class="tab_year" style="padding-bottom:5px; text-align: center;margin:0px 28px;">
					<span class=" prebtnDate" style="background-color:#eeeeee;">＜</span>
					<span class="titleDate" id="current-year" data-year="${year}">${year}</span> 
					<span class="nextbtnDate" style="background-color:#eeeeee;">＞</span>
				</div>
			</th>
		      <th width="122" style="color: #434343;">기간</th>
		      <th width="116" style="color: #434343;">장르</th>
		      <th style="color: #434343;">공연명</th>
		      <th width="180" align="left">
		          <form name="searchForm" action="<%=cp%>/bbs/list" method="post">
		              <select name="searchKey" class="selectField">
		                  <option value="subject">제목</option>
		                  <option value="userName">작성자</option>
		                  <option value="content">내용</option>
		                  <option value="created">등록일</option>
		            </select>
		        </form>
		      </th>
		  </tr>
		 
		 <c:forEach var="dto" items="${list}">
		  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
		      <td>${dto.listNum}</td>
		      <td align="left" style="padding-left: 10px;">
		           <a href="${articleUrl}&num=${dto.num}">${dto.subject} (${dto.replyCount})</a>
		      </td>
		      <td>${dto.userName}</td>
		  </tr>
		  </c:forEach>

		</table>
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			        <c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
			        <c:if test="${dataCount!=0 }">${paging}</c:if>
			 </td>
		   </tr>
		</table>
    </div>

</div>
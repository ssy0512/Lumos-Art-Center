
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>


<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.submit();
	}
</script>


<div class="body-container" style="width: 700px;">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span>공지사항 </h3>
    </div>
    
	 
	 
     [공지 리스트 화면 입니다.] 
      
      
    <div >
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          	총  ${noticeListCount}개의 공지사항이 있습니다(${dataCount}/${total_page}페이지)
     	      </td>
		      <td align="right">
		          &nbsp;
		      </td>
		   </tr>
		</table>
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr><td height="1" colspan="5" bgcolor="#cccccc"></td></tr>
		  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <th width="60" style="color: #787878;">글번호</th>
		      <th style="color: #787878;">제목</th>
		      <th width="80" style="color: #787878;">아이디</th>
		      <th width="120" style="color: #787878;">등록일</th>
		      <th width="60" style="color: #787878;">조회수</th>
		  </tr>
		
	
		<c:forEach var="dto" items="${noticeList}">
		  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
		      <td><span style="display: inline-block;width: 28px;height:18px;line-height:18px; background: #ED4C00;color: #FFFFFF">공지</span></td>
		      <td align="left" style="padding-left: 10px;">
		           <a href="${articleUrl}&num=${dto.noticeNum}">${dto.title}</a>
		      </td>
		      <td>${dto.userId }</td>
		      <td>${dto.created}</td>
		      <td>${dto.hitcount}</td>
		  </tr>
		</c:forEach>
  
	
		<c:forEach var="dto" items="${list}">
		  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
		      <td>${dto.noticeNum}</td>
		      <td align="left" style="padding-left: 10px;">
		           <a href="${articleUrl}&num=${dto.noticeNum}">${dto.title}</a>
		           
		      </td>
		      <td>${dto.userId}</td>
		      <td>${dto.created}</td>
		      <td>${dto.hitcount}</td>
		  </tr>
		  </c:forEach>
   
		</table>
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			        <c:if test="${dataCount==0 }">
			                등록된 게시물이 없습니다.
			         </c:if>
			        <c:if test="${dataCount!=0 }">
			               ${paging}
			         </c:if>
			 </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/customerCenter/notice/list';">새로고침</button>
		      </td>
		      <td align="center">
		          <form name="searchForm" action="<%=cp%>/customerCenter/notice/list" method="post">
        
		              <select name="searchKey" class="selectField">
		                  <option value="noticeNum">글번호</option>
		                  <option value="title">제목</option>
		                  <option value="content">내용</option>
		                  <option value="created">등록일</option>
		            </select>
		            <input type="text" name="searchValue" class="boxTF">
		            <button type="button" class="btn" onclick="searchList()">검색</button>
		        </form>
		      </td>
		      <td align="right" width="100">
		        <c:if test="${sessionScope.member.userId=='admin'}">
		          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/customerCenter/notice/created';">글올리기</button>
		         </c:if>
		      </td>
		   </tr>
		</table>
    </div>

</div>
  

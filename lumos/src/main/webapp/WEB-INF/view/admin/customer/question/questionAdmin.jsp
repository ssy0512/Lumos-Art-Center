<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
function searchList(){
	var f=document.searchList;
	f.submit;
}
</script>

<div class="body-title" style="padding-left:150px; padding-top:50px;">
		<h1>등록된 문의글 리스트 </h1>
		<hr size="2" noshade>
	</div>
	
<div class="body-right" style="align:center;padding-left: 150px;">
<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
   <tr height="35">
      <td align="right" width="100%">
         ${dataCount}개[${page}/${total_page} 페이지]
      </td>
      <td align="left">
          &nbsp;
      </td>
   </tr>
</table>

<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
  <tr><td height="1" colspan="5" bgcolor="#cccccc"></td></tr>
  <tr align="center" bgcolor="#367a96" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
      <th width="60" style="color: #fff;">번호</th>
      <th width="60" style="color: #fff;">카테고리</th>
      <th style="color: #fff;">제목</th>
      <th width="100" style="color: #fff;">작성자</th>
      <th width="80" style="color: #fff;">작성일</th>
  </tr>
 
<c:forEach var="dto" items="${list}">
  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
      <td>${dto.listNum}</td>
      <td style="width:100px;">${dto.qCategoryName}</td>
      <td align="left" style="padding-left: 10px;width:150px;">
           <c:forEach var="n" begin="1" end="${dto.depth}">
               &nbsp;
           </c:forEach>
           <c:if test="${dto.depth!=0}">
            <img src='<%=cp%>/resource/images/re.gif'>
           </c:if>
           <a href="javascript:location.href='<%=cp%>/customerCenter/main';">${dto.title}</a>
      </td>
      <td>${dto.userName}</td>
      <td>${dto.created}</td>
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
          <button type="button" class="btn" onclick="reloadBoard();">새로고침</button>
      </td>
      <td align="center">
          <form name="searchForm" action="" method="post">
              <select id="searchKey" name="searchKey" class="selectField">
                  <option value="title">제목</option>
                   <option value="qCategoryName">카테고리</option>
                  <option value="userName">작성자</option>
                  <option value="content">내용</option>
                  <option value="created">등록일</option>
            </select>
            <input type="text" id="searchValue" name="searchValue" class="boxTF">
            <button type="button" class="btn" onclick="searchList();">검색</button>
        </form>
      </td>
      <td align="right" width="100">
          <button type="button" class="btn" onclick="location.href='<%=cp%>/customerCenter/questions/list';">답글달기</button>
      </td>
   </tr>
</table>
</div>

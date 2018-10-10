<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>


<script type="text/javascript">
  function check() {
        var f = document.boardForm;

    	var str = f.title.value;
        if(!str) {
            f.title.focus();
            return false;
        }

    	str = f.content.value;
        if(!str || str=="<p>&nbsp;</p>") {
            f.content.focus();
            return false;
        }

   		f.action="<%=cp%>/customerCenter/questions/${mode}";

        return true;
 }
  

</script>

<div class="alert-info">
    <span style="font-family: Webdings; font-weight: 600;">m</span>
            질문을 남겨주시면 곧 답변해 드리겠습니다.
</div>

<form name="boardForm" method="post" enctype="multipart/form-data">
  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
  <tbody id="tb">
  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
      <td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
      <td style="padding-left:10px;"> 
        <input type="text" name="title" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.title}">
      </td>
  </tr>

  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
      <td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
      <td style="padding-left:10px;"> 
          ${sessionScope.member.userName}
      </td>
  </tr>
	<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
      <td width="100" bgcolor="#eeeeee" style="text-align: center;">카테고리</td>
      <td style="padding-left:10px;"> 
      <select class="selectField" name="qCategoryCode" id="listCategory">
      	<c:forEach var="vo" items="${listCategory}">
      		<option value="${vo.qCategoryCode}">${vo.qCategoryName}</option>
      	</c:forEach>
      </select>
        
      </td>
  </tr>
  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
      <td valign="top" style="padding:5px 0px 5px 10px;"> 
        <textarea name="content" rows="12" class="boxTA" style="width: 95%;">${dto.content}</textarea>
      </td>
  </tr>
  
  </table>

  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
     <tr height="45"> 
      <td align="center" >
	        <button type="button" class="btn" onclick="sendOk('${mode}', '${page}');">${mode=='update'?'수정완료':'등록하기'}</button>
	        <button type="reset" class="btn">다시입력</button>
	        <button type="button" class="btn" onclick="sendCancel('${page}');">${mode=='update'?'수정취소':'등록취소'}</button>
	         <c:if test="${mode=='update'}">
	         	 <input type="hidden" name="boardNum" value="${dto.postNum}">
	        	 <input type="hidden" name="pageNo" value="${page}">
	        </c:if>
	        <c:if test="${mode=='reply'}">
	        	<input type="hidden" name="pageNo" value="${page}">
	        	<input type="hidden" name="qCategoryCode" value="${dto.qCategoryCode}">
	        	<input type="hidden" name="groupNum" value="${dto.groupNum}">
	        	<input type="hidden" name="orderNo" value="${dto.orderNo}">
	        	<input type="hidden" name="depth" value="${dto.depth}">
	        	<input type="hidden" name="parent" value="${dto.postNum}">
	        </c:if>
      </td>
    </tr>
  </table>
</form>

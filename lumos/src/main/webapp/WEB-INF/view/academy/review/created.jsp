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
function sendOk() {
    var f = document.boardForm;
	var aca = $("#selectBox option:selected").val();
    
	f.academyNum.value=aca;
    var str = f.academyNum.value;
    //alert(str);
    
	var str = f.subject.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

	str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }
    
	f.action="<%=cp%>/academy/review/${mode}";

    f.submit();
}
 
   
</script>

<div class="body-content-container">
    <div class="body-academy-title">
         <span class="academy-title">아카데미 수강후기 작성</span>
    </div>
    
    <div>
			<form name="boardForm" method="post" enctype="multipart/form-data">
			  <table style="width: 900px;; margin: 40px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  
			   <tr align="left" height="55" style="border-bottom: 1px solid #cccccc;">
			      <td width="100" style="text-align: center;">강의명</td>
			      <td style="padding-left:10px;"> 
					<c:if test="${! empty sbList}">
						<select name="selectBox" id="selectBox" style="width: 200px; height: 30px;" class="list-title-boxTF">
      						<c:forEach var="sbList" items="${sbList}" varStatus="i">
        						 <option value="${sbList.academyNum}">${sbList.academyName}</option>
      						</c:forEach>
   						</select>
					</c:if>
					<input type="hidden" name="academyNum" value="">
			      </td>
			  </tr>
			  
			  
			  <tr align="left" height="55" style="border-top: 2px solid #aa1717; border-bottom: 2px solid #aa1717"> 
			      <td width="100" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="subject" maxlength="100" class="list-title-boxTF" style="width: 95%;" value="${dto.subject}">
			      </td>
			  </tr>
			
			  <tr align="left" height="55" style="border-top: 2px solid #aa1717; border-bottom: 2px solid #aa1717;"> 
			      <td width="100" style="text-align: center;">작성자</td>
			      <td style="padding-left:10px;"> 
			          ${sessionScope.member.userName}
			      </td>
			  </tr>
			
			  <tr align="left" style="border-bottom: 2px solid #aa1717"> 
			      <td colspan="2" valign="top" style="padding: 40px;;"> 
			        <textarea name="content" rows="12" class="list-title-boxTF" style="width: 100%; height: 350px;">${dto.content}</textarea>
			      </td>
			  </tr>
			  
			  </table>
			
			  <table style="width: 900px; margin: 0px auto; border-spacing: 0px;">
			     <tr height="55"> 
			      <td align="center" style="padding: 30px;">
			        <button type="button" class="list-ing" style="width: 71px; cursor: pointer;" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="list-ing" style="width: 71px; cursor: pointer;">다시입력</button>
			        <button type="button" class="list-ing" style="width: 71px; cursor: pointer;" onclick="javascript:location.href='<%=cp%>/academy/review/list';">${mode=='update'?'수정취소':'등록취소'}</button>
			         <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="classReviewNum" value="${dto.classReviewNum}">
			         	 <input type="hidden" name="academyNum" value="${dto.academyNum}">
			        	 <input type="hidden" name="page" value="${page}">
			        </c:if>
			      </td>
			    </tr>
			  </table>
			</form>
    </div>
    
</div>
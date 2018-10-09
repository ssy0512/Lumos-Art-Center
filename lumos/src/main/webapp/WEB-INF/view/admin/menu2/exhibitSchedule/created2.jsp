<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- 

<form>
  <input required='' type='text'>
  <label alt='Email' placeholder='Type your Email'></label>
</form>
 -->
 <script type="text/javascript">
 function sendOk(){
	 var f=document.createdForm;
	 var str=f.audience.value;
	 if(!str){
		 alert("관람등급을 입력하십시오.");
		 f.audience.focus();
		 return;
	 }
	 
	 str=f.exprice.value;
	 if(!str){
		 alert("가격을 입력하십시오.");
		 f.exprice.focus();
		 return;
	 }
	
	 f.action="<%=cp%>/admin/menu2/exhibitSchedule/${mode}";
	 f.submit();
 }
 
 </script>
 
 
 
<div class="body-right" style="width: 700px; padding-top:50px; padding-left:30px">
    <div class="body-title" >
        <h3><span style="font-family: Webdings">2</span> 전시 가격 등록 </h3>
        <hr>
    </div>
    
    <div style="clear:both;">
			<form name="createdForm" method="post" enctype="multipart/form-data">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  
			<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center;">관람등급 선택</td>
		      <td style="padding-left:10px;"> 
		      <select class="selectField" name="audience" id="listaudience">
		      	<c:forEach var="vo" items="${listaudience}">
		      		<!-- <option value="">::선택::</option> -->
		      		<option value="${vo.audiencelevelNum}">${vo.audience}</option>
		      	</c:forEach>
		      </select>
		      </td>
		  </tr>
		  
		
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">가&nbsp;&nbsp;격</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="genre" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.genre}">
			      </td>
			  </tr>
			  
			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="btn">다시입력</button>
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/menu2/exhibitSchedule/inserted';">${mode=='update'?'수정취소':'등록취소'}</button>
			         <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="audiencelevelNum" value="${dto.audiencelevelNum}">
			         	 <input type="hidden" name="exprice" value="${dto.exprice}">
			        	 <input type="hidden" name="page" value="${page}">
			        </c:if>
			      </td>
			    </tr>
			  </table>
			</form>
    </div>
    
</div>
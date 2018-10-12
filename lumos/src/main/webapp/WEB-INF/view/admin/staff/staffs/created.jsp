<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>


<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> -->
<link rel="stylesheet" href="<%=cp%>/resource/css/adminInputs.css" type="text/css">

<!-- 

<form>
  <input required='' type='text'>
  <label alt='Email' placeholder='Type your Email'></label>
</form>
 -->
 <script type="text/javascript">
 function sendOk(){
	 var f=document.createdForm;
	 var str=f.staffName.value;
	 if(!str){
		 alert("직원의 이름을 입력하십시오.");
		 f.staffName.focus();
		 return;
	 }
	 
	 str=f.birth.value;
	 if(!str){
		 alert("생년월일을 입력하십시오.");
		 f.birth.focus();
		 return;
	 }
	 str=f.department.value;
	 if(!str){
		 alert("소속 부서를 입력하십시오.");
		 f.department.focus();
		 return;
	 }
	 str=f.tel.value;
	 if(!str){
		 alert("전화번호를 입력하십시오.");
		 f.tel.focus();
		 return;
	 }
	 str=f.email.value;
	 if(!str){
		 alert("이메일을 입력하십시오.");
		 f.email.focus();
		 return;
	 }
	 
	 var mode="${mode}";
	 if(mode=="created"|| mode=="update" && f.upload.value!=""){
		 if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.upload.value)){
			 alert('등록 가능한 파일 형식이 아닙니다. 다른 파일을 이용하세요.');
			 f.upload.focus();
			 return;
		 }
	 }
	 f.action="<%=cp%>/admin/staff/staffs/${mode}";
	 f.submit();
 }
 
 $(function(){
	$("#regDate").datepicker({
		dateFormat:"yy-mm-dd",
		minDate:"-60Y",
		maxDate:"+1Y",
		closeText:"닫기",
		dayNames:['월요일','화요일','수요일','목요일','금요일','토요일','일요일'],
		monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		showOtherMonths:false,
		selectOtherMonths:true,
		changeMonth:true,
		changeYear:true
	}) ;
 });

 </script>
 
 
 <%-- 
<div class="body-right" style="width: 700px; padding-top:50px; padding-left:30px">
    <div class="body-title" >
        <h3><span style="font-family: Webdings">2</span> LUMOS 직원 등록 </h3>
        <hr>
    </div>
    
    <div style="clear:both;">
			<form name="createdForm" method="post" enctype="multipart/form-data">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">사원명</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="staffName" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.staffName}">
			      </td>
			  </tr>
			
			
  		<tr align="left" height="45" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">생년월일</td>
			      <td style="padding-left:10px;"> 
			            <input type="date" id="regDate" name="birth" readonly="readonly" value="${dto.birth}"><button></button>
			      </td>
			  </tr>
			
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">소속부서</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="department" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.department}">
			      </td>
			  </tr>
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">전화번호</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="tel" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.tel}">
			      </td>
			  </tr>
			   
			   <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">이메일</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="email" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.email}">
			      </td>
			 
			  </tr>
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">사원이미지</td>
			      <td style="padding-left:10px;"> 
			          <input type="file" name="upload" class="boxTF" size="53"
			                     accept="image/*" 
			                     style="height: 25px;">
			       </td>
			  </tr>
			  

			  </table>
			 --%>
			 
<div class="body-right" style="width: 700px; padding-top:50px; padding-left:360px; height:800px;">
    <div class="body-title" >
        <h1> LUMOS STAFF </h1>
        <hr>
    </div>

<div class="form-container" style="clear:both;">
  <form class="createdForm" method="post" enctype="multipart/form-data">
    
    
    <label>직원이름
	<input type="text" name="staffName" maxlength="100" class="boxTF" value="${dto.staffName}">      
</label>
 


  
    <label>생년월일
      <input class="boxTF" id="regDate" name="birth" type="date" value="${dto.birth}">
      </label>

  
    <label>소속부서
      <input class="boxTF" name="department" type="text" value="${dto.department}">
      </label>
 
 
    <label>전화번호
      <input class="boxTF" name="tel" type="text" value="${dto.tel}">
      </label>
 
    <label>이메일
      <input class="boxTF" name="email" type="text" value="${dto.email}">
      </label>
  
    <label>사원이미지
      <input class="boxTF" name="upload" type="file" accept="image/*" >
      </label>
  
			 
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="btn">다시입력</button>
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/staff/staffs/stafflist';">${mode=='update'?'수정취소':'등록취소'}</button>
			         <c:if test="${mode=='update'}">
			         	 <input type="hidden" name="staffName" value="${dto.staffName}">
			         	 <input type="hidden" name="department" value="${dto.department}">
			         	 <input type="hidden" name="birth" value="${dto.birth}">
			        	 <input type="hidden" name="tel" value="${dto.tel}">
			        	 <input type="hidden" name="page" value="${page}">
			        </c:if>
			      </td>
			    </tr>
			  </table>
  </form>
    </div>
    
</div>


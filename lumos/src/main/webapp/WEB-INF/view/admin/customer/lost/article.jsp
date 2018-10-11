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


<script type="text/javascript">

var memberEmail = "${companyChargeDTO.chargeEmail}";
	
function sendOk() {
	
	var f = document.lostForm;
	
	var status = $("#selectStatus").val();
	var lostNum = "${dto.lostNum}";
	
	f.action = "<%=cp%>/admin/customer/lost/article?status=" + status + "&lostNum=" + lostNum + "&page=" + ${page};
    f.submit();
}



function initForm()
{
	$("#selectStatus").val("${dto.lostStatus}").attr("selected", "selected");
}

$(document).ready(function(){

	initForm();
	
});


</script>
 
 
<div class="body-right" style="width: 700px; padding-top:50px; padding-left:30px">
    <div class="body-title" >
        <h3><span style="font-family: Webdings">2</span> 유실물 정보</h3>
        <hr>
    </div>
    
    <div style="clear:both;">
			<form name="lostForm" method="post" enctype="multipart/form-data">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  
			  
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">분실자명</td>
			      <td style="padding-left:10px;"> 
			        ${dto.lostPerson}
			      </td>
			  </tr>
			  
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">분실물품</td>
			      <td style="padding-left:10px;"> 
			        ${dto.lostName}
			      </td>
			  </tr>
			  
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">전화번호</td>
			      <td style="padding-left:10px;"> 
			        ${dto.tel}
			      </td>
			  </tr>
			  
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">이메일</td>
			      <td style="padding-left:10px;"> 
			         ${dto.email}
			      </td>
			  </tr>
			  
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">분실일자</td>
			      <td style="padding-left:10px;"> 
			        ${dto.lostDate}
			      </td>
			  </tr>
			  
			 <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">분실장소</td>
			      <td style="padding-left:10px;"> 
			        ${dto.lostPlace}
			      </td>
			  </tr>
			  
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">내용</td>
			      <td style="padding-left:10px;"> 
			        ${dto.content}
			      </td>
			  </tr>
			  
			   <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">처리상태</td>
			      <td style="padding-left:10px;"> 
			        <select style="width:150px" name="selectStatus" id="selectStatus" class="selectField">
		                <option value="1">접수</option>
		                <option value="2">처리중</option>
		                <option value="3">완료</option>
		            </select>
			      </td>
			  </tr>

			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="btn" onclick="sendOk();">수정완료</button>
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/admin/customer/lost/main';">이전 페이지</button>

			      </td>
			    </tr>
			  </table>
			</form>
    </div>
    
</div>
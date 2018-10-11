<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script>

function lostSendOk()
{
	var f = document.lostForm;
	var str;

    
 	// 담당자
    str = f.lostPerson.value;
	str = str.trim();
	if(!str) {
		alert("분실자명을 입력하세요. ");
		f.lostPerson.focus();
		return;
	}
	
	// 담당자
    str = f.lostName.value;
	str = str.trim();
	if(!str) {
		alert("분실품목을 입력하세요. ");
		f.lostName.focus();
		return;
	}
	
	// 담당자
    str = f.tel.value;
	str = str.trim();
	if(!str) {
		alert("전화번호를 입력하세요. ");
		f.tel.focus();
		return;
	}
	
	// 담당자
    str = f.tel.value;
	str = str.trim();
	if(!str) {
		alert("전화번호를 입력하세요. ");
		f.tel.focus();
		return;
	}
	
	
	// 담당자
    str = f.lostPlace.value;
	str = str.trim();
	if(!str) {
		alert("분실장소를 입력하세요. ");
		f.lostPlace.focus();
		return;
	}
	
	// 담당자
    str = f.content.value;
	str = str.trim();
	if(!str) {
		alert("내용을 입력하세요. ");
		f.content.focus();
		return;
	}
	
	str = f.email1.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email1.focus();
        return;
    }
	
    f.email.value = f.email1.value + "@" + f.email2.value;
	
	f.action = "<%=cp%>/customerCenter/lostproperty/list";
    f.submit();
}

// 이메일 발송 
function changeEmail() {
    var f = document.lostForm;
	    
    var str = f.selectEmail.value;
    if(str!="direct") {
        f.email2.value=str; 
        f.email2.readOnly = true;
        f.email1.focus(); 
    }
    else {
        f.email2.value="";
        f.email2.readOnly = false;
        f.email1.focus();
    }
}

// 전화번호 
function checkPhoneNumber() {
  	var x = document.getElementById("tel");
  	x.value = x.value.replace(/[^0-9]/g, '');
  	var tmp = "";

  	if (x.value.length > 3 && x.value.length <= 7) {
  		tmp += x.value.substr(0, 3);
  		tmp += '-';
  		tmp += x.value.substr(3);
  		x.value = tmp;
  	} else if (x.value.length > 7) {
  		tmp += x.value.substr(0, 3);
  		tmp += '-';
  		tmp += x.value.substr(3, 4);
  		tmp += '-';
  		tmp += x.value.substr(7);
  		x.value = tmp;
  	}
  }
  
//달력 
$(function(){
	$("#regDate").datepicker({
		dateFormat:"yy-mm-dd",
		minDate:"today",
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


<div class="body-container" style="width: 700px;">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 유실물 접수 </h3>
    </div>
    

			<form name="lostForm" method="post" enctype="multipart/form-data">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tbody id="tb">
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;" >분실자명</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="lostPerson" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.lostPerson}" >
			      </td>
			  </tr>
			  
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">분실품목</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="lostName" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.lostName}" placeholder = "예)가방,파우치,안경...">
			      </td>
			  </tr>
			  
			  
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">전화번호</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" id="tel" name="tel" onkeyup="checkPhoneNumber()" class="boxTF" maxlength="13">
			      </td>
			  </tr>
			  
			  
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">이메일</td>
			      <td style="padding-left:10px;"> 
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <select name="selectEmail" id="selectEmail" onchange="changeEmail();" class="selectField">
			                <option value="">선 택</option>
			                <option value="naver.com" ${dto.email2=="naver.com" ? "selected='selected'" : ""}>네이버 메일</option>
			                <option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>한 메일</option>
			                <option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected='selected'" : ""}>핫 메일</option>
			                <option value="gmail.com" ${dto.email2=="gmail.com" ? "selected='selected'" : ""}>지 메일</option>
			                <option value="direct">직접입력</option>
			            </select>
			            <input type="text" name="email1" id="email1" value="${dto.email1}" size="13" maxlength="30"  class="boxTF">
			            @ 
			            <input type="text" name="email2" id="email2" value="${dto.email2}" size="13" maxlength="30"  class="boxTF" readonly="readonly">
						<input type="hidden" name="email" size="13" maxlength="30"  class="boxTF" readonly="readonly">
			        </p>
			      </td>
			     
			  </tr>
			  
			 
			  
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">분실일자</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" id="regDate" name="lostDate" readonly="readonly"><button></button>
			      </td>
			  </tr>
			  
			  
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">분실장소</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="lostPlace" maxlength="100" class="boxTF" 
			        style="width: 95%;" value="${dto.lostPlace}" placeholder = "예)제1전시장 입구 맞은편 벤치 ">
			      </td>
			  </tr>
			  
			  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
			      <td valign="top" style="padding:5px 0px 5px 10px;"> 
			        <textarea name="content" rows="12" class="boxTA" style="width: 95%;">${dto.content}</textarea>
			      </td>
			  </tr>
          </tbody>
		</table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="btn" onclick="lostSendOk();">등록하기</button>
			        <button type="reset" class="btn">다시입력</button>
			      </td>
			    </tr>
			  </table>
			</form>
    </div>
</div>
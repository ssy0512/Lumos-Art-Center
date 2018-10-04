<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>



<script type="text/javascript">
function memberOk() {
	var f = document.memberForm;
	var str;

	str = f.userName.value;
	str = str.trim();
	if(!str) {
		alert("이름을 입력하세요. ");
		f.userName.focus();
		return;
	}
    
    str = f.email1.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email1.focus();
        return;
    }

    str = f.email2.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email2.focus();
        return;
    }

    f.email.value = f.email1.value + "@" + f.email2.value;
    //console.log(f.email.value);

    f.action = "<%=cp%>/member/find_id";

    console.log(f.member_type.value);
    f.submit();
}

function changeEmail() {
    var f = document.memberForm;
	    
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


</script>


<br/>
<div class="body-container" style="width: 700px;">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span>아이디 찾기</h3>
    </div>
    
        <div>
			<form name="memberForm" method="post">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">이름</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <input type="text" name="userName" value="" maxlength="30" class="boxTF"
		                      style="width: 95%;"
		                      ${mode=="update" ? "readonly='readonly' ":""}
		                      placeholder="이름">
			        </p>
			        <p class="help-block">회원 가입 시, 입력한 이름을 입력하세요</p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">이메일</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 1px; margin-bottom: 5px;">
			            <select name="selectEmail" onchange="changeEmail();" class="selectField">
			                <option value="">선 택</option>
			                <option value="naver.com" ${dto.email2=="naver.com" ? "selected='selected'" : ""}>네이버 메일</option>
			                <option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>한 메일</option>
			                <option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected='selected'" : ""}>핫 메일</option>
			                <option value="gmail.com" ${dto.email2=="gmail.com" ? "selected='selected'" : ""}>지 메일</option>
			                <option value="direct">직접입력</option>
			            </select>
			            <input type="text" name="email1" value="${dto.email1}" size="13" maxlength="30"  class="boxTF">
			            @ 
			            <input type="text" name="email2" value="${dto.email2}" size="13" maxlength="30"  class="boxTF" readonly="readonly">
						<input type="hidden" name="email" value="${dto.email}" size="13" maxlength="30"  class="boxTF" readonly="readonly">
			        </p>
			        <p class="help-block">회원 가입 시, 입력한 이메일을 입력하세요</p>
			      </td>
			  </tr>
			  
			  <tr>
			      <td width="100" valign="top" style="text-align: right; padding-top: 5px;">
			            <label style="font-weight: 900;">회원 구분</label>
			      </td>
			      <td style="padding: 0 0 15px 15px;">
			        <p style="margin-top: 5px; margin-bottom: 10px;">
			            <input type="radio" name="member_type" value="1" checked> 일반회원&nbsp;&nbsp;
						<input type="radio" name="member_type" value="0"> 기업회원
			        </p>
			      </td>
			  </tr>	  
			  </table>


			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" name="sendButton" class="btn" onclick="memberOk();">아이디 찾기</button>
			      </td>
			    </tr>
			    <tr height="30">
			        <td align="center" style="color: blue;">${message}</td>
			    </tr>
			  </table>
			  
			</form>
        </div>

</div>

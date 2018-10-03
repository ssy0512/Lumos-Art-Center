<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<!-- <body>
	<div id="header" class="insert" role="banner">
		<h1><a href="localhost:9090/lumos/" class="logo"><span class="blind">LUMOS</span></a></h1>
	</div>
	<form id="createdForm" method="post" enctype="multypart/form-data">
	
	</form>
</body>
 -->
<body>
<div id="wrap">

	<!-- 스킵네비게이션 : 웹접근성대응-->
<div id="u_skip">
    <a href="#content" onclick="document.getElementById('content').tabIndex=-1;document.getElementById('content').focus();return false;"><span>본문으로 바로가기</span></a>
</div>
<!-- //스킵네비게이션 -->
<!-- header -->
<div id="header" class="join_membership" role="banner">
    <h1><a href="http://www.naver.com" class="h_logo"><span class="blind">NAVER</span></a></h1>
</div>
<!-- // header -->

<form id="join_form" method="post" action="/user2/V2Join.nhn?m=end">
    <input type="hidden" id="token_sjoin" name="token_sjoin" value="KrNfbgTpwx6BRPW0">
    <input type="hidden" id="encPswd" name="encPswd" value="">
    <input type="hidden" id="encKey" name="encKey" value="">
    <input type="hidden" id="birthday" name="birthday" value="">
    <input type="hidden" id="joinMode" name="joinMode" value="unreal">
    <input type="hidden" id="pbirthday" name="pbirthday" value="">
    <input type="hidden" id="ipinFlag" name="ipinFlag" value="">
    <input type="hidden" id="nid_kb2" name="nid_kb2" value="">

    <!-- container -->
    <div id="container" role="main">
        <div id="content">
            <!-- tg-text=title -->
            <h2 class="blind">공연 일정 등록</h2>
            <div class="join_content">
                
                <div class="row_group">
                    <div class="join_row">
                        <h3 class="join_title">공연명</h3>
                        <span class="ps_box int_id">
							<input type="text" id="concertName" name="concertName" class="int" title="ID" maxlength="20">
							<label for="concertName" class="lbl"></label>
						</span>
                    </div>

                    <div class="join_row">
                        <h3 class="join_title">비밀번호</h3>
                        <span class="ps_box int_pass" id="pswd1Img">
							<input type="password" id="pswd1" name="pswd1" class="int" title="비밀번호 입력" aria-describedby="wa_pw_help" maxlength="20">
							<label data-tg-i18n="form.pswd1" for="pswd1" class="lbl">
								<span id="pswd1Span" class="step_txt"></span>
							</label>
						</span>
                        <span class="error_next_box" id="pswd1Msg" style="display:none">5~12자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>

                        <h3 class="join_title">비밀번호 재확인</h3>
                        <span class="ps_box int_pass_check" id="pswd2Img">
							<input type="password" id="pswd2" name="pswd2" class="int" title="비밀번호 재확인 입력" maxlength="20">
							<label data-tg-i18n="form.pswd2" for="pswd2" class="lbl"></label>
						</span>
                        <span class="error_next_box" id="pswd2Msg" style="display:none"></span>
                    </div>
                </div>
                <!-- // 아이디, 비밀번호 입력 -->

                <!-- 이름, 생년월일 입력 -->
                <div class="row_group">

                    
                    <div class="join_row">
                        <h3 class="join_title">이름</h3>
                        <span class="ps_box box_right_space">
							<input type="text" id="name" name="name" title="이름" class="int" maxlength="40">
							<label for="name" class="lbl"></label>
						</span>
                        <span class="error_next_box" id="nameMsg" style="display:none"></span>
                    </div>
                    <!-- lang = ko_KR -->

                    <div class="join_row join_birthday">
                        <h3 class="join_title">생년월일</h3>
                        <div class="bir_wrap">
                            <div class="bir_yy">
								<span class="ps_box">
									<input type="text" id="yy" placeholder="년(4자)" class="int" maxlength="4">
									<label for="yy" class="lbl">년(4자)</label>
								</span>
                            </div>
                            <div class="bir_mm">
								<span class="ps_box">
									<select id="mm" title="월" class="sel">
										<option>월</option>
										  	 			<option value="01">
                                                            1
                                                        </option>
										  	 			<option value="02">
                                                            2
                                                        </option>
										  	 			<option value="03">
                                                            3
                                                        </option>
										  	 			<option value="04">
                                                            4
                                                        </option>
										  	 			<option value="05">
                                                            5
                                                        </option>
										  	 			<option value="06">
                                                            6
                                                        </option>
										  	 			<option value="07">
                                                            7
                                                        </option>
										  	 			<option value="08">
                                                            8
                                                        </option>
										  	 			<option value="09">
                                                            9
                                                        </option>
										  	 			<option value="10">
                                                            10
                                                        </option>
										  	 			<option value="11">
                                                            11
                                                        </option>
										  	 			<option value="12">
                                                            12
                                                        </option>
									</select>
								</span>
                            </div>
                            <div class=" bir_dd">
								<span class="ps_box">
									<input type="text" id="dd" placeholder="일" class="int" maxlength="2">
									<label for="dd" class="lbl">일</label>
								</span>
                            </div>
                        </div>
                        <span class="error_next_box" id="birthdayMsg" style="">태어난 년도 4자리를 정확하게 입력하세요.</span>
                    </div>

                    <div class="join_row join_sex">
                        <h3 class="join_title">성별</h3>
                        <div class="ps_box gender_code">
                            <select id="gender" name="gender" title="성별" class="sel">
                                <option value="" selected="">성별</option>
                                <option value="0">남자</option>
                                <option value="1">여자</option>
                            </select>
                        </div>
                    </div>
                    <span class="error_next_box" id="genderMsg" style="display:none"></span>

                    <div class="join_row join_email">
                        <h3 class="join_title">본인 확인 이메일<span class="terms_choice">(선택)</span></h3>
                        <span class="ps_box int_email box_right_space">
							<input type="text" id="email" name="email" maxlength="100" placeholder="선택입력" class="int">
							<label for="email" class="lbl"></label>
						</span>
                    </div>
                    <span class="error_next_box" id="emailMsg" style="display:none"></span>
                </div>
                <!-- // 이름, 생년월일 입력 -->

        
                <div class="btn_area">
                    <button type="button" id="btnJoin" class="btn_type btn_primary"><span>등록하기</span></button>
                </div>
            </div>
        </div>
    </div>
    <!-- // container -->
</form>

</div>

</body>
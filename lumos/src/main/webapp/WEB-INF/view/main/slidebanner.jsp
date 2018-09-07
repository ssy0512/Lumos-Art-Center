<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<div class="slideshow-container">
	<div class="mySlides fade">
		<div class="text">
			<div class="mySlidesLeft">
				<a class="prev" onclick="plusSlides(-1)"><img src="<%=cp %>/resource/images/lumos/left_w.png"></a>
			</div>
			<div class="mySlidesCenter">
				<a href="https://www.sacticket.co.kr/SacHome/perform/detail?searchSeq=34105">
					<p class="showName">국립창극단 &lt;변강쇠 점 찍고 옹녀&gt;</p><br>
					<p class="showdateplace">2018.10.18(목) ~ 2018.10.21(일) ｜CJ 토월극장</p>
				</a>
			</div>
			<div class="mySlidesRight">
				<a class="next" onclick="plusSlides(1)"><img src="<%=cp %>/resource/images/lumos/right_w.png"></a>
			</div>
		</div>
		<div class="blackLineDiv">
		</div>
	  <img src="<%=cp %>/resource/images/lumos/slideb-ong.jpg" style="width:100%">
	</div>
	
	<div class="mySlides fade">
		<div class="text">
			<div class="mySlidesLeft">
				<a class="prev" onclick="plusSlides(-1)"><img src="<%=cp %>/resource/images/lumos/left_w.png"></a>
			</div>
			<div class="mySlidesCenter">
				<a href="https://www.sacticket.co.kr/SacHome/perform/detail?searchSeq=34105">
					<p class="showName">손열음의 [아마데우스]</p><br>
					<p class="showdateplace">2018.10.07(일) 17:00 ｜콘서트홀</p>
				</a>
			</div>
			<div class="mySlidesRight">
				<a class="next" onclick="plusSlides(1)"><img src="<%=cp %>/resource/images/lumos/right_w.png"></a>
			</div>
		</div>
		<div class="blackLineDiv">
		</div>
	  <img src="<%=cp %>/resource/images/lumos/slideb-sonyeoleum.jpg" style="width:100%">
	</div>
	
	<div class="mySlides fade">
		<div class="text">
			<div class="mySlidesLeft">
				<a class="prev" onclick="plusSlides(-1)"><img src="<%=cp %>/resource/images/lumos/left_w.png"></a>
			</div>
			<div class="mySlidesCenter">
				<a href="https://www.sacticket.co.kr/SacHome/perform/detail?searchSeq=34105">
					<p class="showName">뮤지컬 라이온 킹 인터내셔널 투어 (Musical The Lion King)</p><br>
					<p class="showdateplace">2019.01.10(목) ~ 2019.03.28(목) ｜오페라극장</p>
				</a>
			</div>
			<div class="mySlidesRight">
				<a class="next" onclick="plusSlides(1)"><img src="<%=cp %>/resource/images/lumos/right_w.png"></a>
			</div>
		</div>
		<div class="blackLineDiv">
		</div>
	  <img src="<%=cp %>/resource/images/lumos/slideb-lion.jpg" style="width:100%">
	</div>
	
	<div style="text-align:center" class="dotDiv">
	  <span class="dot" onclick="currentSlide(1)"></span>
	  <span class="dot" onclick="currentSlide(2)"></span>
	  <span class="dot" onclick="currentSlide(3)"></span> 
	</div>

</div>
<br>


<script type="text/javascript">
	var slideIndex = 0;
	showSlides();
	
	function showSlides() {
	    var i;
	    var slides = document.getElementsByClassName("mySlides");
	    var dots = document.getElementsByClassName("dot");
	    for (i = 0; i < slides.length; i++) {
	       slides[i].style.display = "none";  
	    }
	    slideIndex++;
	    if (slideIndex > slides.length) {slideIndex = 1}    
	    for (i = 0; i < dots.length; i++) {
	        dots[i].className = dots[i].className.replace(" active", "");
	    }
	    slides[slideIndex-1].style.display = "block";  
	    dots[slideIndex-1].className += " active";
	    setTimeout(showSlides, 4000); // Change image every 2 seconds
	}
	
	
	

	function plusSlides(n) {
		showSlidesMove(slideIndex += n);
	}

	function currentSlide(n) {
		showSlidesMove(slideIndex = n);
	}

	function showSlidesMove(n) {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		if (n > slides.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
	}
</script>

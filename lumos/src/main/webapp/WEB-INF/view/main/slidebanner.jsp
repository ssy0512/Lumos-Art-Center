<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<div class="slideshow-container">

	<c:forEach items="${conList}" var="con">
		<div class="mySlides fade">
			<div class="text">
				<div class="mySlidesLeft">
					<a class="prev" onclick="plusSlides(-1)"><img src="<%=cp %>/resource/images/lumos/left_w.png"></a>
				</div>
				<div class="mySlidesCenter">
					<p class="showName"><a href="<%=cp%>${con.articleAddr}">${con.concertName}</a></p><br>
					<p class="showdateplace"><a href="<%=cp%>${con.articleAddr}">${con.concertStart} ~ ${con.concertEnd} ｜ ${con.hallName}</a></p>
				</div>
				<div class="mySlidesRight">
					<a class="next" onclick="plusSlides(1)"><img src="<%=cp %>/resource/images/lumos/right_w.png"></a>
				</div>
			</div>
			<div class="blackLineDiv">
			</div>
		  <a href="<%=cp%>${con.articleAddr}"><img src="<%=cp %>/uploads/image/${con.slideBanner}" style="width:100%"></a>
		</div>
	</c:forEach>	
	
		<c:forEach items="${exList}" var="ex">
			<div class="mySlides fade">
				<div class="text">
					<div class="mySlidesLeft">
						<a class="prev" onclick="plusSlides(-1)"><img src="<%=cp %>/resource/images/lumos/left_w.png"></a>
					</div>
					<div class="mySlidesCenter">
						<p class="showName"><a href="<%=cp%>${ex.articleAddr}">${ex.exhibitName}</a></p><br>
						<p class="showdateplace"><a href="<%=cp%>${ex.articleAddr}">${ex.exhibitStart} ~ ${ex.exhibitEnd} ｜ ${ex.hallName}</a></p>
					</div>
					<div class="mySlidesRight">
						<a class="next" onclick="plusSlides(1)"><img src="<%=cp %>/resource/images/lumos/right_w.png"></a>
					</div>
				</div>
				<div class="blackLineDiv">
				</div>
			  <a href="<%=cp%>${ex.articleAddr}"><img src="<%=cp %>/uploads/image/${con.slideBanner}" style="width:100%"></a>
			</div>
		</c:forEach>

	<div style="text-align:center" class="dotDiv">
		<c:forEach begin="1" end="${listLength}" varStatus="status">
			<span class="dot" onclick="currentSlide(${status.count})"></span>
		</c:forEach>
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

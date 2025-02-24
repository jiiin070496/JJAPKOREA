<!-- [1] 해상도 - 최적해상도 1240 결정 -->
<!-- [2] content 영역 1240px -->
<!-- [3] reset.css 폴더경로 -->
<%-- <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/reset.css"> --%>
<!-- [4] project명 또는 core.css 폴더경로 - bootstrap 등으로 대체 -->
<!-- [4] 기본색상 10~15개 정도 class 미리 만들어두기 -->
<!-- [4] 폰트크기 3~7개 정도 class 미리 만들어두기 -->
<!-- [4] button 3개 class 미리 만들어두기 -->
<!-- [4] a 모양 미리 만들어두기 -->
<!-- [5] layout 영역 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources//onpick/css/onpick_layout.css">
<!-- [6] header 영역 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources//onpick/css/onpick_header.css">
<!-- [7] nav 영역 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources//onpick/css/onpick_nav.css">
<!-- [8] main 영역 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources//onpick/css/onpick_main.css">
<!-- [9] footer 영역 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources//onpick/css/onpick_footer.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
	    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="icon" href="../favicon.ico">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이직은 원픽 | KH</title>
    <!-- swiper css -->
	<!-- 부트스트랩 css -->
    <!-- jQuery 스크립트 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- nav script -->
    <script src="<%=request.getContextPath() %>/resources//onpick/js/onpick_nav.js"></script>

    <script>
        /* $(document).ready(function() {
            // html 파일 불러오기
            $.ajax({
                url : "onpick_header.html",
                success : function(result) {
                    var headerrefine = $(".wrap.header").html(result).find('header');
                    $('.wrap.header').html(headerrefine);
                }
            });
            $.ajax({
                url : "onpick_nav.html",
                success : function(result) {
                    var navrefine = $(".wrap.nav").html(result).find('nav');
                    $('.wrap.nav').html(navrefine);
                }
            });
            $.ajax({
                url : "onpick_main.html",
                success : function(result) {
                    var contentrefine = $(".wrap.content").html(result).find('main');
                    $('.wrap.content').html(contentrefine);
                }
            });
            $.ajax({
                url : "onpick_footer.html",
                success : function(result) {
                    var footerrefine = $(".wrap.footer").html(result).find('footer');
                    $('.wrap.footer').html(footerrefine);
                }
            });
        }); */
        </script> 
        <style>
        /* 왼쪽 버튼 */
.abc{
    width: 52px;
    height: 52px;
    left: 0;
    top: 0;
    z-index: 999;
    margin: 0;
    background-image: url(/jjapkorea/resources/onpick/images/prev-filter-button.svg);
    background-size: cover;
}
        </style>
</head>
<body>
<div class="abc"></div>
    <%-- <jsp:include page="onpick_nav.jsp"></jsp:include> --%>
    <div class="wrap header">
	    <jsp:include page="onpick_header.jsp"></jsp:include>
        <!-- onpick_header.html 파일 불러오기 -->
    </div>
    <div class="wrap nav">
        <!-- onpick_nav.html 파일 불러오기 -->
    </div>
    <div class="wrap content">
	    <jsp:include page="onpick_main.jsp"></jsp:include>
        <!-- onpick_main.html 파일 불러오기 -->
    </div>
    <div class="wrap footer">
	    <jsp:include page="onpick_footer.jsp"></jsp:include>
        <!-- onpick_footer.html 파일 불러오기 -->
    </div>
    <!-- swiper 스크립트 -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</body>
</html>
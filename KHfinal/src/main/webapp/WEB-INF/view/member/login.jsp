<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/member/css/jobkh_login.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 | KH</title>
    <link rel="icon" href="resources/favicon.ico">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>

<body>
<!-- 경고창 띄우기 위한 방법 -->
<jsp:include page="/WEB-INF/view/msg/msg.jsp"></jsp:include>
    <div id="wrap">

        <div id="container">
            <div class="logtop logtop_login">
                <h1 class="hd"><span class="logo"></span>하나의 아이디로 잡코리아, 알바몬 서비스를 모두 이용하실 수 있습니다.</h1>
                <p class="lnb"><a href="<%=request.getContextPath() %>/index">잡코리아홈</a> <span class="txtBar">|</span> <a
                        href="http://www.jobkorea.co.kr/Customer_C/CC_Main.asp">고객센터</a></p>
            </div>

            <div class="secLogin">
                <div class="logWrap" id="loginFormWrite">
                    <h2 class="blind">로그인</h2>

                    <form name="form" id="form" method="post" action="<%=request.getContextPath() %>/login.login" onsubmit="return login_send();">
                        <fieldset class="login_form">
                            <legend class="blind">로그인 입력폼</legend>
                            <input type="hidden" name="re_url" id="re_url" value="/">
                            <input type="hidden" name="idx" value="">
                            <input type="hidden" name="Div" value="">
                            <input type="hidden" name="BNo" value="">
                            <input type="hidden" id="IP_ONOFF" name="IP_ONOFF" value="Y">
                            <input type="hidden" name="Login_Stat" id="Login_Stat" value="">
                            <input type="hidden" name="LoginPage" value="/Login/Login_Tot.asp">
                            <input type="hidden" name="returnHost" id="returnHost" value="http://www.jobkorea.co.kr">
                            <input type="hidden" name="jkwww_host" id="jkwww_host" value="https://www.jobkorea.co.kr">
                            <input type="hidden" name="NaverReferReURL_Stat" id="NaverReferReURL_Stat" value="">
                            <input type="hidden" name="DB_Name" id="DB_Name" value="GG">
                            <input type="hidden" name="ignoreSession" id="ignoreSession" value="">

                            <input type="hidden" name="m_type" id="m_type" value="">
                            <!-- 회원선택-->
                            <div class="select_row">
                                <ul id="devMemTab">
                                    <li class="on"><a href="#" data-m-type="M">개인회원</a></li>
                                    <li class=""><a href="#" data-m-type="Co">기업회원</a></li>
                                </ul>
                            </div>
                            <div class="select_row devHide" id="devCoTab" style="display: none;">
                                <p class="sort">
                                    <input type="radio" id="lb_memberGi" name="Co_DB_Name" value="GI"
                                        onclick="fChkIntroGI('Co')" checked=""
                                        data-href="https://www.jobkorea.co.kr/Join/GI_Regist"> <label for="lb_memberGi"
                                        class="radioOn">기업회원</label>
                                    <input type="radio" id="lb_memberSf" name="Co_DB_Name" value="SF"
                                        onclick="fChkIntroGI('Co')"
                                        data-href="https://www.jobkorea.co.kr/Join/HR_Regist"> <label
                                        for="lb_memberSf">서치펌회원</label>
                                </p>
                            </div>

                            <div class="input_row">
                                <label for="M_ID" id="lb_id" class="blind">아이디</label>
                                <input type="text" class="inpTxt inpID off" name="M_ID" id="M_ID" size="16"
                                    maxlength="20" title="아이디 입력" style="ime-mode:inactive;" autocomplete="off">
                                <label for="M_PWD" id="lb_pw" class="blind">비밀번호</label>
                                <input type="password" class="inpTxt inpPW devCapsLock off" name="M_PWD" id="M_PWD"
                                    size="16" title="비밀번호 입력" autocomplete="off">
                                <button type="submit" class="btLoin">로그인</button>
                                <div class="lyCapsLock" id="ipNotice">
                                    <em>Caps Lock</em>이 켜져 있습니다.<span class="mainIcn mainIcnArrUp"></span>
                                </div>
                                
                            </div>

                            <div class="input_row">
                                <label for="M_ID" id="lb_id" class="blind">아이디</label>
                                <input type="text" class="inpTxt inpID off" name="M_ID2" id="M_ID" size="16"
                                    maxlength="20" title="아이디 입력" style="ime-mode:inactive;" autocomplete="off">
                                <label for="M_PWD" id="lb_pw" class="blind">비밀번호</label>
                                <input type="password" class="inpTxt inpPW devCapsLock off" name="M_PWD2" id="M_PWD"
                                    size="16" title="비밀번호 입력" autocomplete="off">
                                <button type="submit" class="btLoin">로그인</button>
                                <div class="lyCapsLock" id="ipNotice">
                                    <em>Caps Lock</em>이 켜져 있습니다.<span class="mainIcn mainIcnArrUp"></span>
                                </div>
                                
                            </div>








                            <div class="check_row">
                                <input type="checkbox" name="lb_idSave" id="lb_idSave" value="Y"> <label
                                    for="lb_idSave">로그인 상태 유지</label>
                                <span class="txtBar"> | </span>
                                <a href="javascript:void(0)" class="devSecPop">IP보안</a> <button type="button"
                                    class="btnSecurity btnSecurity_on" onclick="ipCheckSetting();"><span
                                        class="setOn">ON</span></button>
                                <!--<span id="ipNotice" class="devHide"><img src="https://i.jobkorea.kr/content/images/login/ver_1/ip_layer_bg.png" alt="개인정보 보호를 위해 IP보완을 ON으로 변경해주세요"></span>-->
                                <p class="sch"><a href="https://www.jobkorea.co.kr/Login/Search/search_id.asp"
                                        target="_new">아이디 찾기</a> <span class="txtBar"> | </span> <a
                                        href="https://www.jobkorea.co.kr/Login/Search/search_pwd.asp" target="_new">비밀번호
                                        찾기</a></p>
                            </div>

                            <!--// 그림문자 입력폼 -->
                            <div class="capck_row loginImgTxt devHide">
                                <label for="gtxt" class="blind">그림문자</label>
                                <input type="text" class="inpTxt inpCap" name="gtxt" id="gtxt" size="16" title="그림문자 입력"
                                    autocomplete="off"><!--[개발] end 추가하면 배경텍스트 사라짐 -->
                                <div class="captcha">
                                    <span class="img"><img id="imgCaptcha" src="/login/captcha.asp" width="198"
                                            height="40" alt="그림문자"></span>
                                    <a href="javascript:void(0)" class="changeImg"
                                        onclick="RefreshImage('imgCaptcha')"><span class="skip">새로고침</span></a>
                                </div>
                            </div>
                            <!-- 그림문자 입력폼 //-->

                            <p class="alarmMsg"></p>


							<!--	API SNS Login   -->
                            <div class="list-social">
                                <ul>
                                    <li><a href="${ naver_url }" id="btnNvLogin" class="naver" onclick="_LA.EVT('4287')"
                                            style="display: block;">네이버 로그인</a></li>
                                    <li><a href="${ kakao_url }" id="btnKaLogin" class="kakao" onclick="_LA.EVT('4286')"
                                            style="display: block;">카카오 로그인</a></li>
                                    <li><a href="javascript:;" id="btnFbLogin" class="facebook"
                                            onclick="facebookLogin(); _LA.EVT('4285')" style="display: block;">페이스북
                                            로그인</a></li>
                                    <li><a href="${ google_url }" id="btnGlLogin" class="google" onclick="_LA.EVT('4288')"
                                            style="display: block;">
                                            <div class="S9gUrf-YoZ4jf" style="position: relative;">
                                              <img src="resources/images/google_logo.png" width="40" height="40"  alt="Google 로고">
                                            </div>
                                        </a></li>
                                    <li><a href="javascript:;" id="btnApLogin" class="apple" style="display: block;">애플
                                            로그인</a></li>
                                </ul>
                            </div>


                            <div class="join">
                                <div id="M_Alert" style="display: block;">
                                    좋은 일을 찾으시나요? 회원가입하시고 다양한 혜택을 누리세요!
                                    <a href="<%=request.getContextPath() %>/psignup" target="_new">회원가입</a>
                                </div>
                                <div id="Co_Alert" style="display: none;">
                                    좋은 인재를 구하시나요? 회원가입하시고 다양한 혜택을 누리세요!
                                    <a href="<%=request.getContextPath() %>/psignup" target="_new">회원가입</a>
                                    <div class="text-balloon" style="display: none;">신규가입 <span>3종</span> 쿠폰 제공!</div>
                                </div>
                            </div>

                        </fieldset>
                    </form>
                </div>
                <div class="adBan">
                    <h2 class="skip">광고</h2>
                    <iframe width="325" height="310" noresize="" scrolling="no" frameborder="0" marginheight="0"
                        marginwidth="0"
                        src="https://yellow.contentsfeed.com/RealMedia/ads/adstream_sx.ads/jobkorea/login@x01"
                        title="광고"></iframe>
                </div><!-- AD //-->
            </div><!-- // content -->

            <div class="section-company" style="display: none;">
                <div class="article-jobkorea target">
                    <div class="inner">
                        <img src="https://i.jobkorea.kr/content/images/join/company/img_company_01.png" alt="">
                    </div>
                </div>
                <div class="article-super target">
                    <div class="inner">
                        <img src="https://i.jobkorea.kr/content/images/join/company/img_company_02.png" alt="">
                    </div>
                </div>
                <div class="article-smart target">
                    <div class="inner">
                        <img src="https://i.jobkorea.kr/content/images/join/company/img_company_03.png" alt="">
                    </div>
                </div>
                <div class="article-search target">
                    <div class="inner">
                        <img src="https://i.jobkorea.kr/content/images/join/company/img_company_04.png" alt="">
                    </div>
                </div>
                <div class="article-hunting target">
                    <div class="inner">
                        <img src="https://i.jobkorea.kr/content/images/join/company/img_company_05.png" alt="">
                    </div>
                </div>
                <div class="article-learning target">
                    <div class="inner">
                        <img src="https://i.jobkorea.kr/content/images/join/company/img_company_06.png" alt="">
                    </div>
                </div>
                <div class="article-start target">
                    <div class="inner">
                        <img src="https://i.jobkorea.kr/content/images/join/company/img_company_07.png?20200327" alt="">
                        <a href="https://www.jobkorea.co.kr/Join/GI_Regist" class="btn-start">
                            <img src="https://i.jobkorea.kr/content/images/join/company/btn_join.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="btn-fixed-right">
                    <a href="<%=request.getContextPath() %>/psignup" class="btn-join-right">가입하기</a>
                    <a href="javascript:;" onclick="$('html, body').animate({scrollTop: 0}, 800);"
                        class="btn-top btn-top-scroll">
                        <img src="https://i.jobkorea.kr/content/images/join/company/btn_top.png" alt="">
                    </a>
                </div>
            </div>

            <div id="adFooter" class="footer footer--short">
                <div class="footer__wrap">
                    <div class="footer__advertisement clear">
                        <h3 class="blind">배너</h3>


                        <p class="footer__advertisement--text"><iframe width="195" height="35" noresize=""
                                scrolling="no" frameborder="0" marginheight="0" marginwidth="0"
                                src="https://yellow.contentsfeed.com/RealMedia/ads/adstream_sx.ads/jobkorea/sub@Frame1"
                                title="광고"></iframe></p>
                        <p class="footer__advertisement--text"><iframe width="495" height="110" noresize=""
                                scrolling="no" frameborder="0" marginheight="0" marginwidth="0"
                                src="https://yellow.contentsfeed.com/RealMedia/ads/adstream_sx.ads/jobkorea/sub@Bottom"
                                title="광고"></iframe></p>
                        <p class="footer__advertisement--text"><iframe width="195" height="35" noresize=""
                                scrolling="no" frameborder="0" marginheight="0" marginwidth="0"
                                src="https://yellow.contentsfeed.com/RealMedia/ads/adstream_sx.ads/jobkorea/sub@Frame2"
                                title="광고"></iframe></p>

                        <!--<table width="%=Footer_Width%>" border="0" cellspacing="0" cellpadding="0" align="center" style="margin:0 auto;">
        <tbody>
        <tr>
            <td colspan="3" height="30"></td>
        </tr>
        <tr>
            <td align="center">
                <div id="ad_000">
                
                     <p class="footer__advertisement--text"><iframe width="195" height="35" noresize scrolling="no" frameborder="0" marginheight="0" marginwidth="0" src="https://yellow.contentsfeed.com/RealMedia/ads/adstream_sx.ads/jobkorea/sub@Frame1" title="광고"></iframe></p>
                
                </div>
            </td>
            <td width="495" align="center">
                <div id="ad_001">
                
                     <p class="footer__advertisement--text"><iframe width="495" height="110" noresize scrolling="no" frameborder="0" marginheight="0" marginwidth="0" src="https://yellow.contentsfeed.com/RealMedia/ads/adstream_sx.ads/jobkorea/sub@Bottom" title="광고"></iframe></p>
                
                </div>
            </td>
            <td align="center">
                <div id="ad_002">
                
                     <p class="footer__advertisement--text"><iframe width="195" height="35" noresize scrolling="no" frameborder="0" marginheight="0" marginwidth="0" src="https://yellow.contentsfeed.com/RealMedia/ads/adstream_sx.ads/jobkorea/sub@Frame2" title="광고"></iframe></p>
                
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="3" height="30"></td>
        </tr>
        </tbody>
    </table>-->

                    </div>
                </div>
            </div>
        </div><!-- container //-->

        <div id="footer">
            <p id="copyright"><img src="https://i.jobkorea.kr/content/images/login/ver_1/copyright.png?220104"
                    alt="©JOBKOREA Corp. All Rights Reserved."></p>
        </div><!-- footer //-->

    </div>
    <script>
    	/* var aList = document.querySelectorAll("#devMemTab a");
    	for(int i=0; i<aList.length; i++){        	
    		aList[i].setAttribute("href","javascript:void(0)"); 
    	} */
    
/*     	document.addEventListener("DOMContentLoaded", function() {
    	    var aList = document.querySelectorAll("#devMemTab a");
    	    for (var i = 0; i < aList.length; i++) {
    	        aList[i].addEventListener("click", function(e) {
    	            e.preventDefault(); // 기본 동작(링크 이동)을 막습니다.
    	        });
    	    }
    	});
    	
    	
   		document.querySelector(".input_row.co").style.display = "none";
   		
        document.querySelector("#devMemTab>li:first-child").addEventListener("click", function()){
                document.querySelector("#devMemTab>li:first-child").classList.add("on");
                document.querySelector("#devMemTab>li:nth-child(2)").classList.remove("on");
                document.querySelector("#M_Alert").style.display = "block";
                document.querySelector("#Co_Alert").style.display = "none";
                document.querySelector(".input_row").style.display = "block";
                document.querySelector(".input_row.co").style.display = "none";
               
        })
   		
        document.querySelector("#devMemTab>li:nth-child(2)").addEventListener("click", function(){
                document.querySelector("#devMemTab>li:first-child").classList.remove("on");
                document.querySelector("#devMemTab>li:nth-child(2)").classList.add("on");
                document.querySelector("#M_Alert").style.display = "none";
                document.querySelector("#Co_Alert").style.display = "block";
                document.querySelector(".input_row").style.display = "none";
                document.querySelector(".input_row.co").style.display = "block";
        })
  */
  
        
  document.addEventListener("DOMContentLoaded", function() {
	    // 링크 클릭 시 기본 동작(페이지 새로고침) 막기
	    var aList = document.querySelectorAll("#devMemTab a");
	    for (var i = 0; i < aList.length; i++) {
	        aList[i].addEventListener("click", function(e) {
	            e.preventDefault();
	        });
	    }

	    // 개인회원, 기업회원 탭 클릭 시 내용 변경
	    var devMemTab = document.querySelector("#devMemTab");
	    var tabs = devMemTab.querySelectorAll("li");
	    var inputRows = document.querySelectorAll(".input_row");
	    inputRows[1].style.display = "none";
	    
	    tabs[0].addEventListener("click", function() {
	    	$("#m_type").val("P");
	        tabs[0].classList.add("on");
	        tabs[1].classList.remove("on");
	        document.querySelector("#M_Alert").style.display = "block";
            document.querySelector("#Co_Alert").style.display = "none";
	        inputRows[0].style.display = "block";
	        inputRows[1].style.display = "none";
	    });

	    tabs[1].addEventListener("click", function() {
	    	$("#m_type").val("B");
	        tabs[0].classList.remove("on");
	        tabs[1].classList.add("on");
	        document.querySelector("#M_Alert").style.display = "none";
            document.querySelector("#Co_Alert").style.display = "block";
	        inputRows[0].style.display = "none";
	        inputRows[1].style.display = "block";
	    });
	});
        
        
        
        
        
        
        
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="signUp.css">
    <link rel="stylesheet" href="reset.css">
    <link rel="stylesheet" href="footer.css">
    
    <style type="text/css">
        .section {
            margin: auto;
            justify-content: center;
            width: 60%;
        }
        .userIDCheck:hover {
  			background-color: #f9f5ea;
  			color: #FFB02E;
        }
    </style>
    <script type="text/javascript">
        function button1() {
            document.getElementById("button1").click();
        }
        function button2() {
            document.getElementById("button2").click();
        }
        function button3() {
            document.getElementById("button3").click();
        }
        function button4() {
            document.getElementById("button4").click();
        }
    </script>
</head>

<body style="background-color: #F9F5EA;">
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
    <header style="background-color: #FFB02E;">
        <section class="section">
            <br>
            <table class="header">
                <tr>
                    <td style="width: 17%;">
                        <a href="main.jsp">
                            <img src="img/logo.png" style="height: 50px">
                        </a>
                    </td>
                    <td style="width: 50%; align-items: stretch;">
                        <input class="input" type="text" name="search" placeholder="검색어를 입력하세요">
                        <input class="submit" type="submit" value="submit"></input>
                    </td>
                    <td style="width: 17%;"></td>
                    <td style="width: 8%;">
                        <button class="signUp" onclick="location.href='signUp.jsp'">Sign up</button>
                    </td>
                    <td style="width: 8%;">
                        <button class="signIn" onclick="location.href='signIn.jsp'">Sign in</button>
                    </td>
                </tr>
            </table>
            <br>
            <ul></ul>
            <ul class="nav">
                <div class="menu">
                    <li><a id="button1" href="#none" style="font-weight: 900;">업체예약</a></li>
                    <li><a id="button2" href="comunity.jsp" style="font-weight: 900;">커뮤니티</a></li>
                    <li><a id="button3" href="individualT.jsp" style="font-weight: 900;">위탁</a></li>
                    <li><a id="button4" href="Int.jsp" style="font-weight: 900;">회사소개</a></li>
                </div>
            </ul>
        </section>
    </header>
    <div class="sign_up">
        <div class="bigtitle">회원가입</div><br>
        <form method="post" action="signUpAction.jsp">
            <fieldset style="border-bottom: 1px solid #ccc;">
                <legend><mark>로그인 정보</mark></legend>
                <ul>
                    <li>
                        <label for="login_info" class="title">아이디</label>
                        <input type="text" name="userID" id="userID" placeholder="영문 또는 숫자 6~16자리" required>
                        <!--required: 폼 데이터(form data)가 서버로 제출되기 전 반드시 채워져 있어야 하는 입력 필드를 명시-->
                        <button style="border: 1px solid; padding: 5px; border-radius: 5px; font-size: 10px; background-color: #ffffff9e;
  							border: 1px solid #0000003b; cursor: pointer;"type="button" class="userIDCheck">중복확인</button>
                    </li>
                    <li>
                        <label for="password" class="title">비밀번호</label>
                        <input type="password" name="userPassword" id="userPassword" placeholder="8~16자/문자, 숫자, 특수문자 혼용" required>
                    </li>
                    <li>
                        <label for="password_chk" class="title">비밀번호 확인</label>
                        <input type="password" name="userPassword2"  id="userPassword2" placeholder="비밀번호를 확인해 주세요." required>
                    </li>
                </ul>
            </fieldset>
            <fieldset style="border-bottom: 1px solid #ccc;">
                <legend><mark>회원 정보</mark></legend>
                <ul>
                    <li>
                        <label for="username" class="title">이름</label>
                        <input type="text" name="userName" id="userName" required>
                    </li>
                    <li>
                        <label for="nickname" class="title">닉네임</label>
                        <input type="text" name="nickname" id="nickname" required>
                    </li>
                    <li>
                        <label for="email" class="title">이메일</label>
                        <input type="text" size="15" name="userEmail" id="userEmail" required><text style="font-size: 10px;">@</text>
                        <select>
                            <option value="">직접입력</option>
                            <option value="naver">naver.com</option>
                            <option value="daum">daum.net</option>
                            <option value="google">gmail.com</option>
                            <option value="nate">nate.com</option>
                        </select>
                    </li>
                    <li>
                        <label for="tel" class="title">전화번호</label>
                        <input type="tel" size="20" name="userTel" id="userTel" required>
                    </li>
                    <li style="font-size: 5px; margin-left: 160px;">* '-' 제외하고 기입해주세요
                    </li>
                </ul>
            </fieldset>
            <fieldset>
                <legend><mark>약관 동의</mark></legend>
                <ul>
                    <label for="agreechk" class="title"></label>
                    <li style="margin-left:70px;">
                        <input type="checkbox" id="chkagree1" required><button class="agreechk" onclick="window.open('agree1.html','agree','width='+ 500 +', height='+ 600 +', left=' + Math.ceil(( window.screen.width - 500 )/2) + ', top='+ Math.ceil(( window.screen.height - 600 )/2) 
                    +'resizable=1,scrollbars=1'); return false;">이용약관 동의(필수)</button>
                    </li>
                    <li style="margin-left:70px;">
                        <input type="checkbox" required><button class="agreechk" onclick="window.open('agree2.html','agree','width='+ 500 +', height='+ 600 +', left=' + Math.ceil(( window.screen.width - 500 )/2) + ', top='+ Math.ceil(( window.screen.height - 600 )/2) 
                    +'resizable=1,scrollbars=1'); return false;">개인정보 수집 및 이용에 대한 안내(필수)</button>
                    </li>
                    <li style="margin-left:70px;">
                        <input type="checkbox"><button class="agreechk" onclick="window.open('agree3.html','agree','width='+ 500 +', height='+ 600 +', left=' + Math.ceil(( window.screen.width - 500 )/2) + ', top='+ Math.ceil(( window.screen.height - 600 )/2) 
                    +'resizable=1,scrollbars=1'); return false;">위치정보 이용약관 동의(선택)</button>
                    </li>
                </ul>
            </fieldset>
            <div class="centered">
                <button type="submit" class="signUp_bt">회원가입</button>
            </div>
        </form>
    </div>
    <footer id="footer">
        <div class="footer-main">
            <div id="copyright">
                <ul class="copyright-list">
                    <li>고객문의 <a href="mailto:cs@happypetppy.com"><text>cs@happypetppy.com</text></a>
                    </li>
                    <li>제휴문의 <a href="mailto:contact@happypetppy.com"><text>contact@happypetppy.com</text></a></li>
                </ul>
                <br>
                <ul class="copyright-list">
                    <li>지역광고 <a href="mailto:ad@happypetppy.com"><text>ad@happypetppy.com</text></a>
                    </li>
                    <li>PR문의 <a href="mailto:pr@happypetppy.com"><text>pr@happypetppy.com</text></a>
                    </li>
                </ul>
                <br><br>
                <ul class="copyright-list">
                    <li>
                        <address><text>경상북도 경산시 하양읍 하양로 13-13 (Happy Petppy)</text></address>
                    </li>
                </ul>
                <br><br>
                <ul class="copyright-list">
                    <li>사업자 등록번호 : 001-002-0003</li>
                    <li>직업정보제공사업 신고번호 : J0000000000000</li>
                </ul>
                <div class="copyright-text"><text>©Happy Petppy Inc.</text></div>
            </div>
        </div>
    </footer>
</body>
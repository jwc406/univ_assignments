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
    <title>로그인</title>
    <link rel="stylesheet" href="signIn.css">
    <link rel="stylesheet" href="reset.css">
    <link rel="stylesheet" href="footer.css">
    <style type="text/css">
        .section {
            margin: auto;
            justify-content: center;
            width: 60%;
        }

.loginbox {
  width: 40%;
  height: auto;
  margin: 100px auto;
}

.bigtitle {
  width: 300px;
  margin: 0 auto;
  margin-top: -20px;
  margin-bottom: 5px;
  font-weight: bold;
  border-bottom: 2px solid #ffb02e;
  text-align: center;
  line-height: 50px;
  font-size: 15px;
  color: #ffb02e;
}

.loginbox h1 {
  width: 100%;
  height: 80%;
  padding-top: 30px;
  box-sizing: border-box;
  text-align: center;
}

.loginbox form {
  width: 100%;
  height: 100%;
  border: 1px solid #c6c6c647;
  padding: 20px 25px;
  box-sizing: border-box;
  border-radius: 5px;
  background-color: #ffffffb5;
}

.loginbox legend {
  position: absolute;
  left: -999em;
}

.loginbox h2 {
  width: 100%;
  height: 100%;
  margin-bottom: 30px;
  color: #000;
  font-size: 15px;
  font-weight: bold;
  text-align: center;
}

.loginbox .away {
  position: absolute;
  left: -999em;
}


#userID {
  display: block;
  justify-content: center;
  align-items: center;
  width: 70%;
  height: 30px;
  border: 1px solid #ccc;
  box-sizing: border-box;
  padding: 0 45px;
  padding-top: 5px;
  border-radius: 5px 5px 0 0;
  background-image: url(img/login_icon.png);
  background-repeat: no-repeat;
  background-position: 15px center;
  background-size: 16px 16px;
  color: #333;
  font-size: 13px;
}

#userID::placeholder {
  color: #ccc;
  font-size: 13px;
}

#userPassword {
  display: block;
  width: 70%;
  height: 30px;
  border: 1px solid #ccc;
  box-sizing: border-box;
  border-top: none;
  padding: 0 45px;
  padding-top: 5px;
  border-radius: 0 0 5px 5px;
  background-image: url(img/pass_icon.png);
  background-repeat: no-repeat;
  background-position: 15px center;
  background-size: 16px 16px;
  color: #333;
  font-size: 13px;
}

#userPassword::placeholder {
  color: #ccc;
  font-size: 13px;
}

#userID:focus,
#userPassword:focus {
  outline: none;
  border: 2px solid #ffb02e;
}

.loginbox .chechline {
  width: 100%;
  height: 70px;
  margin-top: 10px;
}

.loginbox .chechline .text {
  color: #666;
  font-size: 12px;
}

.loginbox .chechline input {
  position: absolute;
  left: -999em;
}

.loginbox .loginCheck {
  float: left;
  padding-top: 2px;
}

.loginbox .loginCheck .circle {
  display: inline-block;
  width: 17px;
  height: 17px;
  background-image: url(img/check_gray.png);
  background-size: cover;
  position: relative;
  top: 4px;
  cursor: pointer;
}

.loginbox .loginCheck input:checked + .circle {
  background-image: url(img/check_yellow.png);
}

.loginbox button {
  display: block;
  width: 70%;
  height: 40px;
  border: none;
  background-color: #ffb02e;
  border: 1px solid #ffb02e;
  box-sizing: border-box;
  border-radius: 8px;
  color: white;
  font-size: 15px;
  font-weight: bold;
  margin-top: -20px;
  cursor: pointer;
}

.loginbox button:hover {
  background-color: #ffaf2e88;
  color: #ffb02e;
  border: none;
}

.loginbox .listbox {
  width: 100%;
  height: 60px;
}

.loginbox .listbox ul {
  width: 100%;
  height: 100%;
  text-align: center;
  line-height: 60px;
}

.loginbox .listbox li {
  display: inline-block;
  margin: 0 10px;
}

.loginbox .listbox li::after {
  content: "|";
  font-size: 12px;
  color: #dadada;
  position: relative;
  left: 12px;
  top: -2px;
}

.loginbox .listbox li:last-child:after {
  display: none;
}

.loginbox .listbox a {
  font-size: 13px;
  color: #666;
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
                        <button class="signIn" onclick="location.href='signIn.html'">Sign in</button>
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
    <div class="loginbox">
        <div class="bigtitle">로그인</div><br>
        <form method="post" action="signInAction.jsp">
            <fieldset style="border: none;">
                <legend>로그인 구역</legend>
                <h2><mark style="background-color: #ffaf2e2b;">🧡HAPPY PETPPY 방문을 환영합니다🧡</mark></h2>
                <label for="userID" class="away">아이디 입력</label>
                <input style="margin-left: 60px;" type="text" name="userID" id="userID" placeholder="아이디">
                <label for="userPassword" class="away">비밀번호 입력</label>
                <input style="margin-left: 60px;" type="password" name="userPassword" id="userPassword" placeholder="비밀번호">

                <div class="chechline">
                    <label for="loginCheck" class="loginCheck" style="margin-left: 55px;">
                        <input type="checkbox" name="loginCheck" id="loginCheck">
                        <i class="circle"></i>
                        <span class="text" style="cursor: pointer;">로그인 상태 유지</span>
                    </label>
                </div>
                <button type="submit" style="margin-left: 60px;" id="btn">로그인</button>
            </fieldset>
        </form>
        <div class="listbox">
            <ul>
                <li><a href="#">비밀번호 찾기</a></li>
                <li><a href="#">아이디 찾기</a></li>
                <li><a href="signUp.jsp">회원 가입</a></li>
            </ul>
        </div>
    </div>
    <footer id="footer">
        <div class="footer-main">
            <div id="copyright">
                <ul class="copyright-list">
                    <li>고객문의 <a href="mailto:cs@happypetppy.com">cs@happypetppy.com</a>
                    </li>
                    <li>제휴문의 <a href="mailto:contact@happypetppy.com">contact@happypetppy.com</a></li>
                </ul>
                <br>
                <ul class="copyright-list">
                    <li>지역광고 <a href="mailto:ad@happypetppy.com">ad@happypetppy.com</a>
                    </li>
                    <li>PR문의 <a href="mailto:pr@happypetppy.com">pr@happypetppy.com</a>
                    </li>
                </ul>
                <br><br>
                <ul class="copyright-list">
                    <li>
                        <address>경상북도 경산시 하양읍 하양로 13-13 (Happy Petppy)</address>
                    </li>
                </ul>
                <br><br>
                <ul class="copyright-list">
                    <li>사업자 등록번호 : 001-002-0003</li>
                    <li>직업정보제공사업 신고번호 : J0000000000000</li>
                </ul>
                <div class="copyright-text">©Happy Petppy Inc.</div>
            </div>
        </div>
    </footer>
</body>
</html>
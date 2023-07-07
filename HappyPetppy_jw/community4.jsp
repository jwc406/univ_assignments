<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>커뮤니티 글 목록</title>
    <link href="header.css" rel="stylesheet">
    <link rel="stylesheet" href="reset.css">
    <link rel="stylesheet" href="footer.css">
    <link rel="stylesheet" href="community.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style type="text/css">
        .section {
            margin: auto;
            justify-content: center;
            width: 60%;
        }

        #button2 {
            color: #FFB02E;
        }

        a:link {
            color: inherit;
            text-decoration: none;
        }

        a:visited {
            color: inherit;
            text-decoration: none;
        }

        a:hover {
            color: #996b20;
        }

        .menu-active {
            color: #FFB02E;
        }

        .mainart {
            margin: auto;
        }

        .intsection {
            position: relative;

        }

        .article1 {
            display: flex;
            margin: auto;
            padding-left: 15em;
        }

        .left1 {
            font-size: 17px;
            font-weight: 400;
            background-color: rgba(255, 176, 46, 0.1);
            border: 0 50 0 0;
            float: left;
            width: 70%;
        }

        .right1 {
            float: right;
            width: 70%;
        }

        .text-top {
            font-size: 23px;
            font-weight: 700;
        }
        
    .dropdown {
      position: relative;
      display: inline-block;
    }

    .dropbtn_icon {
      font-family: 'Material Icons';
      padding: 10px;
      font-size: 13px;
      vertical-align: middle;
    }

    .dropbtn {
      border: none;
      background-color: #FFB02E;
      font-weight: bold;
      color: rgb(37, 37, 37);
      padding: 12px;
      width: 140px;
      text-align: left;
      cursor: pointer;
      font-size: 12px;
    }

    .dropdown-content {
      display: none;
      position: absolute;
      z-index: 1;
      font-weight: 400;
      background-color: #f9f9f9;
      background-color: #ff6ea8;
      background-color: rgba(247, 119, 170, 0.95);
      min-width: 140px;
      text-align: center;
      border-radius: 15px;
    }

    .dropdown-content a {
      display: block;
      text-decoration: none;
      color: rgb(37, 37, 37);
      color: white;
      font-size: 12px;
      font-weight: bold;
      padding: 12px 20px;
    }

    .dropdown-content a:hover {
      background-color: #b37f29;
      border-radius: 15px;
    }

    .dropdown:hover .dropdown-content {
      display: block;
    }

    .profile {
      height: 30%;
      width: 30%;
      border-radius: 70%;
      vertical-align: middle;
    }
    </style>
</head>

<body style="background-color: #F9F5EA;">
<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
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
          <%
          	if(userID == null){
          %>
            	<button class="signUp" onclick="location.href='signUp.jsp'">Sign up</button>
            </td>
            <td style="width: 8%;">
                <button class="signIn" onclick="location.href='signIn.jsp'">Sign in</button>
            </td>
          <%	
          	} else {
          %>
            <div class="dropdown">
              <button class="dropbtn">
                <img class="profile" src="img/profile.png">
                <span class="dropbtn_icon" value="userID">홍길동 님</span>
              </button>
              <div class="dropdown-content">
                <a href="updatePro.jsp">회원정보변경</a>
                <a href="requireList.html">요청목록</a>
                <a href="logoutAction.jsp">로그아웃</a>
              </div>
            </div>
          <%
          	}
          %>
               </tr>
            </table>
            <br>
            <ul></ul>
            <ul class="nav">
                <div>
                    <li><a id="button1" href="#none" style="font-weight: 900;">업체예약</a></li>
                    <li><a id="button2" href="community.jsp" style="font-weight: 900;">커뮤니티</a></li>
                    <li><a id="button3" href="individualT.jsp" style="font-weight: 900;">위탁</a></li>
                    <li><a id="button4" href="Int.jsp" style="font-weight: 900;">회사소개</a></li>
                </div>
            </ul>
        </section>
    </header>
    <br>
    <br>
    <br>
    <div class="comm_main">
        <div class="btns_container">
            <div class="btns">
                <button class="btn" onclick="location.href='community.jsp'">최신글</button>
                <button class=" btn" onclick="location.href='community4.jsp'"
                    style="background-color: white; color:#FFB02E;">인기글</button>
                <button class="btn" onclick="location.href='community2.jsp'">글 작성</button>
                <button class=" btn" onclick="location.href='community3.jsp'">방명록</button>
            </div>
        </div>
        <div class="posts_container">
            <div class="posts">
                <ul>
                    <li class="post">
                        <span>💗</span>
                        <span>공지</span>
                        <span>커뮤니티 이용 가이드</span>
                        <span>180</span>
                    </li>
                    <li class="post">
                        <span>💗</span>
                        <span>일상</span>
                        <span>같이 산책하실 분!</span>
                        <span>20</span>
                    </li>
                    <li class="post">
                        <span>💗</span>
                        <span>일상</span>
                        <span>저희 강아지 귀엽죠?</span>
                        <i class="fas fa-camera"></i>
                        <span>55</span>
                    </li>
                    <li class="post">
                        <span>🤍</span>
                        <span>질문</span>
                        <span>OO동 동물병원 좋은 곳 어딘가요?</span>
                        <span class="new">N</span>
                        <span>2</span>
                    </li>
                    <li class="post">
                        <span>🤍</span>
                        <span>일상</span>
                        <span>콩이의 데일리룩</span>
                        <i class="fas fa-camera"></i>
                        <span class="new">N</span>
                        <span>12</span>
                    </li>
                    <li class="post">
                        <span>🤍</span>
                        <span>요청</span>
                        <span>고양이 간식 추천 부탁드려요</span>
                        <span>5</span>
                    </li>
                    <li class="post">
                        <span>🤍</span>
                        <span>일상</span>
                        <span>안녕하세요!</span>
                        <span>13</span>
                    </li>
                    <li class="post">
                        <span>🤍</span>
                        <span>일상</span>
                        <span>오늘의 날씨</span>
                        <span>4</span>
                    </li>
                    <li class="post">
                        <span>🤍</span>
                        <span>일상</span>
                        <span>아침인사</span>
                        <span>5</span>
                    </li>
                </ul>
            </div>
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
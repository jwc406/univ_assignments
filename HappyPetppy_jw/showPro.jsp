<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<html>
<head>
    <title>현재 유저정보 출력화면</title>
    
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue;
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
    
    <script type="text/javascript">
    
        function changeForm(val){
            if(val == "-1"){
                location.href="main.jsp";
            }else if(val == "0"){
                location.href="modifyForm.jsp";
            }else if(val == "1"){
                location.href="deleteForm.jsp";
            }
        }
        
    </script>
    
</head>
<body>
    <%
        String id = session.getAttribute("sessionID").toString();
        
        // 세션에 저장된 아이디를 가져와서
        // 그 아이디 해당하는 회원정보를 가져온다.
        UserDAO dao = UserDAO.getInstance();
        User memberBean = dao.getUserInfo(id);
    %>
 
        <br><br>
        <b><font size="6" color="gray">내 정보</font></b>
        <br><br><br>
                        <!-- 가져온 회원정보를 출력한다. -->
        <table>
            <tr>
                <td id="title">아이디</td>
                <td><%=memberBean.getUserID() %></td>
            </tr>
                        
            <tr>
                <td id="title">비밀번호</td>
                <td><%=memberBean.getUserPassword() %></td>
            </tr>
                    
            <tr>
                <td id="title">이름</td>
                <td><%=memberBean.getUserName() %></td>
            </tr>
                    
            <tr>
                <td id="title">닉네임</td>
                <td><%=memberBean.getNickname()%></td>
            </tr>
                    
            <tr>
                <td id="title">이메일</td>
                <td><%=memberBean.getUserEmail() %></td>
            </tr>
                    
            <tr>
                <td id="title">휴대전화</td>
                <td>
                    <%=memberBean.getUserTel1() %>-
                    <%=memberBean.getUserTel2() %>
                </td>
            </tr>
        </table>
        
        <br>
        <input type="button" value="뒤로" onclick="changeForm(-1)">
        <input type="button" value="회원정보 변경" onclick="changeForm(0)">
        <input type="button" value="회원탈퇴" onclick="changeForm(1)">
</body>
</html>

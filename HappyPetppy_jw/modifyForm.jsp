<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %> 
<html>
<head>
    <%
        String id = session.getAttribute("sessionID").toString();
    
        UserDAO dao = UserDAO.getInstance();
        User memberBean = dao.getUserInfo(id);
    %>
 
    <title>회원정보 수정화면</title>
    
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
    
        function init(){
            setComboValue("<%=memberBean.getUserTel2()%>");
        }
 
        function setComboValue(val) 
        {
            var selectUserTel = document.getElementById('UserTel2'); // select 아이디를 가져온다.
            for (i = 0, j = selectUserTel.length; i < j; i++)  // select 하단 option 수만큼 반복문 돌린다.
            {
                if (selectUserTel.options[i].value == val)  // 입력된값과 option의 value가 같은지 비교
                {
                    selectUserTel.options[i].selected = true; // 같은경우라면 체크되도록 한다.
                    break;
                }
            }
        }
        
        // 비밀번호 입력여부 체크
        function checkValue() {
            if(!document.userInfo.password.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
        }
        
    </script>
    
</head>
<body onload="init()">
 
        <br><br>
        <b><font size="6" color="gray">회원정보 수정</font></b>
        <br><br><br>
        
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식 -->
        <form method="post" action="modifyPro.jsp" 
                name="userInfo" onsubmit="return checkValue()">
                
            <table>
                <tr>
                    <td id="title">아이디</td>
                    <td id="title"><%=memberBean.getUserID() %></td>
                </tr>
                <tr>
                    <td id="title">비밀번호</td>
                    <td>
                        <input type="password" name="password" maxlength="50" 
                            value="<%=memberBean.getUserPassword()%>">
                    </td>
                </tr>
            </table>    
            <br><br>    
            <table>
 
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
                    <td>
                        <input type="text" name="userEmail" value="<%=memberBean.getUserEmail() %>"/>
                    </td>
                </tr>
                    
                <tr>
                    <td id="title">휴대전화</td>
                    <td>
                        <select name="userTel1" id="userTel1">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="012" >012</option>
                            <option value="080">080</option>                        
                        </select>
                        -
                        <input type="text" name="userTel2" maxlength="50" 
                            value="<%=memberBean.getUserTel2() %>">
                    </td>
                </tr>
            </table>
            <br><br>
            <input type="button" value="취소" onclick="javascript:window.location='main.jsp'">
            <input type="submit" value="수정"/>  
        </form>
        
</body>
</html>
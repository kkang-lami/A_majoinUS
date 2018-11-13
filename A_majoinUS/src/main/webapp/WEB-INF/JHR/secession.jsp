<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>탈퇴 화면 - 비밀번호 입력</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
 <script type="text/javascript">
        // 비밀번호 미입력시 경고창
        /* function checkValue(){
            if(!document.deleteform.pwd.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        } */
     $(document).ready(function(){
            $("#btnDelete").click(function(){
                // 확인 대화상자 
                if(confirm("삭제하시겠습니까?")){
                    document.deleteform.action = "secessionpro";
                    document.deleteform.submit();
                }
            });
        });
    </script>
</head>
<body>
    <br><br>
    <b><font size="6" color="gray">회원탈퇴</font></b>
    <br><br><br>
 <!-- 탈퇴처리-->
    <form name="deleteform" method="post">
        <table>
            <tr>
                <td bgcolor="skyblue">비밀번호</td>
                <td><input type="password" name="pwd" maxlength="50"></td>
            </tr>
        </table>
        <br> 
        <input type="button" value="취소" onclick="location = 'index'">
        <input type="button" value="탈퇴" id="btnDelete"/> 
    </form>
</body>
</html>
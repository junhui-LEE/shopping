<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'ID='+=loginId}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>shopping</title>
    <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
</head>
<style>
    * { box-sizing:border-box; }
    a { text-decoration: none; }
    form {
        width:400px;
        height:500px;
        display : flex;
        flex-direction: column;
        align-items:center;
        position : absolute;
        top:50%;
        left:50%;
        transform: translate(-50%, -50%) ;
        border: 1px solid rgb(89,117,196);
        border-radius: 10px;
    }
    input[type='text'], input[type='password'] {
        width: 300px;
        height: 40px;
        border : 1px solid rgb(89,117,196);
        border-radius:5px;
        padding: 0 10px;
        margin-bottom: 10px;
    }
    button {
        background-color: rgb(89,117,196);
        color : white;
        width:300px;
        height:50px;
        font-size: 17px;
        border : none;
        border-radius: 5px;
        margin : 20px 0 30px 0;
    }
    #title {
        font-size : 50px;
        margin: 40px 0 30px 0;
    }

</style>
<body>
<div id="menu">
    <ul>
        <li id="logo">shopping</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/'/>">Board</a></li>
        <li><a href="<c:url value='/'/>">${loginOut}</a></li>
        <li><a href="<c:url value='/'/>">Sign in</a></li>
        <li><a href=""><i class="fa fa-search"></i></a></li>
    </ul>
</div>
<form action="" method="post">
    <h3 id="title">Login</h3>

    <input type="text" name="id" value="" placeholder="이메일 입력" autofocus>
    <input type="password" name="pwd" placeholder="비밀번호">

    <button>로그인</button>
    <div>
        <label><input type="checkbox" name="rememberId" value=""}> 아이디 기억</label> |
        <a href="">비밀번호 찾기</a> |
        <a href="">회원가입</a>
    </div>

</form>
</body>
</html>
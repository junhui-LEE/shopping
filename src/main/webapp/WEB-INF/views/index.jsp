<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<%@ page session="false" %>--%>
<c:set var="loginOutLink" value="${sessionScope.id==null ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${sessionScope.id==null ? 'Login' : 'Logout'}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>shopping</title>
  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<body>
<%--id: ${sessionScope.id}--%>
<div id="menu">
  <ul>
    <li id="logo">shopping</li>
    <li><a href="<c:url value='/'/>">Home</a></li>
    <li><a href="<c:url value='/board/list'/>">Board</a></li>
    <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
    <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
    <li><a href=""><i class="fas fa-search small"></i></a></li>
  </ul>

</div>
<div style="text-align:center">
  <h1>This is HOME</h1>
  <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  <h1>회원가입시 id입력에 공백이 있을경우 클라이언트 에러 납니다.</h1>
  <h3> - 영대문자 조합은 안하셔도 됩니다.</h3>
  <h1>생년월일 입력시 정해진 형식( ex: 2020-12-12 )이 아니면 유효성검사에서 걸러집니다</h1>
  <h3> - 회원가입 화면이 계속 나오면 회원등록이 안된것 입니다.</h3>
</div>
</body>
</html>
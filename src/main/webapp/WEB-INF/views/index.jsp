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
<div style="text-align:center">
  <h1>This is INDEX</h1>
  <h1>This is INDEX</h1>
  <h1>This is INDEX</h1>
</div>
</body>
</html>

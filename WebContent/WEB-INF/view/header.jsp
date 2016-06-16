<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>Pink Flamingos</title>
		<link rel="stylesheet" href="<c:url value="/resources/assets/css/style.css" />" />
		<link rel="shortcut icon" href="<c:url value="/resources/assets/images/logo.png" />" />
		<script src="<c:url value="resources/assets/js/jquery.min.js" />"></script>
		<script src="<c:url value="resources/assets/js/jquery-migrate-1.2.1.min.js" />"></script>
		<script src="<c:url value="/resources/assets/js/script.js" />" type="text/javascript"></script>
		<script src="<c:url value="/resources/assets/js/login.js" />" type="text/javascript"></script>
		<link href="<c:url value="resources/assets/font-awesome/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
	</head>

	<body>
		<div id="topbar">
			<form action="search"><input id="search" name="query"/></form>
			<ul id="topnav">
				<li>
					<a href="/Pink_Flamingos">Home</a>
				</li>
				<li>
					<a href="/Pink_Flamingos/AboutUs">About Us</a>
				</li>
					<c:choose>
						<c:when test="${empty sessionScope.session_user }">
				<li>
					<button id="login-button">Login</button>
				</li>
				<li>
					<button id="signup-button">Sign Up</button>
				</li>
						</c:when>
						<c:otherwise>
				<li>
					<a href="/Pink_Flamingos/logout">Logout ${sessionScope.session_user.username }</a>
				</li>
						</c:otherwise>
					</c:choose>
			</ul>
			<div class="clear"></div>
		</div>

		<div id="login" class="loginBox">
			<form action="login" method="post">
				<div class="form-text" >Username</div>
				<input type="text" name="username"/>
				<div class="form-text" >Password</div>
				<input type="password" name="password"/>
				<div class="loginButtons">
					<button type="button" class="cancel-user">Cancel</button>
					<button type="submit" class="submit-user">Login</button>
				</div>
			</form>
		</div>

		<div id="signup" class="loginBox">
			<form action="register" method="post">
				<div class="form-text" >Username</div>
				<input type="text" name="username"/>
				<div class="form-text" >Password</div>
				<input type="password" name="password"/>
				<div class="loginButtons">
					<button type="button" class="cancel-user">Cancel</button>
					<button type="submit" class="submit-user">Sign Up</button>
				</div>
			</form>
		</div>
		
		<div id="errorMessage"></div>

		<div id="header" class="noScroll">
			<a href="/Pink_Flamingos"><h1 class="bottom">Pink Flamingos</h1></a>
		</div>

		<div id="main-container">
			<div id="main">
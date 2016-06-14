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
			<input id="search"/>
			<ul id="topnav">
				<li>
					<a href="/Pink_Flamingos">Home</a>
				</li>
				<li>
					<a href="/Pink_Flamingos/AboutUs">About Us</a>
				</li>
				<li>
					<button id="login-button">Login</button>
				</li>
				<li>
					<button id="signup-button">Sign Up</button>
				</li>
			</ul>
			<div class="clear"></div>
		</div>

		<div id="login">
			<div class="form-text">Username</div>
			<input/>
			<div class="form-text">Password</div>
			<input/>
			<div id="loginButtons">
				<button id="cancel-user">Cancel</button>
				<button id="submit-user">Submit</button>
			</div>
		</div>

		<div id="header" class="noScroll">
			<a href="/Pink_Flamingos"><h1 class="bottom">Pink Flamingos</h1></a>
		</div>

		<div id="main-container">
			<div id="main">
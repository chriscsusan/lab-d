<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%--
	On this page we have a form to edit a single movie and a button to delete it.
	
	Model:
	- Movie movie
 --%>
<html>
<head>
	<%@ include file="parts/head.jsp" %>
</head>
<body>
<div class="nav">
	<a href="<c:url value="/"/>">Home</a>
</div>
<h1>
	User Login
</h1>

<form method="post">
	<div>
		<label>Email</label>
		<input type="text" name="email" value=""/>
	</div>
	<div>
		<label>Password</label>
		<input type="text" name="password" value=""/>
	</div>
	<button type="submit" formaction="<c:url value="/users/login/login"/>">Login</button>
</form>
</body>
</html>

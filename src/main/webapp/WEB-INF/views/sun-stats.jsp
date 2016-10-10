<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%--
	On this page we show stats for sunrise and sunset.
	
	Model:
	- SunInfo sunInfo
 --%>
<html>
<head>
<%@ include file="parts/head.jsp"%>
</head>
<body>
	<div class="nav">
		<a href="<c:url value="/"/>">Home</a>
	</div>
	<h1>Sunrise/set Info</h1>

	<p>
		<label>Sunrise for today at GC: </label>
		<c:out value="${ sunInfo.sunrise }" /><br />
				<label>Sunset for today at GC: </label>
		<c:out value="${ sunInfo.sunset }" /><br /> 
	</p>

</body>
</html>
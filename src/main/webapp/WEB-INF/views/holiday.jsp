<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%--
	On this page we show the current weather.
	
	Model:
	- Holiday holiday
 --%>
<html>
<head>
<%@ include file="parts/head.jsp"%>
</head>
<body>
	<div class="nav">
		<a href="<c:url value="/"/>">Home</a>
	</div>
	<h1>Holiday</h1>

	<p>
		<label>Holidays List: </label><br />
		<c:forEach var="holiday" items="${holiday}" >
			<c:out value="${ holiday.name }" /> - 
			<c:out value="${ holiday.date }" /><br /> 
		</c:forEach>
		
	</p>

</body>
</html>
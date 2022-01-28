<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="common/header.jsp" />

<jsp:include page="common/nav.jsp" />
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<c:out value="${ses }" />
<form action="/user/logout" method="post">
	<input type="text" value="${ses.email }">
	<button type="submit">logout</button>
</form>
</body>
</html>

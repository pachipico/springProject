<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="common/header.jsp" />

<jsp:include page="common/nav.jsp" />
<div id="searchDiv">
	<h1>Search!</h1>
	<form action="/search/movie" method="get">
		<input type="text" id="searchQuery" name="query" >
		<button type="submit" id="searchBtn">search</button>
	</form>
</div>
<div id="popular">
	
</div>
<div id="trailer">

</div>
</body>
<script src="/resources/js/home.js" ></script>
</html>

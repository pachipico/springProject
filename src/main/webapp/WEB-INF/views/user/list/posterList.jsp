<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.posterContainer{
	
}

.posterContainer h4{
	padding: 150px;
	text-align: center;
}

</style>

<div class="posterContainer">
<c:choose>
	<c:when test="${empty posterList }">
		<h4 >구매한 포스터가 없습니다!</h4>
	</c:when>
	<c:otherwise>
		${posterList }
	</c:otherwise>
</c:choose>
</div>
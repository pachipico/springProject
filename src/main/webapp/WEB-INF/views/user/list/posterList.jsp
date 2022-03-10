<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>



.posterContainer{
	display:flex;
	overflow: scroll;
	padding: 5px 15px;
}

.posterContainer h4{
	padding: 150px;
	text-align: center;
}

.poster{
	margin: 20px 10px;
	
}

.posterImg{
	border-radius: 8px;
}

.posterTitleDiv{
	text-align:center;
}
h2{
	margin: 10px;
}
</style>
<h2>구매한 포스터 목록 </h2>
<div class="posterContainer">
<c:choose>
	<c:when test="${empty posterList }">
		<h4 >구매한 포스터가 없습니다!</h4>
	</c:when>
	<c:otherwise>
		<c:forEach items="${posterList }" var="poster">
			<div class="poster">
				<div class="posterImgDiv">
					<img class="posterImg" src="https://image.tmdb.org/t/p/w220_and_h330_face${poster.value }">
				</div>
				<div class="posterTitleDiv">
					<p>${poster.sname }</p>
				</div>
			</div>
		</c:forEach>
			
	</c:otherwise>
</c:choose>
</div>
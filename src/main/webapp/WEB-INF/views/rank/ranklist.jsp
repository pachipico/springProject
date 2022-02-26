<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
	<select id="rankSelect">
		<option value="curr_points" ${query == 'curr_points' ? 'selected' : ''}>현재 포인트순</option>
		<option value="reg_at" ${query == 'reg_at' ? 'selected' : ''}>등록일순</option>
		<option value="like_cnt" ${query == 'like_cnt' ? 'selected' : ''}>즐겨찾기 많은 순</option>
		<option value="rating_cnt" ${query == 'rating_cnt' ? 'selected' : ''}>평점 왕</option>
		<option value="review_cnt" ${query == 'review_cnt' ? 'selected' : ''}>리뷰 왕</option>
	</select>
	<form action="/user/userRank" method="get" id="rankForm">
		<input name="query" type="hidden" id="query">
	</form>
	<br>
	<c:forEach items="${list }" var="user">
		${user.email } : ${user.name } : ${user.currPoints } : 즐겨찾기- ${user.likeCnt } : 리뷰개수- ${user.reviewCnt } : 평점개수- ${user.ratingCnt }<br>
	</c:forEach>
<script>
document.getElementById("rankSelect").addEventListener("change", (e) => {
	  document.getElementById("query").value = e.target.value;
	  document.getElementById("rankForm").submit();
	});

</script>
<jsp:include page="../common/footer.jsp" />
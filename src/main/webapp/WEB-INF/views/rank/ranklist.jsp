<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
	<h1 style="padding: 20px 30px 0px">유저 랭킹</h1>
	<div id="selectDiv" style="text-align:right;padding:10px 30px 0px;">
		<select id="rankSelect">
			<option value="curr_points" ${query == 'curr_points' ? 'selected' : ''}>현재 포인트순</option>
			<option value="reg_at" ${query == 'reg_at' ? 'selected' : ''}>가입일순</option>
			<option value="like_cnt" ${query == 'like_cnt' ? 'selected' : ''}>즐겨찾기 많은 순</option>
			<option value="rating_cnt" ${query == 'rating_cnt' ? 'selected' : ''}>평점 왕</option>
			<option value="review_cnt" ${query == 'review_cnt' ? 'selected' : ''}>리뷰 왕</option>
		</select>
		<form action="/user/userRank" method="get" id="rankForm">
			<input name="query" type="hidden" id="query">
		</form>
	</div> 
	
	<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">email</th>
      <th scope="col">nick name</th>
      <th scope="col" style="width:500px;">
      	<c:choose>
			<c:when test="${query == 'curr_points' }">
				포인트
			</c:when>
			<c:when test="${query == 'reg_at' }">
				가입 일자
			</c:when> 
			<c:when test="${query == 'like_cnt' }">
				즐겨찾기 개수
			</c:when>     
			<c:when test="${query == 'rating_cnt' }">
				평점 개수
			</c:when>  
			<c:when test="${query == 'review_cnt' }">
				리뷰 개수
			</c:when> 	
      	</c:choose>
      </th>
    </tr>
  </thead>
  <tbody>
	<c:forEach items="${list }" var="user" varStatus="st" >
    <tr>
      <th scope="row">${st.count }</th>
      <td ><a style="color: ${user.fontColor};text-decoration:underline;" href="/user/${user.email }">${user.email }</a></td>
      <td style="color: ${user.fontColor};">${user.nickName }</td>
      <td>
      <c:choose>
			<c:when test="${query == 'curr_points' }">
				${user.currPoints}점
			</c:when>
			<c:when test="${query == 'reg_at' }">
				${user.regAt }
			</c:when> 
			<c:when test="${query == 'like_cnt' }">
				${user.likeCnt }개
			</c:when>     
			<c:when test="${query == 'rating_cnt' }">
				${user.ratingCnt }개
			</c:when>  
			<c:when test="${query == 'review_cnt' }">
				${user.reviewCnt }개
			</c:when> 	
      	</c:choose>
      </td>
    </tr>
	</c:forEach>
  </tbody>
</table>
<script>
document.getElementById("rankSelect").addEventListener("change", (e) => {
	  document.getElementById("query").value = e.target.value;
	  document.getElementById("rankForm").submit();
	});

</script>
<jsp:include page="../common/footer.jsp" />
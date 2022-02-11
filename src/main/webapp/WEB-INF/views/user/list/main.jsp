<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content">
	<h2>통계</h2>
	<div class="stats">
		<div class="rateStats">
			<h5>평점 수</h5>
			<p>${mRatedCnt + tRatedCnt}</p>
		</div>
		<div class="revStats">
			<h5>리뷰 수</h5>
			<p>${mReviewedCnt + tReviewedCnt}</p>
		</div>
		<div class="likeStats">
			<h5>즐겨찾기 수</h5>
			<p>${mLikedCnt + tLikedCnt }</p>
		</div>
	</div>
</div>

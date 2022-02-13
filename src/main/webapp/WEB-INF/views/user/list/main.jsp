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
	
	<p >1: <span id="one">${mRateData.one }</span></p>
	<p>2: <span id="two">${mRateData.two }</span></p>
	<p>3: <span id="three">${mRateData.three }</span></p>
	<p>4: <span id="four">${mRateData.four }</span></p>
	<p>5: <span id="five">${mRateData.five }</span></p>
	<p>6: <span id="six">${mRateData.six }</span></p>
	<p>7: <span id="seven">${mRateData.seven }</span></p>
	<p>8: <span id="eight">${mRateData.eight }</span></p>
	<p>9: <span id="nine">${mRateData.nine }</span></p>
	<p>10: <span id="ten">${mRateData.ten }</span></p>
	<script>
		let mRateData = ${mRateData};
		let tRateData = ${tRateData};
		
	</script>
</div>

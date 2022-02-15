<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content">
	<h2>통계</h2>
	<div class="stats">
		<div class="rateStats">
			<h4>평점 수</h4>
			<p class="statCnt">${mRatedCnt + tRatedCnt}</p>
		</div>
		<div class="revStats">
			<h4>리뷰 수</h4>
			<p class="statCnt">${mReviewedCnt + tReviewedCnt}</p>
		</div>
		<div class="likeStats">
			<h4>즐겨찾기 수</h4>
			<p class="statCnt">${mLikedCnt + tLikedCnt }</p>
		</div>
		<div class="rateDist">
			<h4>평점 분포</h4>
			<div>
				<div id="graph">
					<div class="colorDiv" ><div class="bar" style="width: 10px;height:${(mRateData.one + tRateData.one)*10}px;background-color: red;"></div></div>
					<div class="colorDiv" ><div class="bar" style="width: 10px;height:${(mRateData.two + tRateData.two)*10}px;background-color: red;"></div></div>
					<div class="colorDiv"><div class="bar" style="width: 10px;height:${(mRateData.three + tRateData.three)*10}px;background-color: red;"></div></div>
					<div class="colorDiv" ><div class="bar" style="width: 10px;height:${(mRateData.four + tRateData.four)*10}px;background-color: red;"></div></div>
					<div class="colorDiv" ><div class="bar" style="width: 10px;height:${(mRateData.five + tRateData.five)*10}px;background-color: red;"></div></div>
					<div class="colorDiv" ><div class="bar" style="width: 10px;height:${(mRateData.six + tRateData.six)*10}px;background-color: red;"></div> </div>
					<div class="colorDiv" ><div class="bar" style="width: 10px;height:${(mRateData.seven + tRateData.seven)*10}px;background-color: red;"></div></div>
					<div class="colorDiv" ><div class="bar" style="width: 10px;height:${(mRateData.eight + tRateData.eight)*10}px;background-color: red;"></div></div>
					<div class="colorDiv" ><div class="bar" style="width: 10px;height:${(mRateData.nine + tRateData.nine)*10}px;background-color: red;"></div></div>
					<div class="colorDiv" ><div class="bar" style="width: 10px;height:${(mRateData.ten + tRateData.ten)*10}px;background-color: red;"></div></div>
					
				</div>
				<div id="params">
					<p>1</p>
					<p>2</p>
					<p>3</p>
					<p>4</p>
					<p>5</p>
					<p>6</p>
					<p>7</p>
					<p>8</p>
					<p>9</p>
					<p>10</p>
					
					
				</div>
			</div>
			<%-- <p >1: <span id="one">${mRateData.one + tRateData.one}</span></p>
			<p>2: <span id="two">${mRateData.two + tRateData.two}</span></p>
			<p>3: <span id="three">${mRateData.three + tRateData.three }</span></p>
			<p>4: <span id="four">${mRateData.four + tRateData.four}</span></p>
			<p>5: <span id="five">${mRateData.five + tRateData.five}</span></p>
			<p>6: <span id="six">${mRateData.six + tRateData.six}</span></p>
			<p>7: <span id="seven">${mRateData.seven + tRateData.seven}</span></p>
			<p>8: <span id="eight">${mRateData.eight +tRateData.eight }</span></p>
			<p>9: <span id="nine">${mRateData.nine +tRateData.nine }</span></p>
			<p>10: <span id="ten">${mRateData.ten + tRateData.ten }</span></p> --%>
		</div>
	</div>
	
</div>

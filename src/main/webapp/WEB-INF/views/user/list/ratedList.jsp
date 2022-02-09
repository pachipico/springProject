<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="movieContainer">
      <!--  -->
      <div class="listTitle">
      	<div class="left">
        <span id="listTitleText">나의 평점</span>
        <a ${platform eq "movie" ? 'style="border-bottom: 5px solid #dd54be;"' : '' } href="/user/${email }/ratedList"><span class="platformBtn" >영화</span> <span class="platformCnt">${mRatedCnt}</span></a>
        <a ${platform eq "tv" ? 'style="border-bottom: 5px solid #dd54be;"' : '' } href="/user/${email }/ratedList/tv"><span class="platformBtn">TV</span> <span class="platformCnt">${tRatedCnt }</span></a>
        </div>
        <div class="right">
        	<select id="optSel">
        		<option value="rating">평점 순</option>
        	</select>
        	<select id="ascdesc">
        		<option value="desc">내림차순</option>
        		<option value="asc">오름차순</option>
        	</select>
        </div>
      </div>
      <div id="cardContainer"></div>
      <!--  -->
    </div>


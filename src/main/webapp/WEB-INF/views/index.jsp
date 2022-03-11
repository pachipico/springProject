<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="common/header.jsp" />

<jsp:include page="common/nav.jsp" />
<link rel="stylesheet" href="/resources/css/home.css"/>
  <div class="searchDiv">
      <form action="/search/movie" method="get" id="searchForm">
        <input type="text" name="query" id="searchInput" placeholder="Search..." />
        <button type="submit"  id="searchBtn">검색</button>
      </form>
    </div>
    <div id="homeContainer">
    <div class="trending">
        <div class="listName">
          <span>평점 순 영화</span>
        </div>
        <div  class="cardContainer">
        <c:forEach items="${movieRatingRank }" var="movie">
          <div class="movieCard">
          <div class="imgWrapper">
              <div class="rating">
              <fmt:formatNumber value="${movie.rating }" pattern=".0" /> 
              
              </div>
	            <a href="/movie/detail/${movie.mid}">
	           <img
	                src="https://themoviedb.org/t/p/w220_and_h330_face${movie.poster }"
	                alt=""
	              /> 
	            </a>
            </div>
            <div class="cardDesc">
              <div class="cardTitle"><a href="/movie/detail/${movie.mid }">${movie.title }</a></div>
            </div>
          </div>          
        </c:forEach>
        </div>
      </div>
      <!--  -->
      <div class="trending">
        <div class="listName">
          <span>평점 순 tv</span>
        </div>
        <div  class="cardContainer">
        <c:forEach items="${tvRatingRank }" var="tv">
          <div class="movieCard">
          	<div class="imgWrapper">
              <div class="rating">
              <fmt:formatNumber value="${tv.rating }" pattern=".0" /> 
              
              </div>
	            <a href="/tv/detail/${tv.tvid}">
	           <img
	                src="https://themoviedb.org/t/p/w220_and_h330_face${tv.poster }"
	                alt=""
	              /> 
	            </a>
          	</div>
            <div class="cardDesc">
              <div class="cardTitle"><a href="/movie/detail/${tv.tvid }">${tv.title }</a></div>
            </div>
          </div>          
        </c:forEach>
        </div>
      </div>
      <!--  -->
      <div class="trending">
        <div class="listName">
          <span>Trending</span>
          <button class="btn" id="todayTrend">오늘</button>
          <button class="btn" style="background-color:#082546;color:#fff;" id="weekTrend">이번주</button>
        </div>
        <div id="trendCardContainer" class="cardContainer">
          <div class="movieCard">
            <a href="/movie/detail/{id}">
           <img
                src="https://themoviedb.org/t/p/w220_and_h330_face/AqpsDP7Mqi0EugpxSJ4UnV6mjrt.jpg"
                alt=""
              /> 
            </a>
            <div class="cardDesc">
              <div class="cardTitle"><a href="">title</a></div>

              <div class="cardSub">something else</div>
            </div>
          </div>
        </div>
      </div>
      
    </div>
    <!-- https://themoviedb.org/t/p/w220_and_h330_face/AqpsDP7Mqi0EugpxSJ4UnV6mjrt.jpg -->
  </body>
</html>
<script>
	let msg = `<c:out value="${msg}" />`;
	if(msg!=null && msg != ""){
		alert(msg);
	msg = null;
	}
	<c:set value="${null }" var="msg" />
</script>

<script src="/resources/js/home.js"></script>
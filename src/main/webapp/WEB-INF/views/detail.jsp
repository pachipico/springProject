<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="common/header.jsp" />

<jsp:include page="common/nav.jsp" />
    <div class="menuContainer">
      <input type="text" id="search" name="searchQuery" placeholder="Search..." />
      <button type="button" id="searchBtn" name="searchBtn">search</button>
    </div>

    <header style="">
      <div class="shadow">
        <div class="imageContainer">
          <div class="image">
            <img id="poster" src="" alt="" />
          </div>
          <div class="play">something</div>
        </div>
        <div class="headerContent">
          <div class="headerTitle" id="movieTitle">영화 제목</div>
          <div class="headerRating">00</div>
          <div class="tagLine"><i class="tLine">태그라인</i></div>
          <div class="overview">
            <h3 class="overviewTitle">개요</h3>
            <p class="overviewSub">줄거리</p>
          </div>
        </div>
      </div>
    </header>
    <main>
    	<div class="row" id="review">
    		<h3>리뷰</h3>
    		<input class="form-control" type="text" name="content" placeholder="content">
    		<input class="form-control" type="text" name="writer" placeholder="writer" value="123@123.com">
    		<button class="form-control btn btn-outline-primary" type="button" id="reviewBtn">submit</button>
    	</div>
    	<div class="row" id="like">
    		<h3>즐겨찾기</h3>
    		<button class="form-control btn btn-outline-primary" type="button" id="likeBtn" data-email="123@123.com" >즐겨찾기 등록</button>
    	</div>
    	<div class="row" id="rating">
    		<h3>평점</h3>
    		<input class="form-control" type="number" name="rating" >
    		<button type="button" id="ratingBtn" data-email="123@123.com">평점 등록</button>
    	</div>
		<div id="castDiv">
			
		</div>
    </main>
  </body>
</html>
<script>
let detailId = `<c:out value="${id}" />`;
let category = `<c:out value="${category}" />`
console.log(`detail for: ${id}`);
console.log(category);


</script>
<script src="/resources/js/movie.detail.js"></script>




<%-- <jsp:include page="../common/footer.jsp" /> --%>
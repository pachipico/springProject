<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:include page="../common/header.jsp" /> --%>

<jsp:include page="../common/header.jsp" />
   
<jsp:include page="../common/nav.jsp" />
    <div class="menuContainer">
     	menu menu menu menu
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
    
    </main>
  </body>
</html>
<script>
let id = `<c:out value="${id}" />`
console.log(id);
</script>
<script src="/resources/js/actor.detail.js"></script>




<%-- <jsp:include page="../common/footer.jsp" /> --%>
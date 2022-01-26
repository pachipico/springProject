<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:include page="../common/header.jsp" /> --%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
      integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
      integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
      crossorigin="anonymous"
    ></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/resources/css/index.css" />
    <link rel="stylesheet" href="/resources/css/detail.css" />
    <title>Document</title>
  </head>
  <body>
   
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
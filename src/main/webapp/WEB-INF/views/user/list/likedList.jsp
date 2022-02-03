<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="movieContainer">
      <!--  -->
      <div class="listTitle">
        <span id="listTitleText">나의 즐겨찾기</span>
      </div>
      <div class="movie">
        <div class="imageDiv">
          <img src="https://www.themoviedb.org/t/p/w150_and_h225_bestv2/AvWlbyLk32HdvSrrSTYpjmXHEXC.jpg" />
        </div>
        <div class="contentDiv">
          <div class="titleDiv">
            <div class="rating">67%</div>
            <div class="titleText">
              <a href="">매트릭스</a>
              <span>12월 16,2021</span>
            </div>
          </div>
          <div class="descDiv">
            토마스 앤더슨은 자신의 현실이 물리적 구성개념인지 아니면 정신적 구성개념인지 알아내기 위해
            이번에도 흰 토끼를 따라가야 한다. 토마스, 아니 네오가 배운 게 있다면 비록 환상이라 할지라도
            선택이야말로 매트릭스를 탈출할 유일한 길이라는 것이다. 물론 네오는 무엇을 해야 할지 이미 알고
            있다. 그가 아직 모르는 사실은 이 새로운 버전의 매트릭스가 그 어느 때보다도 강력하고, 확고부동하고,
            위험하다는 것이다. 평범한 일상과 그 이면에 놓여 있는 또 다른 세계, 두 개의 현실이 존재하는
            세상에서 운명처럼 인류를 위해 다시 깨어난 구원자 네오. 빨간 약과 파란 약 중dpsdfsafklsmaklfmsdlk
          </div>
          <div class="btnDiv">
            <ul style="list-style-type: none; padding: 0">
              <li>
                <a class="btn btn-outline-secondary btn-sm"><i class="bi bi-star-fill"></i></a>평점
              </li>
              <li>
                <a class="btn likeBtn btn-outline-secondary btn-sm"><i class="bi bi-heart-fill"></i></a>즐겨찾기
              </li>
              <li>
                <a class="btn btn-outline-secondary btn-sm"><i class="bi bi-x"></i></a>제거
              </li>
            </ul>
          </div>
        </div>
      </div>
      <!--  -->
    </div>
<script>
	let platform = `<c:out value="${platform}" />`;
	let moviesData = ${moviesData};
	let tvsData = ${tvsData};
</script>
<script src="/resources/js/user.detail.js"></script>
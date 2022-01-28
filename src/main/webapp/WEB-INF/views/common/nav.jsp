<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <nav>
      <div id="left">
        <div id="logo">TMDB</div>
        <div class="leftMenu">
          <div class="menu">상영중</div>
          <div class="menu">장르별</div>
          <div class="menu">인기</div>
          <div class="menu">게시판(드랍다운)</div>
        </div>
      </div>
      <div id="right">
        <div class="rightMenu">
        <c:if test="${!empty sessionScope.ses  }">
        <c:out value="${sessionScope.ses.email }" />
        </c:if>
        
          <div class="menu">Login</div>
          <div class="menu">Sign in</div>
          <div class="menu">Profile</div>
        </div>
      </div>
    </nav>
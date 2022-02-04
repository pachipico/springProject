<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="movieContainer">
      <!--  -->
      <div class="listTitle">
        <span id="listTitleText">나의 평점 ${platform }</span>
      </div>
      
      <!--  -->
    </div>

<script>
	let platform = `<c:out value="${platform}" />`;
	let list = `<c:out value="${list}" />`;
	let moviesData = ${moviesData};
	let tvsData = ${tvsData};
</script>
<script src="/resources/js/user.detail.js"></script>
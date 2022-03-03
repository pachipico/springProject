<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<link rel="stylesheet" href="/resources/css/purchase.css">
 <div id="settingContainer">
      <div id="leftMenu">
        <div id="settingTitle">Shop</div>
        <div class="settingMenu">
          <a href="/purchase/font" > 폰트 컬러 구매 </a>
        </div>
        <div class="settingMenu">
          <a href="/purchase/poster" id="currMenu"> 영화 포스터 구매 </a>
        </div>
        
      </div>
      <div id="settingMain">
        <h4>포스터 구매</h4>
        <div class="setting" style="text-align: end">
        	잔여 포인트: ${currPoints }
        </div>
        <div class="setting">
        
	        <div id="searchDiv">
	         <input type="text" class="form-control" id="posterInput">
	         <button class="btn" id="buyBtn">Search!</button>
	        </div>
        </div>
        <div class="setting">
        <!--  -->
	        <div id="posterDiv">
	        	<div class="poster">
	        		<div class="imgWrapper">
	        			<img style="width: 300px;height:300px;">
	        		</div>	
	        		<h4>title</h4>
	        	</div>
	        	<div class="poster">
	        		<div class="imgWrapper">
	        			<img style="width: 300px;height:300px;">
	        		</div>	
	        		<h4>title</h4>
	        	</div>
	        	<div class="poster">
	        		<div class="imgWrapper">
	        			<img style="width: 300px;height:300px;">
	        		</div>	
	        		<h4>title</h4>
	        	</div>
	        	<div class="poster">
	        		<div class="imgWrapper">
	        			<img style="width: 300px;height:300px;">
	        		</div>	
	        		<h4>title</h4>
	        	</div>
	        	<div class="poster">
	        		<div class="imgWrapper">
	        			<img style="width: 300px;height:300px;">
	        		</div>	
	        		<h4>title</h4>
	        	</div>
	        	<div class="poster">
	        		<div class="imgWrapper">
	        			<img style="width: 300px;height:300px;">
	        		</div>	
	        		<h4>title</h4>
	        	</div>
	        </div>	
        	<!--  -->
        </div>
        

       
      </div>
    </div>
  </body>
  <!-- Modal -->
<script src="/resources/js/purchase.poster.js" ></script>
<jsp:include page="../common/footer.jsp" />
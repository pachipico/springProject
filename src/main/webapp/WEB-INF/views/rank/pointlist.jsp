<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<style>
.content_wrap {
	   margin: auto;
	   width: 85%;
	   min-height:700px;
	   border:1px solid black;
	 
}
.content_subject {
	   font-size: 40px;
	   font-weight: bolder;
	   padding-left: 15px;
	   background-color: rgb(91, 189, 250);
	   height: 80px;
	   line-height: 80px;
	   color: white;	
}
span.content a img {        
             width: 45px;
             height: 45px;
             border-radius: 50%;
             border: none;
             margin: 0;
             padding: 0;
             
  }
td { 
	   color: #000; 
             font : 16px "source Sans Pro", Arial, sans-serif;
}
.detail {
	   position: absolute;
	   margin-left:4px;
}
.detail h3 {
	font-weight: 900;
}
p {
	font: 13px "source Sans Pro", Arial, sans-serif;
}	
.leaderboard td h3 a {
	font: 19.2px "source Sans Pro", Arial, sans-serif;
	color: #000;
	text-decoration: none;
	font-weight: 600px;
	cursor: pointer;
}
ul {
	list-style: none;
	text-align: center;
}
.table_wrap {
	text-align: center;
	margin-bottom: 40px;
}
h4 {
	margin-right: 20px;
	margin-bottom: 20px;
	font-weight: bold;
	color: #082546;
}
.leaderboard {
	margin-left: auto;
	margin-right: auto;
	margin-top: 40px;
}
.title {
	color: #fff;
}
.con1 {
	padding-right: 20px;
	font-size: 16px;
}
.comment {
	font: 24px "source Sans Pro", Arial, sans-serif;
	color: #000;
	margin: 50px 0px 30px;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}
</style>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/nav.jsp" />
<div class="content_wrap">
    <div class="content_subject"> 
    <h4 class="title">포인트왕</h4></div>
<select name="list" onchange="location.href=this.value">
<option>선택</option>
<option value="/rank/pointlist">포인트왕</option>
<option value="/rank/boardlist">게시판왕</option>
<option value="/rank/commentlist">댓글왕</option>
</select>
    <div class="comment">가장 많은 포인트를 모은 사용자</div>
    <div class="table_wrap">
    <h4>best</h4>
    <table class="leaderboard">
      <tbody>
	   <c:forEach items="${list }" var="prvo">
	   <tr>
	           <td class="con1">${prvo.totalPoints}</td>
	           <td>
	             <span class="content">
	              <a href="/user/detail.jsp"><img src="/fileUpload/${prvo.profileImg}"></a>
	             </span>
	             <span class="detail">
	              <h3><a href="/user/detail.jsp">${prvo.nickName}</a></h3>
	              <p>가입 : ${prvo.regAt}</p>
	             </span> 
	             <div style="clear:both; padding-top: 10px;"></div>
	           </td>   
	     </tr> 
	   </c:forEach>  
	</tbody>   
       </table>	     
       </div>
         
       <div class="table_wrap"> 
       <h4>worst</h4>
       <table class="leaderboard">
         <tbody>
	   <c:forEach items="${lowlist }" var="prvo">
	      <tr>
	           <td class="con1">${prvo.totalPoints}</td>
	           <td>
	             <span class="content">
	              <a href="detail.jsp"><img src="/fileUpload/${prvo.profileImg}"></a>
	             </span>
	             <span class="detail">
	              <h3><a href="detail.jsp">${prvo.nickName}</a></h3>
	              <p>가입 : ${prvo.regAt}</p>
	             </span> 
	             <div style="clear:both; padding-top:10px"></div>
	           </td>   
	     </tr> 
	   </c:forEach> 
	 </tbody>  
        </table>
        </div>
</div>  
<jsp:include page="../common/footer.jsp" />
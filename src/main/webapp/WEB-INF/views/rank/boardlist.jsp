<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<style>
.content_wrap {
	   width: 80%;
	   float:left;
	   min-height:700px;
}
.content_subject {
	   font-size: 40px;
	   font-weight: bolder;
	   padding-left: 15px;
	   background-color: gray;
	   height: 80px;
	   line-height: 80px;
	   color: white;	
}
.table_wrap {
    	padding: 20px 35px;
}
.table {
	width: 100%;
   	border: 1px solid #d3d8e1;
    	text-align: center;
    	border-collapse: collapse;
}
.table td {
	padding: 10px 5px;
	border : 1px solid #e9ebf0;
}
.table thead {
	background-color: #f8f9fd;	
	font-weight: 600;
}
.th_column_1{
	width:120px;
}
.th_column_3{
	width:110px;
}
.th_column_4{
	width:140px;
}
.th_column_5{
	width:140px;
}
.th_column_6{
	width:50px;
}
a {
	text-decoration: none;
}
ul {
	list-style: none;
	text-align: center;
}
</style>
<div class="content_wrap">
    <div class="content_subject"><h4>게시글왕</h4></div>
    <div class="table_wrap">
    <h4>영화</h4>
         <table class="table">
	   <thead>
	       <tr>
	            <td class="th_column_1">이메일</td>
	            <td class="th_column_2">닉네임</td>
	            <td class="th_column_3">조회수</td>
	       </tr>	   
	   </thead>
	   <tbody>
	   <c:forEach items="${blist }" var="brvo">
	       <tr>
	           <td>${brvo.email}</td>
	           <td>${brvo.nickName}</td>
	           <td>${brvo.readCount}</td>
	       </tr>
	   </c:forEach>    
	   </tbody>      
         </table>
       </div>
       
    <div class="table_wrap">
    <h4>tv</h4>
         <table class="table">
	   <thead>
	       <tr>
	            <td class="th_column_1">이메일</td>
	            <td class="th_column_2">닉네임</td>
	            <td class="th_column_3">조회수</td>
	       </tr>	   
	   </thead>
	   <tbody>
	   <c:forEach items="${blist }" var="brvo">
	       <tr>
	           <td>${brvo.email}</td>
	           <td>${brvo.nickName}</td>
	           <td>${brvo.readCount}</td>
	       </tr>
	   </c:forEach>    
	   </tbody>      
         </table>
       </div>
</div> 
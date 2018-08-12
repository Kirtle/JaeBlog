<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="ck" uri="http://ckeditor.com"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="frame/Header.jsp"></jsp:include>
<style type="text/css">
img {  
 max-width: 100%; /*图片自适应宽度*/  
}  
</style>
<div class="container">
    <div style="height: 3%"></div>
    <div class="row">
        <div class="col-sm-9">
        	<c:choose>
        		<c:when test="${article!=null}">
        		
	        			<h2>${article.title}</h2>
	        			<p><i class="glyphicon glyphicon-user"></i><a href="${pageContext.request.contextPath}/userInfo?id=${article.user_id }">${article.username}</a> |
	        			 	<i class="glyphicon glyphicon-calendar"></i>${article.publish_time}| 阅读${article.count}次
						</p>
	        			<p>${article.content}</p>
	        			
        				<div class="panel panel-primary">
        					<div class="panel-heading"><h4 class="panel-title">评论:</h4></div>
							<div id="comment">
								<c:choose>
			        				<c:when test="${comment!=null && fn:length(comment)>0}">
			        				<br>
				        				<c:forEach items="${comment}" var="comment">
				        					<div class="panel">
				        					<p style="float:right">
				        					<a href="${pageContext.request.contextPath}/userInfo?id=${comment.user_id }">${comment.username}</a>&nbsp;&nbsp;&nbsp;&nbsp;${comment.time}评论&nbsp;&nbsp;&nbsp;&nbsp;
				        					</p>
				        					<p>${comment.content}</p></div>
				        				</c:forEach>
			        				</c:when>
				        			<c:otherwise>
				        				暂无评论!
				        			</c:otherwise>
			        			</c:choose>
							</div>
				        	<form role="form" id="addComment" name="addComment" method="post" onsubmit="return isValidate(addComment)">
								<div class="form-group">
									<input type="hidden" name="time" id="time">
									<input type="hidden" name="article_id" id="article_id" value="${article.articleid}"> 
									<input type="hidden" name="user_id" id="user_id" value="${user.id}"> 
									<input type="hidden" name="username" id="username" value="${user.username}"> 
									<textarea class="form-control" rows="3" name="content" id="content"></textarea>
									<ck:replace replace="content" basePath="ckeditor_customize"></ck:replace>
								</div>
								<input type="submit" class="btn btn-primary" value="评论"></input>
							</form>
							
        				</div>
	        			
        		</c:when>
        		<c:otherwise>
        			无
        		</c:otherwise>
        	</c:choose>
        	
        	
        </div>
        <div class="col-sm-3 hidden-xs panel-group" id="accordion">
            <div class="panel">
                <h3 class="page-header" data-toggle="collapse" data-parent="#accordion" href="#collapse1">博文分类</h3>
                <ul id="collapse1" class="nav nav-tabs nav-stacked panel-collapse collapse">
                	<c:choose>
                		<c:when test="${sys_category!=null && fn:length(sys_category)>0}">
                			<c:forEach items="${sys_category}" var="sc">
		                    	<li><a style="color:gray" href="${pageContext.request.contextPath}/articleBySc?id=${sc.id}">${sc.category_name}</a></li>
		                    </c:forEach>
		                </c:when>
		                <c:otherwise>
	                		<li><a style="color:gray" href="#">暂无分类</a></li>
		                </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <div class="panel">
                <h3 class="page-header"  data-toggle="collapse" data-parent="#accordion"  href="#collapse2">博文Top5</h3>
                <ul id="collapse2" class="nav nav-tabs nav-stacked panel-collapse collapse">
                    <c:choose>
                		<c:when test="${articleTop!=null && fn:length(articleTop)>0}">
                			<c:forEach items="${articleTop}" var="artT">
		                    	<li><a style="color:gray" href="${pageContext.request.contextPath}/article?id=${artT.articleid}">${artT.title}</a></li>
		                    </c:forEach>
		                </c:when>
		                <c:otherwise>
	                		<li><a style="color:gray" href="">暂无博文</a></li> 
		                </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>	
</div>
<jsp:include page="frame/Footer.jsp"></jsp:include>

<script type="text/javascript">
			window.onload = function() {
				  var show = document.getElementById("time");
				  setInterval(function() {
				   var time = new Date();
				   // 程序计时的月从0开始取值后+1
				   var mon =("0" + (time.getMonth() + 1)).slice(-2);
				   var h =("0" + time.getHours()).slice(-2);
				   var min =("0" + time.getMinutes()).slice(-2);
				   
				   var t =  mon + "-"
				     + time.getDate() + " " + h + ":"
				     + min;
				   show.value = t;
				  }, 1000);
 };
</script>
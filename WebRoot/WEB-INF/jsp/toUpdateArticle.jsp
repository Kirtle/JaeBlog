<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="ck" uri="http://ckeditor.com"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="frame/Header.jsp"></jsp:include>
<div class="container">
    <div style="height: 3%"></div>
    <div class="row">
        <div class="col-sm-9">
			<c:choose>
			    <c:when test="${user==null}">
			       	 对不起 您没有登录!
			    </c:when>
			    <c:when test="${user!=null && user.userpermission!=0}">
			      	  对不起 您没有权限修改博客!
			     </c:when>  	  
			    <c:when test="${user!=null && user.userpermission==0 && article!=null}">
				    <form  id="addArticle" role="form" method="post" onsubmit="return false">
		        		<button class="btn btn-primary" type="submit" onclick="updateArticle();" style="float:right">提交</button><br>
		        		<input type="hidden" name="user_id" value="${user.id}"><br>
		        		<input type="hidden" name="articleid" value="${article.articleid}"><br>
		        		<input class="form-control" type="text" name="title" value="${article.title}"><br>
		        		
		        		 <label>系统文章分类:</label>
		        		 <select class="form-control" id="sys_category_id" name="sys_category_id" style="float:right;width: 25%">
			    			<option>请选择系统文章分类</option>
			    			<c:forEach var="entry" items="${scnames }">
			    				<option  value="${entry.key}">${entry.value }</option>
			    			</c:forEach>
			    		 </select>
						<br><br>
		        		<label>请输入文章摘要:</label>
		        		<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
						<script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"></script>
						<script id="summary" name="summary" type="text/plain" style="height:300px">${article.summary}</script>
		        		<label>文章主要内容:</label>
		        		<script id="content" name="content" type="text/plain">${article.content}</script>
		        		<script type="text/javascript">
					        var editor2 = UE.getEditor('content');
					        var editor1 = UE.getEditor('summary',{
					        	initialFrameHeight:300,
					        	scaleEnabled:true,
					        });
					       
					    </script>
		        	</form>
		       	</c:when>
			    <c:otherwise>
			       	<h3>您访问的页面有误!</h3>
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

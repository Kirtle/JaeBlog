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
        <div class="col-sm-9 jumbotron">
       		
       			<h3>2017年5月  :本站由<a href="${pageContext.request.contextPath}/userInfo?id=1">Jae</a>博主创建 使用了Spring SpringMVC MyBatis框架 以及前端bootstrap框架
       						    通过建设这个网站锻炼了自己的能力；也可以通过写技术博客来提升自己的水平;</h3>
       			
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

</script>
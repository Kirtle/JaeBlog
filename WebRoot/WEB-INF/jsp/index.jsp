 <%@ page language="java" import="java.util.*" import="cn.jaeblog.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="frame/Header.jsp"></jsp:include>

<div class="container">
    <div style="height: 6%"></div>
    <div class="row">
        <div class="col-sm-9" >
           <div class="row center-block thumbnail"style="width:90% ">
               <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                   <!-- Indicators指示器 -->
                   <ol class="carousel-indicators">
                       <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                       <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                       <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                   </ol>

                   <!-- Wrapper for slides -->
                   <div class="carousel-inner" role="listbox">
                   		<c:choose>
							<c:when test="${articles1!=null && fn:length(articles1)>0}">
								<div id="summaryc" class="item active">
		                           <a href="${pageContext.request.contextPath}/article?id=${articles1[0].articleid}">${articles1[0].summary }</a>
		                           <div class="carousel-caption">
		                           		<a href="${pageContext.request.contextPath}/article?id=${articles1[0].articleid}">${articles1[0].title}</a>
		                           </div>
		                       </div>
		                       <div id="summaryc" class="item">
		                           <a href="${pageContext.request.contextPath}/article?id=${articles1[1].articleid}">${articles1[1].summary }</a>
		                           <div class="carousel-caption">
		                           		<a href="${pageContext.request.contextPath}/article?id=${articles1[1].articleid}">${articles1[1].title}</a>
		                           </div>
		                       </div>
		                       <div id="summaryc" class="item">
		                           <a href="${pageContext.request.contextPath}/article?id=${articles1[2].articleid}">${articles1[2].summary }</a>
		                           <div class="carousel-caption">
		                           		<a href="${pageContext.request.contextPath}/article?id=${articles1[2].articleid}">${articles1[2].title}</a>
		                           </div>
		                       </div>
							</c:when>
						</c:choose>
                       
                   </div>

                   <!-- Controls -->
                   <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                       <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                       <span class="sr-only">Previous</span>
                   </a>
                   <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                       <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                       <span class="sr-only">Next</span>
                   </a>
               </div>
           </div>
           
           <c:choose>
					<c:when test="${articles2!=null && fn:length(articles2)>0}">
						<c:forEach items="${articles2}" var="art">
							<h3><a href="${pageContext.request.contextPath}/article?id=${art.articleid}">${art.title }</a></h3>
							<p>
								<i class="glyphicon glyphicon-user"></i><a href="${pageContext.request.contextPath}/userInfo?id=${art.user_id }">${art.username }</a> |
								<i class="glyphicon glyphicon-calendar"></i> ${art.publish_time} |
								<i class="glyphicon glyphicon-eye-open"></i> ${art.count }
							</p>
							<div id="summaryc" class=" thumbnail">
							
							<a href="${pageContext.request.contextPath}/article?id=${art.articleid}">${art.summary }</a>
							</div>
							
							<br>
							<a class="btn btn-primary" href="${pageContext.request.contextPath}/article?id=${art.articleid}">Read
								More <span class="glyphicon glyphicon-chevron-right"></span>
							</a>
							<hr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>没有更多文章了哟~</p>
					</c:otherwise>
			</c:choose>
		   <!-- pager -->
           <ul class="pager">
	            <c:if test="${page.pageNo >1}">
	                <div class="col-sm-6"><li><a  href="${pageContext.request.contextPath}?pageNo=${page.pageNo-1}">上一页</a></li></div>
	            </c:if>
	            <c:if test="${page.pageNo <(totalPage/page.pageSize)}">
	                <div class="col-sm-6"><li><a href="${pageContext.request.contextPath}?pageNo=${page.pageNo+1}">下一页 </a></li></div>
	            </c:if>
           </ul>
        </div>
        
        
        <div class="col-sm-3 hidden-xs panel-group" id="accordion">
            <div class="panel">
                <h3 class="page-header" data-toggle="collapse" data-parent="#accordion" href="#collapse1">博文分类</h3>
                <ul id="collapse1" class="nav nav-tabs nav-stacked panel-collapse collapse in">
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
	                		<li><a style="color:gray" href="#">暂无博文</a></li>
		                </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>
</div>

<jsp:include page="frame/Footer.jsp"></jsp:include>
<style type="text/css">
#summaryc p img{
	width:100% ;
	height:100%;
}
</style>
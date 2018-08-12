 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="a blog of Jae">
	<meta name="keywords" content="HTML,CSS,XML,JavaScript,MySQL,Oracle,Spring,SpringMVC,MyBatis,Jae,blog,java,javaWeb,个人博客,技术博客,博文">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0,user-scalable=no">
    <title>Jae博客 | 年轻是我们唯一拥有权力去编织梦想的时光！</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/img/favicon.ico">

    <script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap-hover-dropdown/2.0.10/bootstrap-hover-dropdown.min.js"></script>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
    <link  href="${pageContext.request.contextPath }/css/HomePage.css" rel="stylesheet">
 	<script src="${pageContext.request.contextPath }/js/HomePage.js"></script>
 	<link rel="stylesheet" href="${pageContext.request.contextPath }/dist/sidenav.css" type="text/css">
	<style type="text/css">
	  .toggle {
	    display: block;
	    line-height: 72px;
	    text-align: center;
	  }
	  	.navtable tr td a:link {color:darkgray}
		.navtable tr td a:visited {color:darkgray}
		.navtable tr td a:hover {text-decoration:none;color: #00b7ee}
		.navtable tr td a:active {color: #00b7ee}
	  </style>
    <!--[if lt IE 9]>
    <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
    <style type="text/css">

    </style>
    <script type="text/javascript">
		    	//获取浏览器页面可见高度和宽度
		var _PageHeight = document.documentElement.clientHeight,
		  _PageWidth = document.documentElement.clientWidth;
		//计算loading框距离顶部和左部的距离（loading框的宽度为215px，高度为61px）
		var _LoadingTop = _PageHeight > 300 ? (_PageHeight - 300) / 2 : 0,
		  _LoadingLeft = _PageWidth > 400 ? (_PageWidth - 400) / 2 : 0;
		//在页面未加载完毕之前显示的loading Html自定义内容
		var _LoadingHtml = 
		 '<div id="loadingDiv" style="position:absolute;left:0;width:100%;height:' + _PageHeight + 'px;top:0;background:white;opacity:1;filter:alpha(opacity=100);z-index:1000000;">'+
		'<div style="position: absolute; cursor1: wait; left: ' + _LoadingLeft + 'px; top:' + _LoadingTop + 'px;'+
		' width: 400px; height: 300px; line-height: 300px; padding-left: 50px; padding-right: 5px; background: #fff url(${pageContext.request.contextPath }/img/loading.gif) no-repeat scroll; color: #696969;"></div></div>';
		;
		
		//呈现loading效果
		document.write(_LoadingHtml);
		//window.onload = function () {
		//  var loadingMask = document.getElementById('loadingDiv');
		//  loadingMask.parentNode.removeChild(loadingMask);
		//};
		//监听加载状态改变
		document.onreadystatechange = completeLoading;
		//加载状态为complete时移除loading效果
		function completeLoading() {
		  if (document.readyState == "complete") {
		 var loadingMask = document.getElementById('loadingDiv');
		 loadingMask.parentNode.removeChild(loadingMask);
		  }
		}
    </script>

    
</head>

<body>

<!--注册-->
<div class="modal fade" tabindex="-1" role="dialog" id="register" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">用户注册</h4>
            </div>
            <div class="modal-body">
                <form id="registerForm" role="form" method="post">
                    <label for="register">*用户名:</label><input type="text"  id="username" name="username" class="form-control" placeholder="请输入用户想要申请的用户名" /><br>
                    <!-- <label for="register">*用户手机:</label><input type="text" class="form-control" placeholder="请输入用户的手机号码" /><br> -->
                    <label for="register">*密码:</label><input type="password" id="userpwd" name="userpwd" class="form-control" placeholder="请输入用户密码" /><br>
                    <!-- <label for="register">*确认密码:</label><input type="password" id="checkpwd" name="checkpwd" class="form-control" placeholder="请用户确认密码" /> -->
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info" onclick="register();">保存</button>
                <button type="button" class="btn btn-warning" onclick="clearInputs()">重置</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearInputs()">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!--登录-->
<div class="modal fade" tabindex="-1" role="dialog" id="login" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">用户登录</h4>
            </div>
            <form id="loginForm" role="form" method="post" onsubmit="return false">
	            <div class="modal-body">
	                <label for="login">用户名:</label><input type="text" id="username" name="username" class="form-control" placeholder="请输入用户名" /><br>
	                <label for="login">密码:</label><input type="password" id="userpwd" name="userpwd" class="form-control" placeholder="请输入用户密码" /><br>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	                <button id="loginSubmit" type="submit" class="btn btn-primary" onclick="login();">确定</button>
	            </div>
            </form>
        </div>
    </div>
</div>

<!--导航栏-->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=basePath%>">
                <span class="glyphicon glyphicon-home" aria-hidden="true"></span> JaeBlog
            </a>
            <button class="navbar-toggle " data-toggle="collapse" data-target="#divNav">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div>
        	<!-- <nav class="sidenav" data-sidenav data-sidenav-toggle="#sidenav-toggle"> -->
            <div id="divNav" class="collapse navbar-collapse">
                <ul  class="nav navbar-nav navbar-left">
                    <c:choose>
                    	<c:when test="${user==null}">
                    	</c:when>
                    	<c:when test="${user!=null }">
                    		<c:choose>
                    		<c:when test="${user!=null&& user.userpermission==0}">
	                    		<li><a style="" href="${pageContext.request.contextPath }/toAddArticle">写博客</a></li>
	                    	</c:when>
                    		</c:choose>
                    		<li class="dropdown">
	                        <a class="dropdown-toggle"  data-hover="dropdown"  data-delay="0" data-close-others="false">
	                           	 博客管理<span class="caret"></span>
	                        </a>
	                        <ul class="dropdown-menu" >
	                        	<c:choose>
		                    		<c:when test="${user!=null&& user.userpermission==0}">
			                    		<li><a href="${pageContext.request.contextPath}/myArticle?id=${user.id}">我的博客</a></li>
			                    		<li><a href="${pageContext.request.contextPath}/sc">博客分类</a></li>
			                    	</c:when>
	                    		</c:choose>                            
	                            <%-- <li><a href="${pageContext.request.contextPath}/aboutWebsite">博客信息</a></li> --%>
	                            <li><a href="${pageContext.request.contextPath}/userInfo?id=${user.id}">我的信息</a></li>	                            
	                        </ul>
                    </li>
                    	</c:when>
                    </c:choose>
                </ul>
                <form id="searchForm" name="searchForm" class="navbar-form navbar-right" role="search"  action="articleByKw" onsubmit="return isValidateSearch(this)">
                    <div class="form-group">
                        <input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search">
                    </div>
                    <input type="submit" class="btn btn-info"  value="搜搜看">
                </form>
                <c:choose>
					<c:when test="${user==null }">
						<ul class="nav navbar-nav navbar-right" id="loginul">
		                    <li><a href="" onclick="return false;" data-toggle="modal" data-target="#register"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
		                    <li><a href="" onclick="return false;" data-toggle="modal" data-target="#login"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
		                    <!--<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> 注销</a></li>-->
						</ul>
					</c:when>
					<c:when test="${user!=null }">
						<ul class="nav navbar-nav navbar-right" id="logintoul">
								<li class="dropdown"><a href="#" class="dropdown-toggle"  data-hover="dropdown" data-delay="0"
									>欢迎，${user.username} <b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a
											href="${pageContext.request.contextPath }/toUpUserInfo.do"><i
												class="glyphicon glyphicon-cog"></i> 编辑个人信息</a></li>
										<%-- <c:if test="${user.isApplied==1}">

											<li class="divider"></li>
											<li><a
												href="<%=basePath%>user?action=bloginfo&userId=${user.id}"><i
													class="glyphicon glyphicon-cog"></i> 编辑博客信息</a></li>
										</c:if> --%>
										<li class="divider"></li>
										<li><a  href="javascript:void(0);" onclick="logout()"><i class="glyphicon glyphicon-off"></i>退出</a></li>
									</ul>
								</li>
							</ul>
					</c:when>
				</c:choose>
                
            </div>
       		<!-- </nav> -->
        </div>
    </div>
</nav>
<div style="height: 50px"></div>

<div class="thumbnail" style="height: 100%;width: 100%; background:url(${pageContext.request.contextPath }/img/themebg.jpg) no-repeat; background-size:100% 100%;opacity: 0.8;">
        <h3 class="text-center lead"> Jae de 博客</h3>
        <br>
        <br>
        <h1 class="text-center lead " style="margin-bottom: 5%;color: #101010"><u>年 轻 是 我 们 唯 一 拥 有 权 利 去 编 织 梦 想 的 时光 ;</u>&nbsp;&nbsp;&nbsp;</h1>
</div>
<a href="javascript:;" class="toggle" id="sidenav-toggle" onclick="return false;">
	    <img  class="divfix" src="${pageContext.request.contextPath }/img/category.png"style="width:30px;height:30px;" />
</a>
<nav class="sidenav" data-sidenav data-sidenav-toggle="#sidenav-toggle">
	<div style="height:50px;"></div>
	<div class="sidenav-brand">
	      	文章分类
	    </div>
			<c:choose>
				<c:when test="${sys_category!=null && fn:length(sys_category)>0}">
					<table class="table table-hover navtable"> 
						<%-- <caption>文章列表</caption> --%>
						<tr><td><a href="<%=basePath%>">Home</a></td></tr>
						<c:forEach items="${sys_category}" var="sc">
							<tr>
							<td><a  href="${pageContext.request.contextPath}/articleBySc?id=${sc.id}">${sc.category_name}</a></td>
							</tr>
						</c:forEach>
						</table>
					
				 </c:when>
				 <c:otherwise>
						<li><a style="color:gray" href="#">暂无分类</a></li>
				 </c:otherwise>
		   </c:choose>

</nav>
<div class="container">

	<div class="col-sm-9">
	
		<ul  class="nav nav-tabs">
			<li><a href="<%=basePath%>">Home</a></li>
			<c:choose>
				<c:when test="${sys_category!=null && fn:length(sys_category)>0}">
					<c:forEach items="${sys_category}" var="sc">
			     	<li><a  href="${pageContext.request.contextPath}/articleBySc?id=${sc.id}">${sc.category_name}</a></li>
			     </c:forEach>
				 </c:when>
				 <c:otherwise>
						<li><a style="color:gray" href="#">暂无分类</a></li>
				 </c:otherwise>
		   </c:choose>
		</ul>
	</div>
	<div class="col-sm-3 hidden-xs"></div>
</div>

<script src="dist/sidenav.js"></script>
  	<script>$('[data-sidenav]').sidenav();</script>
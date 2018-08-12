<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div id= "foot">
<nav class="navbar navbar-inverse text-center" role="navigation">
    <div class="container-fluid">
            <!-- <div class="navbar-header"></div> -->
            <div class="row">
                    <ul  class="nav nav-ul" style="display:inline-block;">
                        <li style="float:left;"><a href="" class="navbar-brand" style="font-size: 99%"><span class="glyphicon glyphicon-thumbs-up"></span>热门文章 </a></li>
                        <li style="float:left;"><a href="" class="navbar-brand"  style="font-size: 99%"><span class="glyphicon glyphicon-eye-open"></span>直视人生 </a></li>
                        <li style="float:left;"><a href="${pageContext.request.contextPath}/aboutWebsite" class="navbar-brand"  style="font-size: 99%"><span class="glyphicon glyphicon-info-sign "></span>关于本站 </a></li>
                        <!--<li><a href="" class="navbar-brand"><span class="glyphicon glyphicon-heart ">捐赠本站 </span></a></li>-->
                    </ul>
                    <ul  class="nav nav-ul " style="display:inline-block;">
                        <li style="float:left;"><a href="${pageContext.request.contextPath}/userInfo?id=1" class="navbar-brand"  style="font-size: 99%"><span class="glyphicon glyphicon-map-marker"></span>我的地址 </a></li>
                        <li style="float:left;"><a href="${pageContext.request.contextPath}/userInfo?id=1" class="navbar-brand"  style="font-size: 99%"><span class="glyphicon glyphicon-earphone "></span>我的微信 </a></li>
                        <li style="float:left;"><a href="${pageContext.request.contextPath}/userInfo?id=1" class="navbar-brand"  style="font-size: 99%"><span class="glyphicon glyphicon-send "></span>我的邮件</a></li>
                    </ul>
            </div>
    </div>
</nav>
<h5  class="text-center">Copyright © 2017-04 Jae博客 版权所有.湘ICP备17011295号-1 <script type="text/javascript">
var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cspan id='cnzz_stat_icon_1261990568'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s19.cnzz.com/z_stat.php%3Fid%3D1261990568%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));
</script></h5>
</div>
<script>
    //随鼠标移动的线条
    !function(){
    function n(n,e,t){return n.getAttribute(e)||t}
    function e(n){return document.getElementsByTagName(n)}
    function t(){var t=e("script"),o=t.length,i=t[o-1];return{l:o,z:n(i,"zIndex",-1),o:n(i,"opacity",.5),c:n(i,"color","0,0,0"),n:n(i,"count",99)}}
    function o(){a=m.width=window.innerWidth||document.documentElement.clientWidth||document.body.clientWidth,c=m.height=window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight}
    function i(){r.clearRect(0,0,a,c);var n,e,t,o,m,l;s.forEach(function(i,x){for(i.x+=i.xa,i.y+=i.ya,i.xa*=i.x>a||i.x<0?-1:1,i.ya*=i.y>c||i.y<0?-1:1,r.fillRect(i.x-.5,i.y-.5,1,1),e=x+1;e<u.length;e++)n=u[e],
    null!==n.x&&null!==n.y&&(o=i.x-n.x,m=i.y-n.y,l=o*o+m*m,l<n.max&&(n===y&&l>=n.max/2&&(i.x-=.03*o,i.y-=.03*m),t=(n.max-l)/n.max,r.beginPath(),r.lineWidth=t/2,r.strokeStyle="rgba("+d.c+","+(t+.2)+")",r.moveTo(i.x,i.y),r.lineTo(n.x,n.y),r.stroke()))}),
    x(i)}var a,c,u,m=document.createElement("canvas"),d=t(),l="c_n"+d.l,r=m.getContext("2d"),x=window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||window.oRequestAnimationFrame||window.msRequestAnimationFrame||function(n){window.setTimeout(n,1e3/45)},w=Math.random,y={x:null,y:null,max:2e4};m.id=l,m.style.cssText="position:fixed;top:0;left:0;z-index:"+d.z+";opacity:"+d.o,e("body")[0].appendChild(m),o(),window.onresize=o,window.onmousemove=function(n){n=n||window.event,y.x=n.clientX,y.y=n.clientY},window.onmouseout=function(){y.x=null,y.y=null};for(var s=[],f=0;d.n>f;f++){var h=w()*a,g=w()*c,v=2*w()-1,p=2*w()-1;s.push({x:h,y:g,xa:v,ya:p,max:6e3})}u=s.concat([y]),setTimeout(function(){i()},100)}();
</script>
<!-- BEGIN PLACE LOADING ICON IN THE MIDDLE OF THE PAGE -->
	<script>
	    jQuery(window).resize(function(){
	        resizenow();
	    });
	    function resizenow() {
	        var browserwidth = jQuery(window).width();
	        var browserheight = jQuery(window).height();
	        jQuery('.bonfire-pageloader-icon').css('right', ((browserwidth - jQuery(".bonfire-pageloader-icon").width())/2)).css('top', ((browserheight - jQuery(".bonfire-pageloader-icon").height())/2));
	    };
	    resizenow();
	    
	    
	    
	</script>
	
</body>
</html>

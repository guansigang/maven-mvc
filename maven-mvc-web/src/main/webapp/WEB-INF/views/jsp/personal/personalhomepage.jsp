<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/static/plugin/bootstrap/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/plugin/bootstrap/bootstrap-3.3.7/css/bootstrap-theme.min.css" rel="stylesheet">
</head>



<style>
.banner { position: relative; overflow: auto; }
.banner li { list-style: none; }
.banner ul li { float: left; }
    </style>
    
    




<body>
 <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Bootstrap theme</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">首页</a></li>
            <li><a href="#about">游记风景</a></li>
            <li><a href="#contact">生活随笔</a></li>
            <li><a href="#contact">网站信息</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">网站管理 <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li role="separator" class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
          </ul>
        </div><!--/.nav-collapse http://www.wenzhihuai.com/-->
      </div>
    </nav>

    <div class="container theme-showcase" role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Theme example</h1>
        <p>This is a template showcasing the optional theme stylesheet included in Bootstrap. Use it as a starting point to create something more unique by building on or modifying it.</p>
      </div>
      <div class="banner">
		    <ul>
			    <li style="background-color:#5CC9E0; text-align: center;">
	            <img src="static/image/personal/timg.jpg" />
	            <h1>企业逼格靠网站，网站逼格靠兼容<br /><small>懒人出品的网站，在电脑、平板、手机、微信，都正常浏览！</small></h1>
	          </li>
	          <li style="text-align: center;">
	            <img src="static/image/personal/timg1.jpg" />
	            <h1>企业400热线电话<br /><small>一个号码，一致对外！</small></h1>
	          </li>
		    
		    
		    
		    
		    
<!-- 		        <li style="background-image: url("static/image/personal/timg.jpg"); background-size: 100% 100%; width: 100%;"><img src="static/image/personal/timg.jpg"></li> -->
<!-- 		        <li style="background-image: url("static/image/personal/timg.jpg"); background-size: 100% 100%; width: 100%;"><img src="static/image/personal/timg1.jpg"></li> -->
<!-- 		        <li style="background-image: url("static/image/personal/timg.jpg"); background-size: 100% 100%; width: 100%;"><img src="static/image/personal/timg2.jpg"></li> -->
<!-- 		        <li style="background-image: url("static/image/personal/timg.jpg"); background-size: 100% 100%; width: 100%;"><img src="static/image/personal/timg3.jpg"></li> -->
<!-- 		        <li style="background-image: url("static/image/personal/timg.jpg"); background-size: 100% 100%; width: 100%;"><img src="static/image/personal/timg4.jpg"></li> -->
		    </ul>
		</div>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}/static/gentellela/js/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/static/plugin/bootstrap/bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/plugin/unslider/unslider.min.js"></script>

<script type="text/javascript">

    $(function() {
    $('.banner').unslider();
});
</script>

<!--     <script src="../../dist/js/bootstrap.min.js"></script> -->
<!--     <script src="../../assets/js/docs.min.js"></script> -->
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<!--     <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script> -->
</body>
</html>
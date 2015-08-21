<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
		<link href="${request.contextPath}/avocado/css/chosen.css" rel='stylesheet' tyle="text/css">
		<link href="${request.contextPath}/avocado/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<link href="${request.contextPath}/avocado/css/prism.css" rel="stylesheet/less" type="text/css">
	  	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,400,600,300" rel='stylesheet' type='text/css'> 
	  	<link href="${request.contextPath}/avocado/css/bootstrap-responsive.css" rel="stylesheet">
	  	<link href="${request.contextPath}/avocado/css/style.css" rel="stylesheet">
		<style type="text/css">
			body { padding-top: 55px; }
		</style>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> 
		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>
		<script src="${request.contextPath}/avocado/js/jquery.jpanelmenu.min.js"></script>
		<script src="${request.contextPath}/avocado/js/jquery.cookie.js"></script>
		<script src="${request.contextPath}/avocado/js/avocado-custom-predom.js"></script>
		<script src="${request.contextPath}/avocado/js/jquery.hotkeys.js"></script>
		<script src="${request.contextPath}/avocado/js/calendar/fullcalendar.min.js"></script>
		<script src="${request.contextPath}/avocado/js/jquery-ui-1.10.2.custom.min.js"></script>
		<script src="${request.contextPath}/avocado/js/jquery.pajinate.js"></script>
		<script src="${request.contextPath}/avocado/js/jquery.prism.min.js"></script>
		<script src="${request.contextPath}/avocado/js/jquery.dataTables.min.js"></script>
		<script src="${request.contextPath}/avocado/js/bootstrap/bootstrap.min.js"></script>
		<script src="${request.contextPath}/avocado/js/bootstrap/bootstrap-wysiwyg.js"></script>
		<script src="${request.contextPath}/avocado/js/bootstrap/bootstrap-typeahead.js"></script>
		<script src="${request.contextPath}/avocado/js/jquery.easing.min.js"></script>
		<script src="${request.contextPath}/avocado/js/jquery.chosen.min.js"></script>
		<script src="${request.contextPath}/avocado/js/avocado-custom.js"></script>
	</head>
	<body>
		<div class="navbar navbar-inverse navbar-fixed-top">
    		<div class="navbar-inner">
      			<div class="container">
        			<a href="#">
          				<button type="button" class="btn btn-navbar mobile-menu">
	            			<span class="icon-bar"></span>
	            			<span class="icon-bar"></span>
	            			<span class="icon-bar"></span>
          				</button>
        			</a>
			        <a class="brand" href="#"><i class="icon-leaf"></i> Avocado<b>Panel</b></a>
			        <ul class="nav pull-right">
			          	<li class="dropdown">
			            	<a href="#">
			              		<i class="icon-user icon-white"></i>
			              		<span class="hidden-phone">Anderson Maia</span>
			            	</a>
			          	</li>
			          	<li>
							<a href="#">
	    						<i class="icon-off icon-white"></i>
	    						<span class="hidden-phone">Logout</span>
	    					</a>
	    				</li>
			        </ul>
      			</div>
    		</div>
  		</div>
		<div class="container">
			<div class="navbar navbar-inverse" id="nav">
	      		<div class="navbar-inner">
	        		<ul class="nav">
	          			<li><a href="#"><i class="icon-list"></i> Dashboard</a></li>
	          			<li><a href="#"><i class="icon-list"></i> Gallery</a></li>
	        		</ul>
	      		</div>
    		</div>

			<g:layoutBody/>
		</div>
  	</body>
</html>
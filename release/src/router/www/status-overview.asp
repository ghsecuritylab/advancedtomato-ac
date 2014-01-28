<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width">
		<meta http-equiv="content-type" content="text/html;charset=utf-8">
		<meta name="robots" content="noindex,nofollow">
		<title>[<% ident(); %>]: Basic</title>
		<link href="css/reset.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<link rel="shortcut icon" href="/favicon.ico" />
		<% css(); %>
		
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="tomato.js"></script>
		<script type="text/javascript" src="js/advancedtomato.js"></script>

		<script type="text/javascript">
			var routerName = '[<% ident(); %>] ';
			//<% nvram("at_update,at_width,tomatoanon_answer"); %>
			//<% anonupdate(); %>
			// Fix for system data display
			var refTimer, wl_ifaces = {}, ajaxLoadingState = false;
		</script>
	</head>
	<body>
		<div id="wrapper">
			<div class="content-wrap">
				<div class="header">
					<div class="titles">
						<a href="/"><h1>Advanced<span>Tomato</span></h1> <img src="img/logo.svg"></a>
						<h2 class="currentpage"></h2>
					</div>

					<div class="pull-right links">
						<ul>
							<li><a href="tools-ping.asp">Tools <i class="icon-tools"></i></a></li>
							<li><a href="bwm-realtime.asp">Bandwidth <i class="icon-graphs"></i></a></li>
							<li><a href="bwm-ipt-realtime.asp">IP Traffic <i class="icon-globe"></i></a></li>
							<li><a id="system-ui" href="#system">System <i class="icon-system"></i></a></li>
						</ul>
						<div class="system-ui">

							<div class="datasystem align center"></div>

							<hr><div class="align center">
								<a href="#" class="btn btn-primary" onclick="reboot();">Reboot <i class="icon-reboot"></i></a>
								<a href="#" class="btn btn-danger" onclick="shutdown();">Shutdown <i class="icon-power"></i></a>
								<a href="#" onclick="logout();" class="btn">Logout <i class="icon-logout"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="navigation"></div>
				<div class="content"><div class="ajaxwrap"></div></div>
			</div>

			<div class="footer">
				<div class="copyright"><a href="#" onclick="loadPage('about.asp'); return false;">&copy; AdvancedTomato 2013</a></div>
				<div class="version">Version: <% version(1); %> &nbsp; <a href="#" class="sticky scrollup"><i class="icon-chevron-up"></i></a></div>
			</div>
		</div>
	</body>
</html>
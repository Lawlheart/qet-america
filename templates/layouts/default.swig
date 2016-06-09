{% import "../mixins/flash-messages.swig" as FlashMessages %}

<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>{{ title|default("QET America") }}</title>
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">


		{% block meta %}{% endblock %}
		<meta name="twitter:domain" content="qet-america.herokuapp.com">
		<meta name="fb:app_id" content="185694088491162">
		
		<link href='//fonts.googleapis.com/css?family=Nunito:400,700,300' rel='stylesheet' type='text/css'>
		<link href='//fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
		<link href='//fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>

		{# Customise the stylesheet for your site by editing /public/styles/site.sass #}
		<link href="/styles/site.css" rel="stylesheet">
		<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.1/css/font-awesome.css">

		{# This file provides the default styling for the KeystoneJS Content Editor #}
		{%- if user and user.canAccessKeystone -%}
			<link href="/keystone/styles/content/editor.min.css" rel="stylesheet">
		{%- endif -%}

		{# HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries
		   Safely remove this block if you are not targeting IE8 #}
		<!--[if lt IE 9]>
			<script src="//cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.js"></script>
			<script src="//cdn.jsdelivr.net/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		{# Include template-specific stylesheets by extending the css block #}
		{%- block css %}{% endblock -%}

		{# Add any other template-specific HEAD tags by extending the head block #}
		{%- block head %}{% endblock %}
	</head>
	<body>
	
		{# NAVBAR #}
		<header class="navigation" role="banner">
			<div class="navigation-wrapper">
				<a href="/" class="logo">
					<img class="icon" src="/images/qet.png" alt="QET Icon">
				</a>
				<a href="javascript:void(0)" class="navigation-menu-button" id="js-mobile-menu">MENU</a>
				<nav role="navigation">
					<ul id="js-navigation-menu" class="navigation-menu show">
						{%- for link in navLinks -%}
							{%- set linkClass = ' class="nav-link"' -%}
							{%- if link.key == section -%}
								{%- set linkClass = ' class="nav-link active"' -%}
							{%- endif %}
							<li{{ linkClass | safe }}>
								<a href="{{ link.href }}">{{ link.label }}</a>
							</li>
						{%- endfor %}
						{% if user -%}
							<li id="js-navigation-admin" class="nav-link admin more"><a href="javascript:void(0)">Account</a>
								<ul class="submenu">
									{%- if user.canAccessKeystone -%}
										<li><a href="/keystone">Open Keystone</a></li>
									{%- endif -%}
									<li><a href="/keystone/signout">Sign Out</a></li>
								</ul>
							</li>
						{%- else -%}
							<li class="nav-link pull-right"><a href="/keystone/signin">Sign In</a></li>
						{%- endif %}
						<li id="js-navigation-lang" class="nav-link lang more"><a href="javascript:void(0)">Language</a>
							<ul class="submenu">
								<li><a href="/languages/es">Español</a></li>
								<li><a href="/languages/en">English</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</header>
		
		{# DONATE BANNER #}
		<div class="donate-bar" role="banner">
			<div class="content">
				<h1>Support QET America</h1>
				<a class="button cta" target="_blank" href="http://qetamerica.org/product/buena-vistas-select-bean-blend-1lb/">Buy Coffee</a>
			</div>
		</div>

		{# BODY #}
		<div id="body">
			{# NOTE:
			   There is no .container wrapping class around body blocks to allow more flexibility in design.
			   Remember to include it in your templates when you override the intro and content blocks! #}

			{# The Intro block appears above flash messages (used for temporary information display) #}
			{%- block intro -%}{%- endblock -%}

			{# Flash messages allow you to display once-off status messages to users, e.g. form
			   validation errors, success messages, etc. #}
			{{ FlashMessages.renderMessages(messages) }}

			{# The content block should contain the body of your template"s content #}
			{%- block content -%}{%- endblock -%}
		</div>

		{# FOOTER #}
		<footer class="footer" role="contentinfo">
			<div class="footer-logo">
				<img class="icon" src="/images/qet.png" alt="QET Icon">
			</div>
			<div class="footer-links">
				<ul>
					<li><h3>QET America</h3></li>
					<li><a href="/">Home</a></li>
					<li><a href="/blog">Blog</a></li>
					<li><a href="/gallery">Gallery</a></li>
					<li><a href="/donate">Donate</a></li>
				</ul>
				<ul>
					<li><h3>Follow Us</h3></li>
					<li><a href="javascript:void(0)">Facebook</a></li>
					<li><a href="javascript:void(0)">Twitter</a></li>
					<li><a href="javascript:void(0)">YouTube</a></li>
				</ul>
				<ul>
					<li><h3>Legal</h3></li>
					<li><a href="javascript:void(0)">Terms and Conditions</a></li>
					<li><a href="javascript:void(0)">Privacy Policy</a></li>
				</ul>
			</div>
			<hr>
			<p>Disclaimer area lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum, nostrum repudiandae saepe.</p>
			<p>Sustainability Icon by Lemon Liu from the Noun Project</p>
		</footer>

		<script src="/js/jquery/jquery-2.1.4.min.js"></script>
		<script src="/js/app/app.js"></script>

		{# The KeystoneJS Content Editor provides support for ks-editable data attributes,
			which generate links to edit content for users who can access Keystone #}
		{% if user and user.canAccessKeystone -%}
			<script src="/keystone/js/content/editor.js"></script>
		{%- endif -%}

		{%- block js -%}{%- endblock -%}
	</body>
</html>

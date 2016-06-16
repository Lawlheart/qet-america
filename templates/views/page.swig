{% extends "../layouts/default.swig" %}

{% import "../mixins/macros.swig" as Macros %}

{% block content %}
	{# For testing purposes #}
	{# <pre>{{ page | json }}</pre> #}
	<div id="post">
		<div class="row">
			<div class="col-md-12">
				<article class="card">
					{% if not page %}
						<h2>Invalid Page.</h2>
					{% else %}
						<header class="titlebar">
							<h1>{{ page.title }}</h1>
							<div class="share">
								{{ Macros.facebook(page.slug) }}
								{{ Macros.twitter(page.slug, page.title) }}
							</div>
						</header>

						<div class="post">

							{# Video, if it exists #}
							{% if page.video.exists %}
								<div class="video-frame">
									{{ page.video.html | safe }}
								</div>
							{% endif %}

							{# Image, if it exists #}
							{% if page.image.exists %}
								<div class="image-wrap">
									{% if page.video.exists %}
										<img src="{{ page._.image.fit(325,225) }}" class="img-thumb">
									{% else %}
										<img src="{{ page._.image.fit(750,450) }}" class="img-responsive">
									{% endif %}
								</div>
							{% endif %}

							{# Document, if it exists #}
							{% if page.docs.exists %}
								<p>Documents: <a href="{{ page.docs.url }}" target="_blank">{{page.docs.filename}}</a></p>
							{% endif %}

							{# Post content #}
							{{ page.content | raw }}

						</div>
					{% endif %}
				</article>
			</div>
		</div>
	</div>
{% endblock %}

{% block js %}
	{# Share Buttons #}
	<div id="fb-root"></div>
	<script src="/js/app/share.js"></script>
{% endblock %}

{% block meta %}
	<meta property="og:type" content="website" />
	<meta property="og:title" content="QET America | {{ page.title }}">
	<meta property="og:url" content="http://qet-america.herokuapp.com/blog/post/{{ page.slug }}" />
	<meta property="og:description"   content="{{ page.content | striptags | replace('^(.{200,200})(.*)', '$1') }}" />

	<meta name="twitter:card" content="summary_large_image">
	<meta name="twitter:title" content="QET America | {{page.title}}">
	<meta name="twitter:description" content="{{ page.content | striptags | replace('^(.{200,200})(.*)', '$1') }}"> 
	{# <meta name="twitter:site" content="@site_username"> #}
	{# <meta name="twitter:creator" content="@creator_username"> #}


	{% if page.video.exists %}
		<meta property="og:image" content="{{ page.video.thumbnailUrl }}" />
		<meta name="twitter:image:src" content="{{ page.video.thumbnailUrl }}">
	{% elseif page.image.exists %}
		<meta property="og:image" content="{{ page._.image.fit(750,450) }}" />
		<meta name="twitter:image:src" content="{{ page._.image.fit(750,450) }}">
	{% else %}
		<meta property="og:image" content="http://qet-america.herokuapp.com/images/default.jpg" />
		<meta name="twitter:image:src" content="http://qet-america.herokuapp.com/images/default.jpg">
	{% endif %}
	
{% endblock %}

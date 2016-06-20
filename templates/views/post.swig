{% extends "../layouts/default.swig" %}

{% import "../mixins/macros.swig" as Macros %}

{% block content %}
	{# For testing purposes #}
	{# <pre>{{ data.post | json }}</pre> #}
	<div id="post">
		<div class="row">
			<div class="col-md-12">
				<p>
					<a href="/blog">&larr; {{ t('back to the blog') }}</a>
				</p>
				<article class="card">
					{% if not data.post %}
						<h2>{{ t('Invalid Post') }}.</h2>
					{% else %}
						<header class="titlebar">
							<h1>{{ data.post.title }}</h1>
							<h5>{{ Macros.postInfo(data.post) }}</h5>
							<div class="share">
								{{ Macros.facebook(data.post.slug) }}
								{{ Macros.twitter(data.post.slug, data.post.title) }}
							</div>
						</header>

						<div class="post">

							{# Video, if it exists #}
							{% if data.post.video.exists %}
								<div class="video-frame">
									{{ data.post.video.html | safe }}
								</div>
							{% endif %}

							{# Image, if it exists #}
							{% if data.post.image.exists %}
								<div class="image-wrap">
									{% if data.post.video.exists %}
										<img src="{{ data.post._.image.fit(325,225) }}" class="img-thumb">
									{% else %}
										<img src="{{ data.post._.image.fit(750,450) }}" class="img-responsive">
									{% endif %}
								</div>
							{% endif %}

							{# Document, if it exists #}
							{% if data.post.docs.length %}
								{% for data in data.post.docs %}
									<a class="button" href="{{ data.document.url }}" target="_blank">Open</a>
									<div class="document-container" id='print'>
										<iframe src="https://docs.google.com/viewer?url=https:{{ data.document.url }}&embedded=true" width="100%" height="100%" style="border: none;"></iframe>
										{{ data.document | json }}
									</div>
								{% endfor %}
							{% endif %}

							{# Post content #}
							{{ data.post.content.full | raw }}

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
	<meta property="og:title" content="QET America | {{ data.post.title }}">
	<meta property="og:url" content="https://qet-america.herokuapp.com/blog/post/{{ data.post.slug }}" />
	<meta property="og:description"   content="{{ data.post.content.brief | striptags | replace('^(.{200,200})(.*)', '$1') }}" />

	<meta name="twitter:card" content="summary_large_image">
	<meta name="twitter:title" content="QET America | {{data.post.title}}">
	<meta name="twitter:description" content="{{ data.post.content.brief | striptags | replace('^(.{200,200})(.*)', '$1') }}"> 
	{# <meta name="twitter:site" content="@site_username"> #}
	{# <meta name="twitter:creator" content="@creator_username"> #}


	{% if data.post.video.exists %}
		<meta property="og:image" content="{{ data.post.video.thumbnailUrl }}" />
		<meta name="twitter:image:src" content="{{ data.post.video.thumbnailUrl }}">
	{% elseif data.post.image.exists %}
		<meta property="og:image" content="{{ data.post._.image.fit(750,450) }}" />
		<meta name="twitter:image:src" content="{{ data.post._.image.fit(750,450) }}">
	{% else %}
		<meta property="og:image" content="http://qet-america.herokuapp.com/images/default.jpg" />
		<meta name="twitter:image:src" content="http://qet-america.herokuapp.com/images/default.jpg">
	{% endif %}
	
{% endblock %}

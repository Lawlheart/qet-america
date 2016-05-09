{% extends "../layouts/default.swig" %}

{% import "../mixins/macros.swig" as Macros %}

{% block content %}
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<article>
					<p>
						<a href="/blog">&larr; back to the blog</a>
					</p>
					<hr>
					{% if not data.post %}
						<h2>Invalid Post.</h2>
					{% else %}
						<header>
							<h1>{{ data.post.title }}</h1>
							<h5>{{ Macros.postInfo(data) }}</h5>
						</header>

						<div class="post">

							{# Video, if it exists #}
							{% if data.post.video.exists %}
								{{ data.post.video.html | safe }}
							{% endif %}

							{# Image, if it exists #}
							{% if data.post.image.exists %}
								<div class="image-wrap">
									{% if data.post.video.exists %}
										<img src="{{ data.post._.image.fit(750,450) }}" class="img-responsive">
									{% else %}
										<img src="{{ data.post._.image.fit(150,90) }}" class="img-thumb">
									{% endif %}
								</div>
							{% endif %}

							{# Document, if it exists #}
							{% if data.post.docs.exists %}
								<p>Documents: <a href="{{ data.post.docs.url }}" target="_blank">{{data.post.docs.filename}}</a></p>
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

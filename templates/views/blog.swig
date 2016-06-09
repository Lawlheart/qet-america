{% extends "../layouts/default.swig" %}

{% import "../mixins/macros.swig" as Macros %}

{% macro showPost(post) %}
	<div class="post card" data-ks-editable="editable(user, { list: 'Post', id: post.id })">
		<div class="titlebar">
			<h1><a href="/blog/post/{{ post.slug }}">{{ post.title }}</a></h1>
			<p class="lead text-muted">{{ Macros.postInfo(post) }}</p>
		</div>
		{% if post.image.exists %}
			<img src="{{ post._.image.fit(240,160) }}" class="img pull-right">
		{% elseif post.video.exists %}
			<img src="{{ post.video.thumbnailUrl }}" class="img pull-right video-thumb">
		{% endif %}
		<p>{{ post.content.brief | safe }}</p>
		{% if post.content.extended %}
			<p class="read-more">
				<a class="read-more" href="/blog/post/{{ post.slug }}">Read more <span>&rsaquo;</span></a>
			</p>
		{% endif %}
	</div>
{% endmacro %}

{% block content %}
	<div id="blog-container">
		<div id="blog-posts">
			{% set title = "Blog" %}
			{% if data.category %}
				{% set title = data.category.name %}
			{% endif %}
			<h1 id="blog-title">{{ title }}</h1>
			{% if filters.category and not data.category %}
				<h3 class="text-muted">Invalid Category.</h3>
			{% else %}
				{% if data.posts.results.length %}
					{% if data.posts.totalPages > 1 %}
						<h4 class="text-weight-normal showing">Showing 
							<strong>{{ data.posts.first }}</strong>
							to 
							<strong>{{ data.posts.last }}</strong>
							of 
							<strong>{{ data.posts.total }}</strong>
							posts.
						</h4>
					{% else %}
						<h4 class="text-weight-normal showing">Showing {{ utils.plural(data.posts.results.length, "* post") }}.</h4>
					{% endif %}
					<div class="blog">
						{% for post in data.posts.results %}
							{{ showPost(post) }}
						{% endfor %}
					</div>
					{% if data.posts.totalPages > 1 %}
						<ul class="pagination">
							{% if data.posts.previous %}
								<li>
									<a href="?page={{ data.posts.previous }}">
										<span class="glyphicon glyphicon-chevron-left"></span>
									</a>
								</li>
							{% else %}
								<li class="disabled">
									<a href="?page=1">
										<span class="glyphicon glyphicon-chevron-left"></span>
									</a>
								</li>
															{% endif %}
								{% for p in data.posts.pages %}
									<li class="{% if data.posts.currentPage == p %}active{% endif %}">
										<a href="?page={% if p == "..." %}{% if i %}{{ data.posts.totalPages }}{% else %}1{% endif %}{% else %}{{ p }}{% endif %}">{{ p }}</a>
									</li>
								{% endfor %}
							{% if data.posts.next %}
								<li>
									<a href="?page={{ data.posts.next }}">
										<span class="glyphicon glyphicon-chevron-right"></span>
									</a>
								</li>
							{% else %}
								<li class="disabled">
									<a href="?page={{ data.posts.totalPages }}">
										<span class="glyphicon glyphicon-chevron-right"></span>
									</a>
								</li>
							{% endif %}
						</ul>
					{% endif %}
				{% else %}
					{% if data.category %}
						<h3 class="text-muted">There are no posts in the category {{ data.category.name }}.</h3>
					{% else %}
						<h3 class="text-muted">There are no posts yet.</h3>
					{% endif %}
				{% endif %}
			{% endif %}
		</div>
		{% if data.categories.length %}
		<div id="blog-categories">
			<h2>Categories</h2>
			<div class="category-list">
				<a href="/blog" class="{% if not data.category %}active{% endif %} category">All Categories</a>
				{% for cat in data.categories %}
					<a href="/blog/{{ cat.key }}" class="{% if data.category and data.category.id == cat.id %}active{% endif %} category">{{ cat.name }}</a>
				{% endfor %}
			</div>
		</div>
		{% endif %}
	</div>
{% endblock %}

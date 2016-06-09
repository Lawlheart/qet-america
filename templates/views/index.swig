{% extends "../layouts/default.swig" %}

{% block content %}
	<div id="mainpage">
		<div id="aboutus" class="half card">
			<div class="titlebar">
				<h1>About Us</h1>
			</div>
			<h2>Who We Are</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores commodi dolor modi, nisi obcaecati odit quidem sint? Aspernatur, consectetur dolore dolores, eius eos facere impedit, magnam recusandae rem repellendus veniam.</p>
			<h2>What We Do</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis consectetur corporis eos est exercitationem obcaecati quisquam, ratione recusandae rem reprehenderit soluta tenetur. Commodi facilis hic laborum quaerat qui reiciendis voluptate!</p>
			<h2>How you can help</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus aliquid autem blanditiis consectetur dignissimos distinctio dolorum ex explicabo, harum maxime nesciunt officiis optio quam sequi sint sunt, tenetur vel voluptatem.</p>
			<a class="button cta pull-right" href="/donate">Donate</a>
		</div>
		<div id="newsfeed" class="half card">
			<div class="titlebar">
				<h1>News</h1>
			</div>
			{% for article in news %}
				<article class="type-system-rounded">
					<p class="date">{{ article.publishedDate | date('d M Y') }}</p>
					<h2>{{ article.headline }}</h2>
					<img src="{{ article.image.url }}" alt="">
					<p>{{ article.content.brief | striptags | safe }}
						<a href="javascript:void(0)" class="read-more">Read More <span>&rsaquo;</span></a>
					</p>
				</article>
			{% endfor %}
		</div>
	</div>
	
{% endblock %}

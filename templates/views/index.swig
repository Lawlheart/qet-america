{% extends "../layouts/default.swig" %}

{% macro showPost(post) %}
	<div class="col-md-6">
		<h2>
			<a href="/blog/post/{{ post.slug }}">{{ post.title }}</a>
		</h2>

		{% if post.image.exists %}
			<img src="{{ post._.image.fit(160,160) }}" class="img pull-right">
		{% elseif post.video.exists %}
			<img src="{{ post.video.thumbnailUrl }}" class="img pull-right video-thumb">
		{% endif %}
		<p>{{ post.content.brief | safe }}</p>
		{% if post.content.extended %}
			<p class="read-more">
				<a href="/blog/post/{{ post.slug }}">{{ t('Read more') }}...</a>
			</p>
		{% endif %}
	</div>
{% endmacro %}

{% block content %}
	<div id="mainpage">
		<div id="aboutus" class="card">
			<div class="titlebar">
				<h1>{{ t('About Us') }}</h1>
			</div>
			{#  i18n had some trouble registering all this text, so I'm just going to put it in 2 if blocks #}
			{% if language === 'en' %}
				<h2>Who We Are</h2>
				<p>We are a not for profit, interdisciplinary team defined by our values including: mutual assistance, democratic participation, social inclusion, the value of others, critical thinking; reflexive, creative and sensitive with the planet.</p>
				<p>We work daily to better agricultural practices, motivating agro-ecology within the community, cooperating integrally and harmonically with reforestation and replanting of areas affected by monoculture and deforestation in order to reach sustainability with time, working with nature and never against her.</p>
				<h2>What We Do</h2>
				<p>We contribute to healthy communication, feedback, awareness, training and promotion of integral, environmental, organic and sustainable development, strengthening local communities, urban and rural through the reinforcement of their unity, the augmenting of their capacity for self-directed sustainability and the improvement of quality of life and of their environment, through agro-ecology and reforestation.</p>
				<h2>How you can help</h2>
				<p>You can contribute to Quinta Esencia Taller, donating through Paypal, in order to support our diverse local activities to better planetary conditions.  You can also support our sponsor by purchasing branded items from SDME (link).</p>
			{% else %}
				<h2>Quienes somos</h2>
				<p>Somos un equipo interdisciplinar sin ánimo de lucro definido por nuestros valores como: La ayuda mutua, la participación democrática, la inclusión social, la alteridad, el pensamiento crítico, reflexivo, creativo y sensible con el planeta.</p>
				<p>Que trabaja a diario en mejorar las prácticas agrícolas, motivando la agroecología con la comunidad, cooperando de manera solidaria y armónica reforestando y replantando áreas afectadas por monocultivo y desforestación para alcanzar la sostenibilidad en el tiempo trabajando con la naturaleza sin atentar contra ella.</p>
				<h2>Que hacemos</h2>
				<p>Contribuimos con la comunicación saludable, retroalimentación, sensibilización, capacitación y promoción del desarrollo integral, ambiental, orgánico y sostenible, fortaleciendo a las comunidades locales urbanas y rurales a través del robustecimiento de su unidad, del aumento de su capacidad de progreso a la auto-sostenibilidad  y el mejoramiento de su calidad de vida y de su entorno, a través de la agroecología y la reforestación.</p>
				<h2>Como pueden ayudarnos</h2>
				<p>Usted contribuye con Quinta Esencia Taller, donando a través de la plataforma Paypal, para apoyar nuestras diversas actividades locales y mejorar las condiciones planetarias.  También puede apoyar nuestro patrocinador, comprando productos del SDME (enlace).</p>
			{% endif %}
			
			<a class="button cta pull-right" href="/donate">{{ t('Donate') }}</a>
		</div>
		<div id="newsfeed" class="card">
			<div class="titlebar">
				<h1>{{ t('News') }}</h1>
			</div>
			{% for article in news %}
				<article class="type-system-rounded">
					<p class="date">{{ article._.publishedDate.format("D MMM YYYY") }}</p>
					<h2>{{ article.title }}</h2>
					<img src="{{ article.image.url }}" alt="">
					<p>{{ article.content.brief | striptags | safe }}
						{#<a href="javascript:void(0)" class="read-more">{{ t('Read more') }} <span>&rsaquo;</span></a>#}
					</p>
				</article>
			{% endfor %}
		</div>

		<!-- div class="row">
			{% if recentPosts.length %}
				{% for post in recentPosts %}
					{{ showPost(post) }}
				{% endfor %}
			{% endif %}
		</div -->
	</div>
	
{% endblock %}

{% extends "../layouts/default.swig" %}

{% block title %}QET America | About Us {% endblock %}

{% block content %}
	<div id="aboutus" class="card">
		<div class="titlebar">
			<h1>{{ t('About Us') }}</h1>
		</div>
		<h2>{{ t('Who We Are') }}</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores commodi dolor modi, nisi obcaecati odit quidem sint? Aspernatur, consectetur dolore dolores, eius eos facere impedit, magnam recusandae rem repellendus veniam.</p>
		<h2>{{ t('What We Do') }}</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis consectetur corporis eos est exercitationem obcaecati quisquam, ratione recusandae rem reprehenderit soluta tenetur. Commodi facilis hic laborum quaerat qui reiciendis voluptate!</p>
		<h2>{{ t('How you can help') }}</h2>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus aliquid autem blanditiis consectetur dignissimos distinctio dolorum ex explicabo, harum maxime nesciunt officiis optio quam sequi sint sunt, tenetur vel voluptatem.</p>
		<a class="button cta pull-right" href="/donate">{{ t('Donate') }}</a>
	</div>
	<h1>Members</h1>
	<div id="users">
		{% for user in users %}
			{% if user.isPublic %}
				<div class="card user third">
					<div class="titlebar">{{ user.name.first }} {{ user.name.last }}
						{% if user.twitter %} <span class="twitter"><a href="https://twitter.com/{{ user.twitter }}" target="_blank">@{{ user.twitter }}</span></a>{% endif %}
					</div>
					{% if user.avatar.exists %}
						<img class="avatar" src="{{ user.avatar.secure_url }}" alt="Avatar for {{ user.name.first }} {{ user.name.last }}">
					{% else %}
						<img class="avatar" src="/images/qet-icon-white.png" alt="Avatar for {{ user.name.first }} {{ user.name.last }}">
					{% endif %}
					{% if user.bio %}
						<h4>Bio</h4>
						{{ user.bio | safe}}
					{% endif %}
				</div>
			{% endif %}
		{% endfor %}
	</div>

{% endblock %}

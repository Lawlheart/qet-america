{% extends "../layouts/default.swig" %}

{% block content %}
	<div class="container">
		<div class="jumbotron">
			<h1>{{ t('Welcome') }}</h1>
			<p>{{ t('This is your new') }} <a href="http://keystonejs.com" target="_blank">KeystoneJS</a> website.</p>
			<p>
				{{ t('It includes the latest versions of') }}
				<a href="http://getbootstrap.com/" target="_blank">Bootstrap</a>
				{{ t('and') }} <a href="http://www.jquery.com/" target="_blank">jQuery</a>.
			</p>
			<p>Visit the <a href="http://keystonejs.com/guide" target="_blank">Getting Started</a> guide to learn how to customise it.</p>
			<hr>
			{% if user and user.canAccessKeystone %}
				<p>
					<a href="/keystone" class="btn btn-lg btn-primary">Open the Admin UI</a>
				</p>
			{% else %}
				<p>We have created a default Admin user for you with the email <strong>admin@keystonejs.com</strong> and the password <strong>admin</strong>.</p>
				<p>
					<a href="/keystone/signin" style="margin-right: 10px" class="btn btn-lg btn-primary">Sign in</a>
					to use the Admin UI.
				</p>
			{% endif %}
			<hr>
			<p>
				Remember to <a href="https://github.com/keystonejs/keystone" target="_blank">Star KeystoneJS on GitHub</a> and
				<a href="https://twitter.com/keystonejs" target="_blank">follow @keystonejs</a> on twitter for updates.
			</p>
		</div>
	</div>
{% endblock %}

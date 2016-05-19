{% extends "../layouts/default.swig" %}


{% block intro %}
	<div class="container">
		<h1>Donate to QET</h1>
	</div>
{% endblock %}

{% block content %}
	<div class="container">
		<div id="donate">
			<script src="https://www.dntly.com/assets/js/v1/form.js" 
					data-donately-id="act_3e1c6fc40d30" 
					data-donately-css-url="http://dev.lawlietblack.com/css/form-dark.css"
					data-donately-embed-css=”true”
			></script>
		</div>
	</div>
{% endblock %}

{% block js %}
	<script src="js/app/donate.js"></script>
{% endblock %}

{% extends "../layouts/default.swig" %}

{# Document Schema {
	id
	slug
	title
	document {
		filename
		originalname
		path
		size
		filetype
		url		
	}
} #}

{% block intro %}
  <div class="container">
    <h1>Documents</h1>
  </div>
{% endblock %}

{% block content %}
  <div class="container">
    <ul id="documents">
		{% for document in documents %}
			<li class="document">
				<a href="{{ document.document.url }}">{{ document.title }}</a>
			</li>
		{% endfor %}
	</ul>
  </div>
{% endblock %}

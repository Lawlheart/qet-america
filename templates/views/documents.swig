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
		{% for doc in documents %}
			<li class="document card">
				<div class="titlebar">
					<h4>{{ doc.title }}</h4>
				</div>
				<div class="document-container" id='print'>
					<iframe src="https://docs.google.com/viewer?url=https:{{ doc.document.url }}&embedded=true" width="100%" height="100%" style="border: none;"></iframe>
				</div>
				<a class="document-open button" href="{{ doc.document.url }}" target="_blank">Open</a>
			</li>
		{% endfor %}
	</ul>
  </div>
{% endblock %}

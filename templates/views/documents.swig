{% extends "../layouts/default.swig" %}

{% block title %}QET America | Documents {% endblock %}

{% block intro %}
  <div class="container">
    <h1 class="bar shadow-4">t('Documents')</h1>
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
				<a href="{{ doc.document.url }}" class="document-open button" target="_blank">t('Open')</a>
				<a href="{{ doc.document.url }}" class="button document-download" download>t('Download')</a>
			</li>
		{% endfor %}
	</ul>
  </div>
{% endblock %}

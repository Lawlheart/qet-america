{% extends "../layouts/default.swig" %}

{% block title %}QET America | Documents {% endblock %}

{% block intro %}
  <div class="container">
    <h1 class="bar shadow-4">{{ t('Documents') }}</h1>
  </div>
{% endblock %}

{% block content %}
	<div class="container document-container">
		{% if documents.results.length %}
			{% if documents.totalPages > 1 %}
				<h4>{{ t('Showing') }} 
					<strong>{{ documents.first }}</strong>
					{{ t('to') }}
					<strong>{{ documents.last }}</strong>
					{{ t('of') }}
					<strong>{{ documents.total }}</strong>
					{{ t('documents') }}.
				</h4>
			{% else %}
				<h4 class="text-weight-normal showing">{{ t('Showing') }} {{ utils.plural(documents.results.length, "* document") }}.</h4>
			{% endif %}
			<ul id="documents">
				{% for doc in documents.results %}
					<li class="document card">
						<div class="titlebar">
							<h4>{{ doc.title }}</h4>
						</div>
						<div class="document-container" id='print'>
							<iframe src="https://docs.google.com/viewer?url=https:{{ doc.document.url }}&embedded=true" width="100%" height="100%" style="border: none;"></iframe>
						</div>
						<a class="document-open button" href="{{ doc.document.url }}" target="_blank">{{ t('Open') }}</a>
					</li>
				{% endfor %}
			</ul>

		{# PAGINATION #}
			{% if documents.totalPages > 1 %}
				<div class="pagination">
					<ul>
						{# Previous #}
						{% if documents.previous %}
							<li class="page-prev"><a href="?page={{ documents.previous }}">Prev</a></li>
						{% else %}
							<li class="disabled page-prev"><a href="?page=1">Prev</a></li>
						{% endif %}
						{# Numbered Pages #}
						{% for p in documents.pages %}
							<li class="{% if documents.currentPage == p %}active{% endif %}">
								<a href="?page={% if p == "..." %}{% if i %}{{ documents.totalPages }}{% else %}1{% endif %}{% else %}{{ p }}{% endif %}">{{ p }}</a>
							</li>
						{% endfor %}
						{# Next #}
						{% if documents.next %}
							<li class="page-next"><a href="?page={{ documents.next }}">{{ t('Next') }}</a></li>
						{% else %}
							<li class="disabled page-next"><a href="?page={{ documents.totalPages }}">{{ t('Next') }}</a></li>
						{% endif %}
					</ul>
				</div>
			{% endif %}
		{% endif %}
	</div>
{% endblock %}

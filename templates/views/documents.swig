{% extends "../layouts/default.swig" %}


{% block intro %}
  <div class="container">
    <h1>Documents</h1>
  </div>
{% endblock %}

{% block content %}
  <div class="container">
    <ul id="documents"></ul>
  </div>
{% endblock %}

{% block js %}
  <script src="js/app/documents.js"></script>
{% endblock %}
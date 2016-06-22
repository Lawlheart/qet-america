{% extends "../layouts/default.swig" %}

{% block content %}
	<div id="enquiries">
		{{ enquiries | json }}
		{% for enq in enquiries %}
			<div class="card">
				<div class="titlebar">
					<h3>{{ enq.name.first }} {{ enq.name.last }} on {{ enq.createdAt|date("M m D, Y") }}</h3>
				</div>
				<div class="content">
					<p class="enquiry-details"><span class="enquiry-label">Name</span> {{ enq.name.first }} {{ enq.name.last }}</p>
					<p class="enquiry-details"><span class="enquiry-label">Date</span> {{ enq.createdAt|date("M m D, Y") }}</p>
					<p class="enquiry-details"><span class="enquiry-label">Enquiry Type</span> {{ enq.enquiryType }}</p>
					<p class="enquiry-details"><span class="enquiry-label">Phone</span> {{ enq.phone }}</p>
					<p class="enquiry-details"><span class="enquiry-label">Email</span> {{ enq.email }}</p>
					<h5 class="enquiry-message-label">Message</h5>
					<p>{{ enq.message.md }}</p>
				</div>
			</div>
		{% endfor %}
	</div>
{% endblock %}

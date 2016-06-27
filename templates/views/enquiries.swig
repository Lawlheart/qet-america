{% extends "../layouts/default.swig" %}

{% block title %}QET America | Enquiries {% endblock %}

{% block content %}
	<div id="enquiries">
		{% if enquiries.length %}
			{% for enq in enquiries %}
				<div class="card">
					<div class="titlebar">
						<h3>Message from {{ enq.name.first }} {{ enq.name.last }} on {{ enq.createdAt|date("M m D, Y") }}</h3>
					</div>
					<div class="content">
						<div class="details">
							<h4>Details</h4>
							<p><span class="enquiry-label">Name</span> {{ enq.name.first }} {{ enq.name.last }}</p>
							<p><span class="enquiry-label">Date</span> {{ enq.createdAt|date("M m D, Y") }}</p>
							<p><span class="enquiry-label">Type</span> {{ enq.enquiryType }}</p>
							<p><span class="enquiry-label">Phone</span> {{ enq.phone }}</p>
							<p><span class="enquiry-label">Email</span> {{ enq.email }}</p>
						</div>
						<div class="message">
							<h4>Message</h4>
							<p>{{ enq.message.md }}</p>
						</div>
					</div>
					<button class="button delete" onclick="deleteEnquiry('{{ enq.id }}')">Delete</button>
				</div>
			{% endfor %}
		{% else %}

			<div class="card">
				<div class="titlebar">Messages</div>
				<div class="content">No Messages</div>
			</div>
		{% endif %}
	</div>
{% endblock %}

{% block js %}
	<script src="/js/app/enquiry.js"></script>

{% endblock %}


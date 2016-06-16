{% extends "../layouts/default.swig" %}

{% block css %}
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery.swipebox/1.4.4/css/swipebox.css">
{% endblock %}

{% block intro %}
	<div class="container">
		<h1>{{ t('Gallery') }}</h1>
	</div>
{% endblock %}

{% block content %}
	<div class="container">
		{% if galleries.length %}
			{% for gallery in galleries %}
				<div class="card">
					<div class="titlebar">
						<h1>{{ gallery.name }}
							{% if gallery.publishedDate %}
								<span class="pull-right text-muted gallery-date">{{ gallery._.publishedDate.format("Do MMM YYYY") }}</span>
							{% endif %}
						</h1>
					</div>
					
	
					<div class="gallery-images">
						{% for image in gallery.images %}
							<div class="gallery-image">
								<a href="{{ image.limit(2000,2000) }}" class="swipebox" title="{{ gallery.name }}" rel="{{ gallery.key }}">
									<img src="{{ image.limit(315,315) }}" class="img-rounded">
								</a>
							</div>
						{% endfor %}
					</div>
				</div>
			{% endfor %}
		{% else %}
			<h3 class="text-muted">There are no image galleries yet.</h3>
		{% endif %}
	</div>
{% endblock %}


{% block js %} 
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery.swipebox/1.4.4/js/jquery.swipebox.js"></script>
	<script type="text/javascript">
	;( function( $ ) {

		$( '.swipebox' ).swipebox({
			hideBarsDelay: 10000,
			loopAtEnd: true
		});

	} )( jQuery );
	</script>
{% endblock %}

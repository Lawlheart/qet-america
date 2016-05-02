{% extends "../layouts/default.swig" %}

{% block css %}
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery.swipebox/1.4.4/css/swipebox.css">
{% endblock %}

{% block intro %}
	<div class="container">
		<h1>Gallery</h1>
	</div>
{% endblock %}

{% block content %}
	<div class="container">
		{% if galleries.length %}
			{% for gallery in galleries %}
				<h2>{{ gallery.name }}
					{% if gallery.publishedDate %}
						<span class="pull-right text-muted gallery-date">{{ gallery._.publishedDate.format("Do MMM YYYY") }}</span>
					{% endif %}
				</h2>

				<div class="row gallery-images">
					{% for image in gallery.images %}
						<div class="gallery-image">
							<a href="{{ image.limit(2000,2000) }}" class="swipebox" title="{{ gallery.name }}" rel="{{ gallery.key }}">
								<img src="{{ image.limit(335,335) }}" class="img-rounded">
							</a>
						</div>
					{% endfor %}
				</div>
			{% endfor %}
			{# For TESTING PURPOSES #}
			{# <h2>Test Gallery <span class="pull-right text-muted">28th Apr 2016</span></h2>
 			<div class="row gallery-images">
				<div class="col-xs-6 col-sm-6 col-md-4 gallery-image">
					<a href="https://snap-photos.s3.amazonaws.com/img-thumbs/960w/F65E5BF6BE.jpg" rel="Gallery 2" class="swipebox" title="Test Image">
						<img src="https://snap-photos.s3.amazonaws.com/img-thumbs/960w/F65E5BF6BE.jpg" class="img-rounded">
					</a>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-4 gallery-image">
					<a href="https://snap-photos.s3.amazonaws.com/img-thumbs/960w/3LBIR0B7GJ.jpg" rel="Gallery 2" class="swipebox" title="Test Image">
						<img src="https://snap-photos.s3.amazonaws.com/img-thumbs/960w/3LBIR0B7GJ.jpg" class="img-rounded">
					</a>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-4 gallery-image">
					<a href="https://snap-photos.s3.amazonaws.com/img-thumbs/960w/U4OZ6VJ0L3.jpg" rel="Gallery 2" class="swipebox" title="Test Image">
						<img src="https://snap-photos.s3.amazonaws.com/img-thumbs/960w/U4OZ6VJ0L3.jpg" class="img-rounded">
					</a>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-4 gallery-image">
					<a href="https://snap-photos.s3.amazonaws.com/img-thumbs/960w/EA50391306.jpg" rel="Gallery 2" class="swipebox" title="Test Image">
						<img src="https://snap-photos.s3.amazonaws.com/img-thumbs/960w/EA50391306.jpg" class="img-rounded">
					</a>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-4 gallery-image">
					<a href="https://snap-photos.s3.amazonaws.com/img-thumbs/960w/FIPKLYO8KH.jpg" rel="Gallery 2" class="swipebox" title="Test Image">
						<img src="https://snap-photos.s3.amazonaws.com/img-thumbs/960w/FIPKLYO8KH.jpg" class="img-rounded">
					</a>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-4 gallery-image">
					<a href="https://snap-photos.s3.amazonaws.com/img-thumbs/960w/2X9RCLYPE4.jpg" rel="Gallery 2" class="swipebox" title="Test Image">
						<img src="https://snap-photos.s3.amazonaws.com/img-thumbs/960w/2X9RCLYPE4.jpg" class="img-rounded">
					</a>
				</div>
				<div class="col-xs-6 col-sm-6 col-md-4 gallery-image">
					<a href="https://snap-photos.s3.amazonaws.com/img-thumbs/960w/MRZZ7VSUNT.jpg" rel="Gallery 2" class="swipebox" title="Test Image">
						<img src="https://snap-photos.s3.amazonaws.com/img-thumbs/960w/MRZZ7VSUNT.jpg" class="img-rounded">
					</a>
				</div>
			</div>  #}
			{# For TESTING PURPOSES #}
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
{% macro postInfo(post) %}
{# Posted (on DATE) (in CATEGORIES) (by AUTHOR) #}
  Posted
  {% if post.publishedDate %}
    on {{ post._.publishedDate.format("MMMM Do, YYYY") }}
  {% endif %}

  {% if post.categories and post.categories.length %}
    in
    {% for cat in post.categories %}
      <a href="/blog/{{ cat.key }}">{{ cat.name }}</a>
      {% if loop.index < post.categories.length - 1 %}, {% endif %}
    {% endfor %}
  {% endif %}

  {# Author, if it exists #}
  {% if post.author %}
    by {{ post.author.name.first }}
  {% endif %}
{% endmacro %}

{% macro facebook(slug) %}
  <div class="fb-share-button" data-href="http://qet-america.herokuapp.com/blog/post/{{ slug }}" data-layout="button" data-mobile-iframe="true"></div>
{% endmacro %}

{% macro twitter(slug, title) %}
<a href="https://twitter.com/share" class="twitter-share-button" data-url="http://qet-america.herokuapp.com/blog/post/{{ slug }}" data-text="{{ title }}" data-hashtags="QETAmerica">Tweet</a>
{% endmacro %}
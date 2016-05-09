{% macro postInfo(data) %}
{# Posted (on DATE) (in CATEGORIES) (by AUTHOR) #}
  Posted
  {% if data.post.publishedDate %}
    on {{ data.post._.publishedDate.format("MMMM Do, YYYY") }}
  {% endif %}

  {% if data.post.categories and data.post.categories.length %}
    in
    {% for cat in data.post.categories %}
      <a href="/blog/{{ cat.key }}">{{ cat.name }}</a>
      {% if loop.index < data.post.categories.length - 1 %}, {% endif %}
    {% endfor %}
  {% endif %}

  {# Author, if it exists #}
  {% if data.post.author %}
    by {{ data.post.author.name.first }}
  {% endif %}
{% endmacro %}
<ul class="thumbnails col5 product-thumbnails">
	{% for item in categoryNews.rows %}
	<li class="span1">
    	<div class="thumbnail">
            <a href="{{ path('frontend.productcart', {"param": item.seo}) }}" title="{{ item.name }}">
            	<div class="labels">
					{% if item.discountprice > 0 %}
			        <span class="label label-promotion">{% trans %}TXT_PROMOTION{% endtrans %}</span>
			        {% endif %}
			        {% if item.new == 1 %}
			        <span class="label label-new">{% trans %}New product{% endtrans %}</span>
			        {% endif %}
			        {% for status in item.statuses %}
			        <span class="label label-{{ status.symbol }}">{{ status.name }}</span>
			        {% endfor %}
	       		</div>
            	<span class="photo">
            		<img src="{{ item.photo }}" alt="{{ item.name }}">
            	</span>
            </a> 
            <div class="caption">
            	<h4><a href="{{ path('frontend.productcart', {"param": item.seo}) }}" title="{{ item.name }}">{{ item.name }}</a></h4>
                {% if item.discountprice > 0 %}
				<p class="price promo">{{ item.discountprice|priceFormat }} <small>{{ item.price|priceFormat }}</small></p>
			    {% else %}
			    <p class="price">{{ item.price|priceFormat }}</p>
			    {% endif %}
                <p class="action">
                	{% if item.onstock == 1 %}
                	<a class="btn btn-primary" onclick="xajax_doQuickAddCart({{ item.id }});return false;" href="{{ path('frontend.productcart', {"param": item.seo}) }}"><i class="icon-shopping-cart icon-white"></i> Do koszyka</a>
                	{% else %}
                	<a class="btn btn-danger" href="{{ path('frontend.contact', {"param": item.id }) }}"> Zapytaj o produkt</a>
                	{% endif %}
                </p>
			</div>
		</div>
	</li>
	{% endfor %}
</ul>

{% extends "layout.tpl" %}
{% block javascript %}
{{ parent() }}
<script type="text/javascript" src="{{ DESIGNPATH }}_js_libs/ckeditor/ckeditor.js?v={{ appVersion }}"></script>
{% endblock %}
{% block content %}
<h2><img src="{{ DESIGNPATH }}_images_panel/icons/modules/category-edit.png" alt=""/>{% trans %}TXT_EDIT_CATEGORY{% endtrans %}: {{ categoryName }}</h2>
<ul class="possibilities">
	<li><a href="{{ URL }}category" class="button return" title="{% trans %}TXT_RETURN_TO_PREVIOUS_SCREEN{% endtrans %}"><span><img src="{{ DESIGNPATH }}_images_panel/icons/buttons/arrow-left-gray.png" title="{% trans %}TXT_CATEGORY_LIST{% endtrans %}" alt="{% trans %}TXT_CATEGORY_LIST{% endtrans %}"/></span></a></li>
	<!-- <li><a href="#category" rel="reset" class="button" title="{% trans %}TXT_START_AGAIN{% endtrans %}"><span><img src="{{ DESIGNPATH }}_images_panel/icons/buttons/clean.png" alt=""/>{% trans %}TXT_START_AGAIN{% endtrans %}</span></a></li> -->
	<li><a href="#category" rel="submit" class="button" title="{% trans %}TXT_SAVE{% endtrans %}"><span><img src="{{ DESIGNPATH }}_images_panel/icons/buttons/check.png" alt=""/>{% trans %}TXT_SAVE{% endtrans %}</span></a></li>
</ul>

<script type="text/javascript">
function openCategoryEditor(sId) {
	if (sId == undefined) {
		window.location = '{{ URL }}{{ CURRENT_CONTROLLER }}';
	}
	else {
		window.location = '{{ URL }}{{ CURRENT_CONTROLLER }}/edit/' + sId;
	}
};

$(document).ready(function() {

	$('input[name="__required_data[categoryid]"]').click(function(e){
		if($(this).val() == {{ id }}){
			e.stopImmediatePropagation();
			return false;
		}
	});

	$.each(GCore.aoLanguages,function(l,language){
	    var name = "#required_data__language_data__"+language.id+"__name";
	    var seo = "#required_data__language_data__"+language.id+"__seo";

	    var sRefreshLink =  $('<img title="{% trans %}TXT_REFRESH_SEO{% endtrans %}" src="' + GCore.DESIGN_PATH + '_images_panel/icons/datagrid/refresh.png" />').css({
			cursor: 'pointer',
			'margin-top': '3px',
			'margin-left': '3px',
		});
		$(seo).parent().parent().append(sRefreshLink);

		sRefreshLink.click(function(){
			xajax_doAJAXCreateSeoCategory({
				name: $(name).val(),
				language: language.id
			}, GCallback(function(eEvent) {
				$(seo).val(eEvent.seo);
			}));
		});

	    if($(seo).val() == ''){
	      	xajax_doAJAXCreateSeoCategory({
				name: $(name).val(),
				language: language.id
			}, GCallback(function(eEvent) {
				$(seo).val(eEvent.seo);
			}));
        }
	});
});

</script>
<div class="layout-two-columns">
	<div class="column narrow-collapsed">
		<div class="block">
			{{ tree }}
		</div>
	</div>
	<div class="column wide-collapsed">
		{{ form }}
	</div>
</div>
{% endblock %}
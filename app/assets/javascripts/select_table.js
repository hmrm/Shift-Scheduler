$(document).ready(function(){
    $( ".selectable" ).selectable({
	filter : 'td.option'
    });
    var url = window.location.href;

    if (url.substr(-1) == '/') url = url.substr(0, url.length - 2);

    url = url.split('/');
    url.pop();
    url.pop();

    url = url.join('/');
    $.each(['pref', 'can', 'no'], function(index, inpt){
	$('#' + inpt).click(function(){
	    var ids = [];
	    $('td.ui-selected').each(function(){
		ids.push( $(this).attr('id'));
		$(this).removeClass('pref can no');
		$(this).addClass(inpt);
	    });
	    $.ajax({
		type: 'PUT',
		url: url + '/availabilities',
		data: {available: inpt, ids: ids},
	    });
	});
    });
});
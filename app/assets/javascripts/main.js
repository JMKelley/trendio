$( document ).ready(function() {
  $('.btn-bucket').click(function(e) {
  	e.preventDefault();
  	var id = $(this).data('id');
  	var url = $(this).attr('href');

  	$.ajax({
  		url: url,
  		data: {
  			widget_id: id
  		},
  		type: "POST",
  		success: function() {
  			console.log("Woop!");
  		},
  		error: function() {
  			console.log(":(");
  		}
  	});


  });
});
$( document ).ready(function() {
  $('.btn-bucket').click(function(e) {
  	e.preventDefault();
  	var id = $(this).data('id');
  	var url = $(this).attr('href') + '.json';

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


$(document).ready(function() {
    $("img.lazy").lazyload({
      threshold : 100
    });
    $("body").tooltip({ selector: '[data-toggle=tooltip]' });
    $("#mascot").addClass("mascot-animate"); 
    $("#mascot-icons").addClass("mascot-icons-animate"); 

    $('#overlay-open').click(function(){
      $("#overlay-menu").toggleClass("overlay-menu-visible");
    });

    $('#overlay-close').click(function(){
      $("#overlay-menu").toggleClass("overlay-menu-visible");
    });
});

$(document).ready(function() {

  var $container = $('.container,.nav');

  function loop(){  
    if($container.hasClass('on')) {
      $container.removeClass('on');
    } else {
       $container.addClass('on');
    }
  }

  $container.on('click', loop);
  
});
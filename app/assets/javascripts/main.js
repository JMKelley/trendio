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

    $('.item .widget-info p').each(function() {
        var $this = $(this);
        if($this.html().replace(/\s|&nbsp;/g, '').length == 0)
            $this.remove();
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

    $(window).scroll(function () {
      if (($(window).scrollTop() + $(window).height()) > 0.8 * $(document).height()) {
         $(".pages").addClass("pages-inview");
      } else {
        $(".pages").removeClass("pages-inview");
      }
    });

    if ($(document).height() <= $(window).height()) {
      $(".pages").addClass("pages-inview");
    }
});


$(window).load(function() {

  var height = +$('#show-image').height();
  var width = +$('#show-image').width();
  var ratio = width/height;

  console.log([height,width,ratio])

  if(ratio >= 1.2) {
    $("#show-image").addClass("landscape");
  }

  else {
    $("#show-image").addClass("portrait");
  }

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






$(document).ready(function(){

	$('#introbox h1').hide().slideDown('slow');
	$('#introbox h2').hide().delay(700).fadeIn(2000);

// ----------------------------------------------------


$(function(){
    var fadeBegin = 500, 
    fadeFinish = 690, 
    fadingElement = $('#nav');

$(window).on('scroll', function(){
    var offset = $(document).scrollTop(), opacity = 0; 
    if( offset <= fadeBegin ){
        opacity = 1; 
    } else if( offset <= fadeFinish ){
        opacity = 1 - offset / fadeFinish;

    }
    fadingElement.css('opacity',opacity);
});
    
    });

}); 
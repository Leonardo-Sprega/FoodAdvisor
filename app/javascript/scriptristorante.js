
$(document).ready(function(){

    $("#section_rec_img #row-image img").on("click", function() { //zoom nell'immagine
        $('.popup-image').show();
        $('.popup-image img').attr("src", $(this).attr("src"));
    });

    $("#section_rec_img .popup-image span").on("click", function() { //zoom nell'immagine
        $('.popup-image').hide();
    });
    
    $('.carousel').carousel({
        interval: 1000
    })
});

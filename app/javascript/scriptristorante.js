
$(document).ready(function(){

    $("#rist #ristorantes_body table #sx_body #section_recensioni #section_rec .section_recensione #borderdiv table #dx_rec #section_rec_img #row-image #colonna img").on("click", function() { //zoom nell'immagine
        $('#rist #ristorantes_body table #sx_body #section_recensioni #section_rec .section_recensione #borderdiv table #dx_rec #section_rec_img .popup-image').show();
        $('#rist #ristorantes_body table #sx_body #section_recensioni #section_rec .section_recensione #borderdiv table #dx_rec #section_rec_img .popup-image img').attr("src", $(this).attr("src"));
    });

    $("#rist #ristorantes_body table #sx_body #section_recensioni #section_rec .section_recensione #borderdiv table #dx_rec #section_rec_img .popup-image span").on("click", function() { //zoom nell'immagine
        $('#rist #ristorantes_body table #sx_body #section_recensioni #section_rec .section_recensione #borderdiv table #dx_rec #section_rec_img .popup-image').hide();
    });
    
    $('.carousel').carousel({
        interval: 1000
    })
});


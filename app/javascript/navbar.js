document.addEventListener("turbo:load", ()=>{
    $(window).on("scroll",function(){
    var wn = $(window).scrollTop();
    if(wn > 70){
        $("#navbrist").css("border-bottom","1px solid rgb(192, 192, 192)");
    }
    else{
        $("#navbrist").css("border-bottom","none");
    }
})
})
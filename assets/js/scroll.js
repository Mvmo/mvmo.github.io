/*$(window).on("scroll", function () {
    var sideBarEnabled = false;

    var scrollTop = $(window).scrollTop();
    console.log(scrollTop)

    if(scrollTop >= $('#header').height() && sideBarEnabled === false) {
        sideBarEnabled = true;

        $('#side-bar').addClass('animate-sidebar');
        $('#side-bar').show();

        setTimeout(function () {
            $('#side-bar').removeClass('animate-sidebar');
        }, 2000);

    }else if(scrollTop <= $('#header').height() && sideBarEnabled === true) {
        sideBarEnabled = false;
        $('#side-bar').attr("hidden")
    }

});*/
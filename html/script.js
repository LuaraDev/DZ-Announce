window.addEventListener('message', function(event) {
    var data = event.data
    if (data.mode == "toggleOn") {
        $('.text').html(data.text); 
        $(".announce-container").slideDown();

        setTimeout(function(){
            $('.announce-container').slideUp()
            setTimeout(function(){
                $('.announce-container').css('display', 'none')
            }, 500)
        }, data.length)
    } else {
        console.log("Wrong event.")
    }
})
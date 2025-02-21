let currentIndex = 0;
let slides = $(".slide");
ShowSlideInfo(currentIndex);

function LoadPrevious() {
    let nextIndex = (currentIndex - 1 + slides.length) % slides.length; // Wrap around

    // 1. Animate CURRENT slide OUT (to the right)
    $(slides[currentIndex]).animate({left: '100%'}, 500, function(){
        $(this).css("display", "none");
        $(this).css("left", "0"); // Reset position
    });

    // 2. Animate PREVIOUS slide IN (from the left)
    $(slides[nextIndex]).css("left", "-100%"); // Start off-screen to the left *BEFORE* animating
    $(slides[nextIndex]).css("display", "block"); // Make it visible *BEFORE* animating

    $(slides[nextIndex]).animate({left: '0%'}, 500); // Slide it in

    currentIndex = nextIndex;
    ShowSlideInfo(currentIndex);
}
function LoadNext() {
    let nextIndex = (currentIndex + 1) % slides.length; // Wrap around

    // 1. Animate CURRENT slide OUT (to the left)
    $(slides[currentIndex]).animate({left: '-100%'}, 500, function() {
        $(this).css("display", "none");
        $(this).css("left", "0"); // Reset position for next time
    });

    // 2. Animate NEXT slide IN (from the right)
    $(slides[nextIndex]).css("left", "100%"); // Start off-screen to the right
    $(slides[nextIndex]).css("display", "block"); // Make visible (but off-screen)
    $(slides[nextIndex]).animate({left: '0%'}, 500); // Slide in

    currentIndex = nextIndex;
    ShowSlideInfo(currentIndex);

}

function ShowSlideInfo(index){
    if(!(index > slides.length) && !(index < 0))
    {
        slides.each(function(i, slide){
            $(slide).css("display", "none");
        });
        $(slides[index]).css("display", "block");
    }
}
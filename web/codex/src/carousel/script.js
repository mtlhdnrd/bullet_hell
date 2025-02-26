
$(document).ready(function() {
    const $prevBtn = $('#prevBtn');
    const $nextBtn = $('#nextBtn');
    const $carouselItems = $('.carousel-item');
    let currentItemIndex = 0;

    function slide(newIndex, direction) {
        const inClass = `slide-in-${direction}`;
        const outClass = `slide-out-${direction === 'right' ? 'left' : 'right'}`;

        $carouselItems.eq(newIndex).addClass(inClass);

        setTimeout(() => {
            $carouselItems.eq(currentItemIndex).addClass(outClass);

            setTimeout(() => {
                $carouselItems.eq(currentItemIndex).removeClass('active ' + outClass);
                $carouselItems.eq(newIndex).removeClass(inClass).addClass('active');
                currentItemIndex = newIndex;
            }, 600);
        }, 0);
    }

    $nextBtn.on('click', function() {
        let nextIndex = (currentItemIndex + 1) % $carouselItems.length;
        slide(nextIndex, 'right');
    });

    $prevBtn.on('click', function() {
        let prevIndex = (currentItemIndex - 1 + $carouselItems.length) % $carouselItems.length;
        slide(prevIndex, 'left');
    });

    $carouselItems.removeClass('active').eq(currentItemIndex).addClass('active');
});
class BHMap {
    constructor(
        name,
        file_name,
        description,
        music_pack_name,
        music_pack_description
    ) {
        this.name = name;
        this.file_name = file_name;
        this.description = description;
        this.music_pack_name = music_pack_name;
        this.music_pack_description = music_pack_description;
    }
}

function setBackgroundImage(imageUrl) {
    if (window.innerWidth <= 768) { // Apply only on mobile/tablet
        $("#carousel-wrapper").css("background-image", `url('${imageUrl}')`);
    } else {
        $("#carousel-wrapper").css("background-image", `none`); // Remove background on larger screens
    }
}

function LoadMaps() {
    // Return the promise from $.ajax
    return $.ajax({
        type: "GET",
        url: "load_codex_data.php",
        data: { data_type: "maps" },
        dataType: "json",
        success: function (data) {
            // No need for a global maps array if you're using the promise correctly.
            const maps = [];
            $.each(data, function (index, map) {
                maps.push(
                    new BHMap(
                        map.name,
                        map.map_file_name,
                        map.map_description,
                        map.music_pack_name,
                        map.music_pack_description
                    )
                );
            });
            return maps; // Return the maps array from the success handler.
        },
        error: function (xhr, status, error) {
            console.error("AJAX Error:", status, error); // Better error logging
        },
    });
}

function DisplayMaps(maps) {
    let carouselElements = '';

    maps.forEach((map, index) => {
        carouselElements += `
        <div class="carousel-item ${index === 0 ? 'active' : ''}">
                <img src="../src/images/maps/${map.map_file_name}" alt="${map.name}">
                <div class="description-label">
                    <h1>${map.name}</h1>
                    <p>${map.map_description}</p>
                </div>
            </div>
        `;
    });
    $('#carousel-items-container').html(carouselElements);
}

$(document).ready(function() {
    LoadMaps().then(function(maps) {
        DisplayMaps(maps);
        if (maps.length > 0) {
            setBackgroundImage(`../src/images/maps/${maps[0].map_file_name}`);
        }
        // --- Carousel Logic
        const $prevBtn = $('#prevBtn');
        const $nextBtn = $('#nextBtn');
        const $carouselItems = $('.carousel-item');
        let currentItemIndex = 0;

        function slide(newIndex, direction) {
            const inClass = `slide-in-${direction}`;
            const outClass = `slide-out-${direction === 'right' ? 'left' : 'right'}`;

            $carouselItems.eq(newIndex).addClass(inClass);

            //Update background image
            const newImageUrl = $carouselItems.eq(newIndex).find('img').attr('src');
            setBackgroundImage(newImageUrl);

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
        window.scrollTo(0, document.body.scrollHeight);
    });
});

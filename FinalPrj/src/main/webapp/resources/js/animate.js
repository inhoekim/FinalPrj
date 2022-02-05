'use strict'

function animate_shake(target,strength) {
    for(let i = 0; i < 3; i++) {
        $(target).animate({"left": strength}, 50);
        $(target).animate({"left": -strength*2}, 100);
        $(target).animate({"left": strength}, 50);
    }
}

const currentLocation = location.href;
const menuItem = document.querySelectorAll('.list-group-item');
const menuLength = menuItem.length;
//const splash = document.querySelector('.splash');
//document.addEventListener('DOMContentLoaded', () => {
//    setTimeout(() => {
//        splash.classList.add('display-none');
//    }, 2000);
//});
for (let i = 0; i < menuLength; i++) {
    if (menuItem[i].href === currentLocation) {
        menuItem[i].className = "list-group-item list-group-item-action active";
    }
}

function toggleReadMore() {
    let dots = document.getElementsByClassName("dots");
    let moreText = document.getElementsByClassName("more");
    let readMoreText = document.getElementsByClassName("read-toggle");
    let i = 0;
    while (i !== null) {
        if (dots[i].style.display === "none") {
            dots[i].style.display = "inline";
            readMoreText[i].innerHTML = "Read more";
            moreText[i].style.display = "none";
        } else {
            dots[i].style.display = "none";
            readMoreText[i].innerHTML = "Read less";
            moreText[i].style.display = "inline";
        }
        i++;
    }

}


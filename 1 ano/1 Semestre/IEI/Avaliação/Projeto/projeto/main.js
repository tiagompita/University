let text = document.getElementById('text');
let backg = document.getElementById('backg');
let trophy = document.getElementById('trophy');

window.addEventListener('scroll', () => {
    let value = window.scrollY;
    if (value > 1800){
        trophy.style.left = (value-2700) * 1 + "px";
    }
})

window.addEventListener('scroll', function() {
    var scrollPosition = window.scrollY;
    var scrollTexts = document.querySelectorAll('.scroll-text');

    scrollTexts.forEach(function(scrollText) {
        var textPosition = scrollText.getBoundingClientRect().top + window.scrollY;
        if (scrollPosition > textPosition - window.innerHeight) {
            scrollText.style.opacity = '1';
        } else {
            scrollText.style.opacity = '0';
        }
    });
});

document.addEventListener('DOMContentLoaded', function() {
    var currentDate = new Date();
    var day = currentDate.getDate();
    var month = currentDate.getMonth() + 1; // Os meses são indexados a partir de 0 em JavaScript
    var year = currentDate.getFullYear();
    document.getElementById('currentDate').textContent = day + '/' + month + '/' + year;
});

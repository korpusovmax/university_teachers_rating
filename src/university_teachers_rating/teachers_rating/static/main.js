const load_more_btn = document.getElementsByClassName('load_more')[0];

load_more_btn.addEventListener("click", async function (e) {
    //console.log('start')
    const response = await fetch('./api/cards');
    response.text().then(function(result) {
        document.getElementsByClassName('rates')[0].innerHTML += result;
    });
}, false);

const search_btn = document.getElementsByClassName('search_section__icon')[0];

search_btn.addEventListener('click', async function(e) {
    //TODO: search request
    //TODO: render result on the page
}, false);
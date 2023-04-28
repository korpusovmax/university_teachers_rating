var element = document.getElementsByClassName('load_more')[0];

element.addEventListener("click", async function (e) {
    //console.log('start')
    const response = await fetch('./api/cards');
    response.text().then(function(result) {
        document.getElementsByClassName('rates')[0].innerHTML += result;
    });
}, false);
//e = DOM.getElementsByClassName('load_more');
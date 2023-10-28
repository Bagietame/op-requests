const animateCSS = (element, animation, prefix = 'animate__') =>
  new Promise((resolve, reject) => {
    const animationName = `${prefix}${animation}`;
    const node = document.querySelector(element);

    node.classList.add(`${prefix}animated`, animationName);

    function handleAnimationEnd(event) {
      event.stopPropagation();
      node.classList.remove(`${prefix}animated`, animationName);
      resolve('Animation ended');
    }

    node.addEventListener('animationend', handleAnimationEnd, {once: true});
});

$(function () {
    window.addEventListener('message', function (event) {
        if (event.data.action == "showRequest") {
            showRequest(event.data.head, event.data.desc)
        }
    })
})

function showRequest(head, desc) {
    console.log('bagno')
    document.getElementById('request-header-topic').innerHTML = head
    document.getElementById('request-header-description').innerHTML = desc

    $('#request').show()
    animateCSS('#request', 'backInDown')
}

function acceptRequest() {
    $('#yesmark').fadeIn(100)
    $('#blur').fadeIn(100)

    $.post('https://op-requests/accepted', JSON.stringify({}));

    setTimeout(function() {
        animateCSS('#request', 'backOutUp').then((message) => {
            $('#request').hide()
            $('#yesmark').hide()
            $('#blur').hide()
        })
    }, 1500)
}

function denyRequest() {
    $('#nomark').fadeIn(100)
    $('#blur').fadeIn(100)

    $.post('https://op-requests/rejected', JSON.stringify({}));

    setTimeout(function() {
        animateCSS('#request', 'backOutUp').then((message) => {
            $('#request').hide()
            $('#nomark').hide()
            $('#blur').hide()
        })
    }, 1500)
}
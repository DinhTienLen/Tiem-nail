//  Traversing Magic Line Mobile Footer
// ------------------------------------
// Compatibility: IE 10+,  WAI-ARIA recommendations for menulist / current menuitem
// Author: Crafted in Quarantine, dirkdigweed@gmx.net for host-one.ch
// Created: 2020.04.06, 12:34h
// Updated: 2020.04.07, 10:12h

var mobileFooter = (function () {
    var d = document, i18n = { current: 'current' },
        navs = d.querySelectorAll('.mobile-footer');
    [].forEach.call(navs, function (nav, index) {
        var links = nav.getElementsByTagName('a'),
            line = nav.getElementsByClassName('line')[0],
            a = 0, c = 0, i = 1; // active, current, increment
        if (!line) {
            line = d.createElement('i');
            line.setAttribute('aria-hidden', true);
            line.className = 'line';
            line.innerHTML = i18n.current;
            nav.appendChild(line);
        }
        line.id = 'nav-current' + index;
        if (!line.innerHTML.length) line.innerHTML = i18n.current;
        [].forEach.call(links, function (link, index) {
            links[index].removeAttribute('aria-describedby');
            if (links[index].className.match(/\bactive\b/g)) place(line, links[index]);
            link.addEventListener('click', function (e) {
                a = index;
                var t = setInterval(function () {
                    links[c].classList.remove('traversing');
                    links[c].classList.remove('active');
                    if (a > c) i = 1;
                    else if (a < c) i = -1;
                    c += i;
                    links[c].classList.add('traversing');
                    if (c != -1) {
                        links[c - i].classList.remove('active');
                    }
                    if (c == a) {
                        e.target.classList.remove('traversing');
                        e.target.classList.add('active')
                        i = 0;
                        clearInterval(t);
                    }
                }, 100);
                place(line, e.target);
            });
        });
    });
    function place(l, a) {
        a.setAttribute('aria-describedby', l.id || 'nav-current');
        l.style.width = a.offsetWidth + 'px';
        l.style.left = a.offsetLeft + a.offsetWidth / 2 + 'px';
    }
})();
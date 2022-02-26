var $ = (function () {

    'use strict';

    var constructor = function (selector) {
        this.elems = document.querySelectorAll(selector);
    };
    
    constructor.prototype.onHover = function (callback) {
        
        this.elems[0].addEventListener("mouseenter", callback);
    };
    
    var instantiate = function (selector) {
        return new constructor(selector);
    };

    return instantiate;

})();

function show(tar) {
    
    let target = document.querySelector(tar);

    target.style.display = 'block';
            
    target.addEventListener("mouseleave", function() {
        target.style.display = 'none';
    });
}

function dismiss(tar) {
    
    let target = document.querySelector(tar);

    target.style.display = 'none';
            
    target.addEventListener("mouseleave", function() {
        target.style.display = 'block';
    });
}


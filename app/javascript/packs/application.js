console.log("Hi there ! I'm paultursuru and I made this with rails :)")
console.log("You can find me on github <3")


require("@rails/actiontext")
require("trix")


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();

  // map our commands to the classList methods
  const fnmap = {
    'toggle': 'toggle',
      'show': 'add',
      'hide': 'remove'
  };
  const collapse = (selector, cmd) => {
    const targets = Array.from(document.querySelectorAll(selector));
    targets.forEach(target => {
      target.classList[fnmap[cmd]]('show');
    });
  };

  // Grab all the trigger elements on the page
  const triggers = Array.from(document.querySelectorAll('[data-toggle="collapse"]'));
  // Listen for click events, but only on our triggers
  window.addEventListener('click', (ev) => {
    const elm = ev.target;
    // if (triggers.includes(elm)) {
      const selector = elm.getAttribute('data-target');
      collapse(selector, 'toggle');
    // }
  }, false);
});

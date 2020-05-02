console.log("Hi there ! I'm paultursuru and I made this with rails :)")
console.log("You can find me on github <3")


require("@rails/actiontext")
require("trix")


document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();

  // collapse link + div
  const toCollapse = document.getElementById('toCollapse');
  const collapsor = document.getElementById('collapsor');

  collapsor.addEventListener('click', (event) => {
    if (toCollapse.classList.contains('show')) {
      toCollapse.classList.add('hide');
      toCollapse.classList.remove('show');
    } else {
      toCollapse.classList.remove('hide');
      toCollapse.classList.add('show');
    };

  });
});

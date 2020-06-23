document.addEventListener('turbolinks:load', function () {
  let progress_buttons = document.querySelectorAll('.progress-button');

  if (progress_buttons.length) {
    for (let i = 0; i < progress_buttons.length; i++) {
      progress_buttons[i].addEventListener('click', progress_button_counter)
    }
  };

  current_progress_button();
});

function progress_button_counter(event) {

  var elem = document.getElementById("bar");  
  if (elem === null) {
    return 0;
  };

  let current_pos = elem.dataset.currentQuestion - 1;
  let next_pos = current_pos + 1;
  let last_pos = elem.dataset.questionsSize;
  

  var current_width = Math.round(current_pos / last_pos * 100);
  var nextwidth = Math.round(next_pos / last_pos * 100);
  var id = setInterval(frame, 20);

  function frame() {
    if (current_width >= nextwidth) {
      clearInterval(id);
    } else {
      current_width++; 
      elem.style.width = current_width + '%'; 
    };
  };    
};

function current_progress_button() {

  var elem = document.getElementById("bar");   
  if (elem === null) {
    return 0;
  };

  let current_pos = elem.dataset.currentQuestion - 1;
  let last_pos = elem.dataset.questionsSize;
  

  var current_width = Math.round(current_pos / last_pos * 100);

  elem.style.width = current_width + '%'; 
};

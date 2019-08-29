const quizz = document.getElementById('quizz');

if (quizz) { // only build a quizz if there's a div#quizz to inject into
  const answers = document.querySelectorAll('.answer');
  answers.forEach((answer) => {
    answer.addEventListener("click", (event) => {
    for (let i = 0; i < answers.length; i++) {
      answers[i].classList.add('disabled');
    }
    });
  });

  const next = document.getElementById('button-next');
  next.addEventListener("click", (event) => {
    next.classList.add('disabled');
  });

  const test = document.querySelector('#button-hint')
  const hint = document.querySelector('#quizz');
  if (hint.dataset.hint) {
    answers[3].classList.add('disabled');
    answers[Math.floor(Math.random() * 2) + 1].classList.add('disabled');
    test.classList.add('disabled');
  }

  document.querySelectorAll("#choice").forEach((choice) => {
    choice.addEventListener("click", (event) => {
      next.classList.remove('disabled');
      if ((choice.dataset.index) === "0" ) {
        document.getElementById("success-field").value = "true"
        choice.classList.add('choice-good');
      } else {
        for (let i = 1; i < answers.length; i++) {
        answers[i].classList.add('disabled');
        }
        choice.classList.add('choice-bad');
        answers[0].classList.add('choice-good');
       }
      test.classList.add('disabled');
    });
  });
}

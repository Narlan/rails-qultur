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

  const hint = document.querySelector('#quizz');
  if (hint.dataset.hint) {
    console.log("sa marche pas")
    answers[3].classList.add('disabled');
    answers[Math.floor(Math.random() * 2) + 1].classList.add('disabled');
    const tets = document.querySelector('#button-hint').classList.add('disabled');
    console.log(tets);
  }

  document.querySelectorAll("#choice").forEach((choice) => {
    choice.addEventListener("click", (event) => {
      next.classList.remove('disabled');
      if ((choice.dataset.index) === "0" ) {
        document.getElementById("success-field").value = "true"
        choice.classList.add('choice-good');
        //disabled tous les autres choices
      } else {
        choice.classList.add('choice-bad');
        //disabled tous les autres choices
        const displayAnswer = document.getElementById('answer');
        displayAnswer.insertAdjacentHTML("afterbegin", `<p>La bonne réponse était : <strong>${event.path[1].childNodes[1].innerText}</strong></p>`);
      }
    });
  });
}

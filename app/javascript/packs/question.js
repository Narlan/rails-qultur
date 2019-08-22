// const quizz = document.getElementById('quizz');
//   quizz.addEventListener('click', (event) => {
//     event
//   })

const next = document.getElementById('button-next');
next.addEventListener("click", (event) => {
    next.classList.add('disabled');
});

document.querySelectorAll("#choice").forEach((choice) => {
    choice.addEventListener("click", (event) => {
        next.classList.remove('disabled');
        if ((event.target.innerText) === (choice.dataset.good)) {
            choice.classList.add('choice-good');
            //disabled tous les autres choices
        } else {
            choice.classList.add('choice-bad');
            //disabled tous les autres choices
            next.insertAdjacentHTML("beforebegin", `<p>La bonne réponse était : ${choice.dataset.good}</p>`);
        }
    });
});

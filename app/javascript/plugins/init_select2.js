import $ from 'jquery';
import 'select2';

const enableButton = (button) => {
  console.log("coucou");
}

const select2InUserIndex  = () => {
  $(document).ready(function() {
      $('.search-bar').select2();
  });
  $eventSelect.on("change", function (e) { log("change"); });


  const button = document.getElementById("profil-access-btn")
  document.querySelector(".search-bar").addEventListener("select", enableButton(button));

}

export { select2InUserIndex }

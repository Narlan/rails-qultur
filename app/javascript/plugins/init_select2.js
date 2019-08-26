import $ from 'jquery';
import 'select2';

const enableButton = (button) => {
  console.log("coucou");
}

const select2InUserIndex  = () => {
  $(document).ready(function() {
      $('.search-bar').select2();
  });
}

export { select2InUserIndex }

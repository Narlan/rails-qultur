import $ from 'jquery';
import 'select2';

const select2InUserIndex  = () => {
  $(document).ready(function() {
      $('.search-bar').select2();
  });
}

export { select2InUserIndex }

const nextlevel = document.getElementById('levelup')

if (nextlevel && (parseInt(nextlevel.dataset.level) != 1)) {
  if ((parseInt(nextlevel.dataset.exp / 100 )) - 1 != parseInt(nextlevel.dataset.level)) {

   $(window).on('load', function(){
     $('#myModal').modal('show');
      });
  };
};

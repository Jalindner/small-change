function materializeTasks(){
  $('select').material_select();
  $(".dropdown-button").dropdown();
};

function sideNav() {
$(".button-collapse").sideNav({
    menuWidth: 200, 
    edge: 'right',
    closeOnClick: true
  });
};

function collapseButton() {
  $('.collapsible').collapsible();
};

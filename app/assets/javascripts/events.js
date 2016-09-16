$(document).on('ready page:load',function(){
  $('.datepicker').pickadate({ 
    min: new Date()
  });
  $(".button-collapse").sideNav();
  $('#clock').timepicker();
  $('span:contains("Attending")').closest(".rsvp_status").addClass("t");
  $('span:contains("Declined")').closest(".rsvp_status").addClass("r");
});
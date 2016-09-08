function submissionButtonSetups() {
  $('#ooonew_submission').on('submit', function(event) {
    event.preventDefault();
    /* Act on the event */

    $('#ul-id').on('click', 'li.horse', function(event) {
      event.preventDefault();
      /* Act on the event */
    });
  });
};

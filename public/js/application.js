$(document).ready(function() {
  $('.voteform').on('submit', function(event) {
    event.preventDefault();
    var $form = $(this)
    var data = $form.serialize();

    $.ajax({
      type: $form.attr('method'),
      url: $form.attr('action'),
      data: data
    })
    .done(function(response){
      console.log(response);
      var selector = "#"+response.answer_id;
      $(selector).find($(".vote-count")).text(response.points);
    })
  })


});

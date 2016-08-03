// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  $('#new_addendum').on('submit', function(ev){
    ev.preventDefault()
    $.post({
      url: $(ev.target).attr('action'),
      data: new FormData(ev.target),
      processData: false,
      contentType: false,
      success: function(data) {
        $('#post_addendums').prepend('<div class="row comment" id="addendum_' + data.id + '"><p>' + data.body + '</p><p class="meta">Posted by ' + data.username + '</p>')
        document.getElementById('new_addendum').reset()
        $('#new_addendum input[type="submit"]').prop('disabled', false);
      }
    })
  })


})

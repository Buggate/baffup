$(document).on("click", '.cancel-comment-link', function(e) {
  var $comment, $edit_link, $form, $reply_link, $restore_link, replied;
  e.preventDefault();
  replied = $(this).data('reply');
  $comment = $(this).closest('.comment');
  $form = $(this).closest('form');
  $restore_link = $comment.find('a.delete-comment-link')[0];
  if (replied === true) {
    $reply_link = $comment.find('a.reply-comment-link')[0];
    $reply_link.href = $restore_link.href + "/reply";
  }
  $edit_link = $comment.find('a.edit-comment-link')[0];
  $edit_link.href = $restore_link.href + "/edit";
  return $form.remove();
});

$(document).on('keyup', '.comment_content textarea', function(e) {
  var charsRemaining, comment_id, counter;
  comment_id = $(this).data('comment-id');
  counter = $("#comment_" + comment_id + "_chars_counter");
  charsRemaining = 255 - ($(this).val().length);
  counter.text("Remaining : " + charsRemaining);
  counter.css('color', charsRemaining < 0 ? 'red' : '#818a91');
});

$(document).ajaxError(function(_, xhr) {
  if (xhr.status === 401) {
    return window.location = '/users/sign_in';
  }
});



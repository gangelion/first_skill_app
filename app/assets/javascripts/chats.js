$(function(){
  function buildHTML(data){
    if (data.image) {
      let html = 
      `<div class="message">
          <div class="message_time">
            ${data.created_at}
          </div>
          <p class="chats__content">
            ${data.content}
          </p>
          <img class="message__chat-image" src=${data.image}>
        </div>`
    return html;
  } else {
    let html =
    `<div class="message">
        <div class="message_time">
          ${data.created_at}
        </div>
        <p class="chats__content">
          ${data.content}
        </p>
      </div>`
    return html;
  };
}
  $('.chat__text_box').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.chats__message_user').append(html);
      $('.chats').animate({ scrollTop: $('.chats')[0].scrollHeight });
      $('form')[0].reset();
      $('.chat__send_btn').prop('disabled', false);
      
    })
    .fail(function() {
      alert('メッセージ送信に失敗しました。');
    });
  })
})
$(function(){
  function buildHTML(message){
      let html =
        `<div class="Content--for--message">
            <div class="Content">
              <div class="items">
                <img class="User__image__for--message" src="${message.user_image}">
                <div class="user--name">
                ${message.user_name}
                </div>
              </div>
              <div class="message_box">
              ${message.content}
              </div>
            </div>
          </div>`
      return html
  }

  $('.Form').on('submit', function(e){
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
      console.log("Hey");
      let html = buildHTML(data);
      $('.MainChat__Chat__Content__Box').append(html);      
      $('.Form')[0].reset();
      $('.Hidden').prop('disabled', false);
      $('.MainChat__Chat__Content__Box').animate({ scrollTop: $('.MainChat__Chat__Content__Box')[0].scrollHeight});
    })
    .fail(function(){
      alert('error');
      $('.Hidden').prop('disabled', false);
    })
  });
});
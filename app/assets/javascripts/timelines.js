$(function(){
  $('form.input_message_form input.post').click(function(e){
    // 「Post」ボタンは非Ajaxにする
    var form = $('form.input_message_form');
    form.removeAttr('data-remote');
    form.removeData("remote");
    form.attr('action', form.attr('action').replace('.json', ''));
  });

  $('form.input_message_form').on('ajax:complete', function(event, data, status){
     var json,
         errors;
    
    // Ajaxレスポンス
    if ( status == 'success') {
      json = JSON.parse(data.responseText);
      $('div.alert').html('');
      if(json.timeline) {
        $('div.timeline').prepend(json.timeline);
        $('#timeline_message').val('');
      } else if(json.errors) {
        json.errors.forEach(function(error) {
        $('<p>', {class: 'alert', text: error}).appendTo('div.alert');
        });
      }
      
      
    }
  });
});
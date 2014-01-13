$(function(){
  getMessage(messageCall);
})

function getMessage(callback){
  $(".get_message").click(function(){
    messageId = this.id;
    $.getJSON("messages/"+ messageId, callback);
  })
}

function messageCall(message){
  var column = $("#message-column");
  var content = $("<li>" + message.content + "</li>");
  // var subject = $("<li>").text(message.subject);
  // var content = $("<p>").text(message.content);
  column.empty().append(content);
}

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require almond
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require phoenix
//= require_tree .

require(['application/boot']);

/*
$(document).on("page:change", function(){
  var pusherKey = $("meta[name=pusher_key]").attr("content");
  var pusher = new Pusher(pusherKey, {
    encrypted: false,
    enabledTransports: ["sockjs"],
    wsHost: "localhost",
    wsPort: "4000" });

  var pusherChannel = $("meta[name=pusher_channel]").attr("content");
  var channel = pusher.subscribe(pusherChannel);
  
  channel.bind('new_message', function(data) {
    var new_line = "<p><strong>" + data.name + "<strong>: " + data.message + "</p>";
    $(".message-receiver").append(new_line);
  });
});
*/
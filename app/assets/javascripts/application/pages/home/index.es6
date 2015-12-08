import {Socket} from "phoenix"

export default class Index {
  constructor(root) {
    this.root = root;
  }

  setup() {
    // add event listeners
    console.log('-> Setting up Pusher Lite socket')

    let pusherKey = $("meta[name=pusher_key]").attr("content")
    let socket = new Socket("ws://localhost:4000/socket", {params: {token: pusherKey}})
    socket.connect()
    
    // Now that you are connected, you can join channels with a topic:
    let pusherChannel = $("meta[name=pusher_channel]").attr("content")
    let channel = socket.channel(pusherChannel, {})
    channel.join()
      .receive("ok", resp => { console.log("Joined successfully", resp) })
      .receive("error", resp => { console.log("Unable to join", resp) })

    channel.on("new_message", data => {
      let new_line = `<p><strong>${data.name}<strong>: ${data.message}</p>`
      $(".message-receiver").append(new_line)
    });
  }

  run() {
    // trigger initial action (e.g. perform http requests)
    console.log('-> perform initial actions')
  }
}
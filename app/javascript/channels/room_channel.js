import consumer from "./consumer"

consumer.subscriptions.create({channel:"RoomChannel", room_id: 8}, {
  connected() {
    console.log("connected...")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    const element = document.getElementById('user-id');
    const user_id = Number(element.getAttribute('data-user-id'));

    let hmtl;
    if (user_id == data.message.user_id) {
      hmtl = data.mine
      } 
      else {
        hmtl = data.theirs  
      }
      

    const messageContainer = document.getElementById('messages')
    messageContainer.innerHTML = messageContainer.innerHTML + data.hmtl
    // Called when there's incoming data on the websocket for this channel
  }
});

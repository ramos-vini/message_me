import consumer from "channels/consumer"

import { scroll_chatbox_down, clean_message_input } from "../chatroom"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    document.getElementById('chatroom_chatbox').insertAdjacentHTML("beforeend", data.message_partial);
    scroll_chatbox_down();
    clean_message_input();
  }
});

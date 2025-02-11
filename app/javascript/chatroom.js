function scroll_chatbox_down() {
    const chatbox = document.querySelector("#chatroom_chatbox");

    if(chatbox){
        chatbox.scrollTop = chatbox.scrollHeight;
    }  
}

function clean_message_input() {
    const message_input = document.querySelector("#message_input");
    message_input.value = "";
}

export { scroll_chatbox_down, clean_message_input }
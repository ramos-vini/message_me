// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import Rails from "@rails/ujs";
Rails.start();
import "channels"
import { scroll_chatbox_down } from "./chatroom"

scroll_chatbox_down();
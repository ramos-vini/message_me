class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel", {message_partial: render_message(message)}
    else
      flash[:error] = "Invalid message"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def render_message(message)
    ApplicationController.render(partial: "chatroom/message", locals: {message: message})
  end
end

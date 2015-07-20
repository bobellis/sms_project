class MessagesController < ApplicationController

  def index
    @messages = Message.fill_messages
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Your message was sent!"
      redirect_to new_messages_path
    else
      render 'new'
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  def destroy
    @message = Message.find(:id)
    @message.delete
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end

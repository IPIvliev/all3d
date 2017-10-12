class ApplicationController < ActionController::Base

  #	include DeviseTokenAuth::Concerns::SetUserByToken
  helper_method :mailbox, :conversation
  
  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end
  
end

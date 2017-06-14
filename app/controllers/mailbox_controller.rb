class MailboxController < ApplicationController
  before_action :authenticate_user!

  def inbox
    @inbox = current_user.mailbox.inbox
    @active = :inbox
  end

  def sent
    @sent = current_user.mailbox.sentbox
    @active = :sent
  end

  def trash
    @trash = current_user.mailbox.trash
    @active = :trash
  end

end

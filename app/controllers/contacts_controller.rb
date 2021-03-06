class ContactsController < ApplicationController
	def new
		@message = Contact.new
	end

  def create
    @message = Contact.new(contact_params)

    respond_to do |format|
      if verify_recaptcha(model: @message) && @message.save
        format.html { redirect_to '/contacts.html', :flash => { :success => "Ваше сообщение было успешно отправленно." } }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { redirect_to '/contacts.html',
         :flash => { :danger => "Ваше сообщение не было отправленно. Вы не заполнили одно из обязательных полей или не
         	прошли проверку." } }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :text, :phone, :email)
    end

end

class RegistrationsController < Devise::RegistrationsController

	private

	def sign_up_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :city)
	end

	def update_resource(resource, params)
		resource.update_without_password(params)
	end

	def account_update_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :city)
	end
	
    def after_update_path_for(resource)
      user_path(resource)
    end
end
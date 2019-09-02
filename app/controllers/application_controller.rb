class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_category
  before_action :set_brand

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '5555'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_address_attributes => [:user_id, :postal_code, :city, :block_number, :building, :telephone, :prefecture]])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_detail_attributes => [:user_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day, :mobile_phone]])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:creditcard_attributes => [:user_id, :card_number, :valid_month, :valid_year, :security_code]])
   end

   def set_category
    @parents = Category.order("id ASC").limit(13)
   end

   def set_brand
    @brands = Brand.order("id ASC").limit(5)
   end
end

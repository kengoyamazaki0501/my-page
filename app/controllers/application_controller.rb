class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :gender, :introduction, :facebook, :twitter, :instagram, :youtube])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :introduction])
  end

  private

  def set_search
    @search = Mypage.ransack(params[:q])
  end


end

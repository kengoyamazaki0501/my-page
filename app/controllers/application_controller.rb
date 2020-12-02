class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # デバイスコントローラーが呼ばれた場合一番先に読み込むようにbefore_actionをつける

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gender, :introduction])
  end
end

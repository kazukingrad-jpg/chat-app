class ApplicationController < ActionController::Base
  # before_actionとは、アクションの前に実行されるメソッド
  # 家に入る前の儀式みたいな
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

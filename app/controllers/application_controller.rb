class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  include Pagy::Backend

    # se centraliza el metodo de autorización
    def authorize_request(kind = nil)
      unless kind.include?(current_user.role)
        redirect_to posts_path, alert: "No estás autorizado"
      end
    end

end
